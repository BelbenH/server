import subprocess
import threading
import time
import tkinter as tk
from tkinter import ttk
import psutil
import os
import signal

# =========================
# CONFIGURATION
# =========================

EXECUTABLES = [
    r".\xi_connect.exe",
    r".\xi_search.exe",
    r".\xi_world.exe",
    r".\xi_map.exe",
]

WATCH_INTERVAL = 5.0  # seconds

# =========================
# WATCHDOG LOGIC
# =========================

class ProcessWatchdog:
    def __init__(self, executables, status_callback):
        self.executables = executables
        self.processes = {}  # exe_path -> subprocess.Popen
        self.running = False
        self.thread = None
        self.status_callback = status_callback

    def launch_all(self):
        for exe in self.executables:
            self._launch_process(exe)

        self.running = True
        self.thread = threading.Thread(target=self._watch_loop, daemon=True)
        self.thread.start()

    def _launch_process(self, exe):
        try:
            exe_dir = os.path.dirname(exe)

            proc = subprocess.Popen(
                exe,
                cwd=exe_dir,
                creationflags=subprocess.CREATE_NEW_PROCESS_GROUP
            )

            self.processes[exe] = proc
            self.status_callback()
        except Exception as e:
            print(f"Failed to launch {exe}: {e}")

    def _watch_loop(self):
        while self.running:
            for exe, proc in list(self.processes.items()):
                if proc.poll() is not None:
                    # Process crashed or exited
                    self._launch_process(exe)
            time.sleep(WATCH_INTERVAL)

    def stop_all(self):
        # 1) Stop the watchdog loop FIRST
        self.running = False

        # 2) Give the watch loop time to exit cleanly
        time.sleep(WATCH_INTERVAL + 0.1)

        # 3) Now kill processes
        for proc in self.processes.values():
            try:
                parent = psutil.Process(proc.pid)
                for child in parent.children(recursive=True):
                    child.kill()
                parent.kill()
            except Exception:
                pass

        self.processes.clear()
        self.status_callback()

    def get_status(self):
        status = {}
        for exe in self.executables:
            proc = self.processes.get(exe)
            status[exe] = proc is not None and proc.poll() is None
        return status

# =========================
# GUI
# =========================

class WatchdogGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Server Watchdog")
        self.root.resizable(False, False)

        self.watchdog = ProcessWatchdog(EXECUTABLES, self.update_status)

        self.labels = {}

        ttk.Label(root, text="Server Status", font=("Segoe UI", 12, "bold")).pack(pady=5)

        self.status_frame = ttk.Frame(root)
        self.status_frame.pack(padx=10, pady=5)

        for exe in EXECUTABLES:
            name = os.path.basename(exe)
            lbl = ttk.Label(self.status_frame, text=f"{name}: STOPPED")
            lbl.pack(anchor="w")
            self.labels[exe] = lbl

        self.button_frame = ttk.Frame(root)
        self.button_frame.pack(pady=10)

        ttk.Button(self.button_frame, text="Launch Server", command=self.launch).pack(side="left", padx=5)
        ttk.Button(self.button_frame, text="Close Server", command=self.close).pack(side="left", padx=5)

        self.update_status()

    def launch(self):
        if not self.watchdog.running:
            self.watchdog.launch_all()
        self.update_status()

    def close(self):
        self.watchdog.stop_all()
        self.update_status()

    def update_status(self):
        status = self.watchdog.get_status()
        for exe, running in status.items():
            name = os.path.basename(exe)
            text = f"{name}: RUNNING" if running else f"{name}: STOPPED"
            self.labels[exe].config(text=text)

        self.root.after(1000, self.update_status)

# =========================
# ENTRY POINT
# =========================

if __name__ == "__main__":
    root = tk.Tk()
    style = ttk.Style(root)

    # Force a predictable theme
    style.theme_use("default")

    # Explicit colors
    style.configure(
        "TLabel",
        foreground="black",
        background=root.cget("background")
    )

    style.configure(
        "TButton",
        foreground="black"
    )

    app = WatchdogGUI(root)
    root.mainloop()