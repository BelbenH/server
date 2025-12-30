import subprocess
import threading
import time
import tkinter as tk
from tkinter import ttk
import psutil
import os
from datetime import datetime

# =========================
# CONFIGURATION
# =========================

EXECUTABLES = [
    r"E:.\xi_connect.exe",
    r"E:.\xi_map.exe",
    r"E:.\xi_search.exe",
    r"E:.\xi_world.exe",
]

WATCH_INTERVAL = 1.0
LOG_DIR = "log"

os.makedirs(LOG_DIR, exist_ok=True)

# =========================
# PROCESS WATCHDOG
# =========================

class ProcessWatchdog:
    def __init__(self, executables, status_callback):
        self.executables = executables
        self.processes = {}
        self.log_files = {}
        self.running = False
        self.shutting_down = False
        self.thread = None
        self.status_callback = status_callback

    def launch_all(self):
        if self.running:
            return

        self.running = True
        self.shutting_down = False

        for exe in self.executables:
            self._launch_process(exe)

        self.thread = threading.Thread(target=self._watch_loop, daemon=True)
        self.thread.start()

    def _launch_process(self, exe):
        try:
            exe_dir = os.path.dirname(exe)
            exe_name = os.path.basename(exe).lower()

            stdout_target = None
            stderr_target = None

            # --- Special handling for xi_map
            if exe_name == "xi_map.exe":
                timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
                log_path = os.path.join(LOG_DIR, f"xi_map_{timestamp}.log")
                log_file = open(log_path, "a", buffering=1, encoding="utf-8", errors="replace")
                self.log_files[exe] = log_file

                proc = subprocess.Popen(
                    exe,
                    cwd=exe_dir,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT,
                    text=True,
                    creationflags=subprocess.CREATE_NEW_PROCESS_GROUP
                )

                self.processes[exe] = proc

                # Start tee thread
                threading.Thread(
                    target=self._tee_output,
                    args=(proc, log_file),
                    daemon=True
                ).start()

            else:
                proc = subprocess.Popen(
                    exe,
                    cwd=exe_dir,
                    creationflags=subprocess.CREATE_NEW_PROCESS_GROUP
                )
                self.processes[exe] = proc

            self.status_callback()

        except Exception as e:
            print(f"Failed to launch {exe}: {e}")

    def _tee_output(self, proc, log_file):
        """Read stdout, print to console, write to file"""
        try:
            for line in proc.stdout:
                print(line, end="")      # live console output
                log_file.write(line)
        except Exception:
            pass

    def _watch_loop(self):
        while self.running and not self.shutting_down:
            for exe, proc in list(self.processes.items()):
                if proc.poll() is not None:
                    if not self.shutting_down:
                        self._launch_process(exe)
            time.sleep(WATCH_INTERVAL)

    def stop_all(self):
        if not self.running:
            return

        self.shutting_down = True
        self.running = False

        time.sleep(WATCH_INTERVAL + 0.1)

        for exe, proc in list(self.processes.items()):
            try:
                parent = psutil.Process(proc.pid)
                for child in parent.children(recursive=True):
                    child.kill()
                parent.kill()
            except Exception:
                pass

            log_file = self.log_files.pop(exe, None)
            if log_file:
                log_file.close()

        self.processes.clear()
        self.shutting_down = False
        self.status_callback()

    def get_status(self):
        return {
            exe: exe in self.processes and self.processes[exe].poll() is None
            for exe in self.executables
        }

# =========================
# GUI
# =========================

class WatchdogGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Server Watchdog")
        self.root.resizable(False, False)

        style = ttk.Style(root)
        style.theme_use("default")
        style.configure("TLabel", foreground="black")
        style.configure("TButton", foreground="black")

        self.watchdog = ProcessWatchdog(EXECUTABLES, self.update_status)
        self.labels = {}

        ttk.Label(root, text="Server Status", font=("Segoe UI", 12, "bold")).pack(pady=6)

        status_frame = ttk.Frame(root)
        status_frame.pack(padx=10, pady=5)

        for exe in EXECUTABLES:
            name = os.path.basename(exe)
            lbl = ttk.Label(status_frame, text=f"{name}: STOPPED")
            lbl.pack(anchor="w")
            self.labels[exe] = lbl

        button_frame = ttk.Frame(root)
        button_frame.pack(pady=10)

        ttk.Button(button_frame, text="Launch Server", command=self.launch).pack(side="left", padx=5)
        ttk.Button(button_frame, text="Close Server", command=self.close).pack(side="left", padx=5)

        self.update_status()

    def launch(self):
        self.watchdog.launch_all()

    def close(self):
        self.watchdog.stop_all()

    def update_status(self):
        status = self.watchdog.get_status()
        for exe, running in status.items():
            name = os.path.basename(exe)
            self.labels[exe].config(
                text=f"{name}: {'RUNNING' if running else 'STOPPED'}"
            )
        self.root.after(1000, self.update_status)

# =========================
# ENTRY POINT
# =========================

if __name__ == "__main__":
    root = tk.Tk()
    app = WatchdogGUI(root)
    root.mainloop()