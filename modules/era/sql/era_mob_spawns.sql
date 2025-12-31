-- Bibiki Bay Zone (IDs 16793800 - 16793846)
-- https://ffxiclopedia.fandom.com/wiki/Bibiki_Bay?oldid=1341291
UPDATE `mob_spawn_points` SET groupid = 27, mobname = 'Hobgoblin_Martialist', polutils_name = 'Hobgoblin Martialist'
WHERE mobid IN (16793823);
UPDATE `mob_spawn_points` SET groupid = 28, mobname = 'Hobgoblin_Animalier', polutils_name = 'Hobgoblin Animalier'
WHERE mobid IN (16793801, 16793824);
UPDATE `mob_spawn_points` SET groupid = 29, mobname = 'Goblins_Rarab', polutils_name = 'Goblins Rarab'
WHERE mobid IN (16793802, 16793825);
UPDATE `mob_spawn_points` SET groupid = 38, mobname = 'Hobgoblin_Blagger', polutils_name = 'Hobgoblin Blagger'
WHERE mobid IN (16793807, 16793827);
UPDATE `mob_spawn_points` SET groupid = 39, mobname = 'Hobgoblin_Toreador', polutils_name = 'Hobgoblin Toreador'
WHERE mobid IN (16793810, 16793828);
UPDATE `mob_spawn_points` SET groupid = 40, mobname = 'Bight_Rarab', polutils_name = 'Bight Rarab'
WHERE mobid IN (16793803, 16793808, 16793806, 16793829, 16793831, 16793832, 16793846);
UPDATE `mob_spawn_points` SET groupid = 41, mobname = 'Camelopard', polutils_name = 'Camelopard'
WHERE mobid IN (16793812, 16793813, 16793816, 16793817, 16793834, 16793836, 16793837);
UPDATE `mob_spawn_points` SET groupid = 42, mobname = 'Hobgoblin_Physician', polutils_name = 'Hobgoblin Physician'
WHERE mobid IN (16793818, 16793838, 16793843);
UPDATE `mob_spawn_points` SET groupid = 43, mobname = 'Hobgoblin_Alastor', polutils_name = 'Hobgoblin Alastor'
WHERE mobid IN (16793821, 16793839, 16793840);
UPDATE `mob_spawn_points` SET groupid = 44, mobname = 'Hypnos_Eft', polutils_name = 'Hypnos Eft'
WHERE mobname = 'Locus_Ghost_Crab' OR mobname = 'Locus_Hypnos_Eft';
UPDATE `mob_spawn_points` SET groupid = 45, mobname = 'Hobgoblin_Angler', polutils_name = 'Hobgoblin Angler'
WHERE mobid IN (16793800, 16793842);

-- Gusgen Mines (Needs perfect revision)
-- https://ffxiclopedia.fandom.com/wiki/Gusgen_Mines?oldid=1271411
UPDATE `mob_spawn_points` SET groupid = 22, mobname = 'Wight', polutils_name = 'Wight'
WHERE mobname = 'Accursed_Soldier';
UPDATE `mob_spawn_points` SET groupid = 45, mobname = 'Wight', polutils_name = 'Wight'
WHERE mobname = 'Accursed_Sorcerer';
UPDATE `mob_spawn_points` SET groupid = 20, mobname = 'Sadfly', polutils_name = 'Sadfly'
WHERE mobname = 'Madfly';
UPDATE `mob_spawn_points` SET groupid = 16, mobname = 'Ore_Eater', polutils_name = 'Ore Eater'
WHERE mobname = 'Rockmill';

-- Dangruf Wadi (Needs perfect revision)
-- https://ffxiclopedia.fandom.com/wiki/Dangruf_Wadi?oldid=822577
-- INSERT INTO `mob_groups` VALUES (19,6666,191,'Goblin_Brigand',330,0,1119,0,0,86,89,0);
-- INSERT INTO `mob_groups` VALUES (20,6671,191,'Goblin_Headsman',330,0,1035,0,0,86,90,0);
-- INSERT INTO `mob_groups` VALUES (21,6664,191,'Goblin_Healer',330,0,2881,0,0,86,90,0);
-- INSERT INTO `mob_groups` VALUES (22,6415,191,'Witchetty_Grub',330,0,3357,0,0,86,90,0);
-- INSERT INTO `mob_groups` VALUES (23,6398,191,'Couloir_Leech',330,0,2599,0,0,87,88,0);
-- INSERT INTO `mob_groups` VALUES (24,5354,191,'Prim_Pika',330,0,2026,0,0,86,90,0);
-- INSERT INTO `mob_groups` VALUES (25,5352,191,'Natty_Gibbon',330,0,3188,0,0,90,93,0);
-- INSERT INTO `mob_groups` VALUES (26,6367,191,'Trimmer',330,0,2490,0,0,90,92,0);
-- INSERT INTO `mob_groups` VALUES (27,5644,191,'Fume_Lizard',330,0,922,0,0,86,89,0);
-- INSERT INTO `mob_groups` VALUES (28,6670,191,'Goblin_Conjurer',330,0,3187,0,0,86,91,0);
-- INSERT INTO `mob_groups` VALUES (29,6660,191,'Goblin_Bladesmith',330,0,1026,0,0,86,91,0);
-- INSERT INTO `mob_groups` VALUES (30,6665,191,'Goblin_Bushwhacker',330,0,1031,0,0,90,91,0);

-- Bhaflau Thickets
UPDATE `mob_spawn_points` SET groupid = 150, mobname = 'Greater_Colibri', polutils_name = 'Greater Colibri'
WHERE mobname = 'Locus_Colibri';
UPDATE `mob_spawn_points` SET groupid = 151, mobname = 'Wivre', polutils_name = 'Wivre'
WHERE mobname = 'Locus_Wivre';

-- The Boyhada Tree
UPDATE `mob_spawn_points` SET groupid = 21, mobname = 'Steelshell', polutils_name = 'Steelshell'
WHERE mobname = 'Viseclaw';
UPDATE `mob_spawn_points` SET groupid = 22, mobname = 'Processionaire', polutils_name = 'Processionaire'
WHERE mobname = 'Mourning_Crawler';
UPDATE `mob_spawn_points` SET groupid = 23, mobname = 'Darter', polutils_name = 'Darter'
WHERE mobname = 'Snaggletooth_Peapuk';

-- Ranguemont Pass
UPDATE `mob_spawn_points` SET groupid = 17, mobname = 'Bat_Eye', polutils_name = 'Bat Eye'
WHERE mobname = 'Hovering_Oculus';
UPDATE `mob_spawn_points` SET groupid = 12, mobname = 'Stirge', polutils_name = 'Stirge'
WHERE mobname = 'Bilesucker';
UPDATE `mob_spawn_points` SET groupid = 100, mobname = 'Goblin_Furrier', polutils_name = 'Goblin Furrier'
WHERE mobname = 'Goblin_Hoodoo';
UPDATE `mob_spawn_points` SET groupid = 101, mobname = 'Goblin_Smithy', polutils_name = 'Goblin Smithy'
WHERE mobname = 'Goblin_Artificer';
UPDATE `mob_spawn_points` SET groupid = 102, mobname = 'Goblin_Shaman', polutils_name = 'Goblin Shaman'
WHERE mobname = 'Goblin_Tanner';
UPDATE `mob_spawn_points` SET groupid = 103, mobname = 'Goblin_Pathfinder', polutils_name = 'Goblin Pathfinder'
WHERE mobname = 'Goblin_Chaser';
UPDATE `mob_groups` SET minLevel = 25, maxLevel = 27 WHERE name = 'Goblins_Bats' AND zoneid = 166;

-- The Bostaunieux Obliette
UPDATE `mob_spawn_points` SET groupid = 6, mobname = 'Werebat', polutils_name = 'Werebat'
WHERE mobname = 'Blind_Bat';
UPDATE `mob_spawn_points` SET groupid = 10, mobname = 'Mousse', polutils_name = 'Mousse'
WHERE mobname = 'Panna_Cotta';
UPDATE `mob_spawn_points` SET groupid = 22, mobname = 'Gespenst', polutils_name = 'Gespenst'
WHERE mobname = 'Nachtmahr';
UPDATE `mob_spawn_points` SET groupid = 8, mobname = 'Garm', polutils_name = 'Garm'
WHERE mobname = 'Dabilla';
UPDATE `mob_groups` SET minLevel = 65, maxLevel = 68, dropid = 27, respawntime = 1080 WHERE name = 'Wurdalak'; -- Demon Abjucator droplist (Phalanx custom OOE mob)

-- The Toromarai Canal
UPDATE `mob_spawn_points` SET groupid = 22, mobname = 'Stygian_Pugil', polutils_name = 'Stygian Pugil'
WHERE mobname = 'Blackwater_Pugil';
UPDATE `mob_spawn_points` SET groupid = 15, mobname = 'Scavenger_Crab', polutils_name = 'Scavenger Crab'
WHERE mobname = 'Plunderer_Crab';
UPDATE `mob_spawn_points` SET groupid = 33, mobname = 'Impish_Bats', polutils_name = 'Impish Bats'
WHERE mobname = 'Deviling_Bats';
UPDATE `mob_spawn_points` SET groupid = 16, mobname = 'Fleshcraver', polutils_name = 'Fleshcraver'
WHERE mobname = 'Sodden_Bones';
UPDATE `mob_spawn_points` SET groupid = 17, mobname = 'Mindcraver', polutils_name = 'Mindcraver'
WHERE mobname = 'Drowned_Bones';
UPDATE `mob_spawn_points` SET groupid = 41, mobname = 'Starmite', polutils_name = 'Starmite'
WHERE mobname = 'Starborer';
UPDATE `mob_spawn_points` SET groupid = 100, mobname = 'Cutlass_Scorpion', polutils_name = 'Cutlass Scorpion'
WHERE mobname = 'Rapier_Scorpion';

-- Korroloka Tunnel
UPDATE `mob_spawn_points` SET groupid = 13, mobname = 'Clipper', polutils_name = 'Clipper'
WHERE mobname = 'Lacerator';
UPDATE `mob_spawn_points` SET groupid = 6, mobname = 'Thread_Leech', polutils_name = 'Thread Leech'
WHERE mobname = 'Spool_Leech';

-- King Ranperre's Tomb
UPDATE `mob_spawn_points` SET groupid = 100, mobname = 'Tomb_Worm', polutils_name = 'Tomb Worm'
WHERE mobname = 'Locus_Tomb_Worm';
UPDATE `mob_spawn_points` SET groupid = 101, mobname = 'Dire_Bat', polutils_name = 'Dire Bat'
WHERE mobname = 'Locus_Dire_Bat';
UPDATE `mob_spawn_points` SET groupid = 102, mobname = 'Cutlass_Scorpion', polutils_name = 'Cutlass Scorpion'
WHERE mobname = 'Locus_Cutlass_Scorpion';
UPDATE `mob_spawn_points` SET groupid = 103, mobname = 'Thousand_Eyes', polutils_name = 'Thousand Eyes'
WHERE mobname = 'Locus_Thousand_Eyes';
UPDATE `mob_spawn_points` SET groupid = 104, mobname = 'Armet_Beetle', polutils_name = 'Armet Beetle'
WHERE mobname = 'Locus_Armet_Beetle';
UPDATE `mob_spawn_points` SET groupid = 31, mobname = 'Spartoi_Warrior', polutils_name = 'Spartoi Warrior'
WHERE mobname = 'Locus_Spartoi_Warrior';
UPDATE `mob_spawn_points` SET groupid = 32, mobname = 'Spartoi_Sorcerer', polutils_name = 'Spartoi Sorcerer'
WHERE mobname = 'Locus_Spartoi_Sorcerer';

-- Horutoto Ruins
-- https://ffxiclopedia.fandom.com/wiki/Inner_Horutoto_Ruins?oldid=1086909
UPDATE `mob_spawn_points` SET groupid = 29, mobname = 'Beady_Beetle', polutils_name = 'Beady Beetle'
WHERE mobname = 'Deathwatch_Beetle';
UPDATE `mob_spawn_points` SET groupid = 21, mobname = 'Battle_Bat', polutils_name = 'Battle Bat'
WHERE mobname = 'Covin_Bat';
UPDATE `mob_spawn_points` SET groupid = 2, mobname = 'Goblin_Thug', polutils_name = 'Goblin Thug'
WHERE mobname = 'Goblin_Lurcher';
UPDATE `mob_spawn_points` SET groupid = 2, mobname = 'Goblin_Thug', polutils_name = 'Goblin Thug'
WHERE mobname = 'Goblin_Flesher';
UPDATE `mob_spawn_points` SET groupid = 4, mobname = 'Goblin_Weaver', polutils_name = 'Goblin Weaver'
WHERE mobname = 'Goblin_Trailblazer';
UPDATE `mob_spawn_points` SET groupid = 4, mobname = 'Goblin_Weaver', polutils_name = 'Goblin Weaver'
WHERE mobname = 'Goblin_Metallurgist';
UPDATE `mob_spawn_points` SET groupid = 1, mobname = 'Battue_Bats', polutils_name = 'Battue Bats'
WHERE mobname = 'Troika_Bats';
UPDATE `mob_spawn_points` SET groupid = 5, mobname = 'Magicked_Bones', polutils_name = 'Magicked Bones'
WHERE mobname = 'Skinnymalinks';
UPDATE `mob_spawn_points` SET groupid = 28, mobname = 'Magicked_Bones', polutils_name = 'Magicked Bones'
WHERE mobname = 'Skinnymajinx';

-- Ordelle's Caves
UPDATE `mob_spawn_points` SET groupid = 21, mobname = 'Vorpal_Bunny', polutils_name = 'Vorpal Bunny'
WHERE mobname = 'Buds_Bunny';
UPDATE `mob_spawn_points` SET groupid = 55, mobname = 'Poison_Leech', polutils_name = 'Poison Leech'
WHERE mobname = 'Bilis_Leech';
UPDATE `mob_spawn_points` SET groupid = 38, mobname = 'Slash_Pine', polutils_name = 'Slash Pine'
WHERE mobname = 'Swagger_Spruce';
UPDATE `mob_spawn_points` SET groupid = 29, mobname = 'Goliath_Beetle', polutils_name = 'Goliath Beetle'
WHERE mobname = 'Targe_Beetle';

-- The Eldieme Necropolis
UPDATE `mob_spawn_points` SET groupid = 42, mobname = 'Tomb_Warrior', polutils_name = 'Tomb Warrior'
WHERE mobname = 'Hellbound_Warrior';
UPDATE `mob_spawn_points` SET groupid = 43, mobname = 'Tomb_Mage', polutils_name = 'Tomb Mage'
WHERE mobname = 'Hellbound_Warlock';

-- Crawler's Nest
UPDATE `mob_spawn_points` SET groupid = 13, mobname = 'Soldier_Crawler', polutils_name = 'Soldier Crawler'
WHERE mobname = 'King_Crawler';
UPDATE `mob_spawn_points` SET groupid = 32, mobname = 'Wespe', polutils_name = 'Wespe'
WHERE mobname = 'Vespo';
UPDATE `mob_spawn_points` SET groupid = 14, mobname = 'Hornfly', polutils_name = 'Hornfly'
WHERE mobname = 'Dancing_Jewel';
UPDATE `mob_spawn_points` SET groupid = 15, mobname = 'Exoray', polutils_name = 'Exoray'
WHERE mobname = 'Olid_Funguar';

-- Maze of Shakrami
UPDATE `mob_spawn_points` SET groupid = 17, mobname = 'Poison_Leech', polutils_name = 'Poison Leech'
WHERE mobname = 'Bleeder_Leech';
UPDATE `mob_spawn_points` SET groupid = 25, mobname = 'Seeker_Bats', polutils_name = 'Seeker Bats'
WHERE mobname = 'Chaser_Bats';
UPDATE `mob_spawn_points` SET groupid = 32, mobname = 'Caterchipillar', polutils_name = 'Caterchipillar'
WHERE mobname = 'Crypterpillar';
UPDATE `mob_spawn_points` SET groupid = 24, mobname = 'Ancient_Bat', polutils_name = 'Ancient Bat'
WHERE mobname = 'Warren_Bat';

-- Garlaige Citadel
UPDATE `mob_spawn_points` SET groupid = 36, mobname = 'Funnel_Bats', polutils_name = 'Funnel Bats'
WHERE mobname = 'Fortalice_Bats';
UPDATE `mob_spawn_points` SET groupid = 26, mobname = 'Chamber_Beetle', polutils_name = 'Chamber Beetle'
WHERE mobname = 'Warden_Beetle';

-- Fei'yin
UPDATE `mob_spawn_points` SET groupid = 12, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid = 17612882;
UPDATE `mob_spawn_points` SET groupid = 13, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid IN (17612884, 17612902);
UPDATE `mob_spawn_points` SET groupid = 14, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid IN (17612905, 17612917);
UPDATE `mob_spawn_points` SET groupid = 15, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid IN (17612888, 17612914);
UPDATE `mob_spawn_points` SET groupid = 13, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid IN (17612927, 17612928);
UPDATE `mob_spawn_points` SET groupid = 14, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid IN (17612932, 17612933);
UPDATE `mob_spawn_points` SET groupid = 15, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid IN (17612939, 17612940);
UPDATE `mob_spawn_points` SET groupid = 2, mobname = 'Revenant', polutils_name = 'Revenant'
WHERE mobname = 'Wekufe';
UPDATE `mob_spawn_points` SET groupid = 8, mobname = 'Clockwork_Pod', polutils_name = 'Clockwork Pod'
WHERE mobname = 'Sentient_Carafe';
UPDATE `mob_spawn_points` SET groupid = 4, mobname = 'Vampire_Bat', polutils_name = 'Vampire Bat'
WHERE mobname = 'Balayang';
UPDATE `mob_spawn_points` SET groupid = 12, mobname = 'Shadow', polutils_name = 'Shadow'
WHERE mobid = 17612925;

-- Labyrinth of Onzozo
UPDATE `mob_spawn_points` SET pos_x = 28, pos_y = 5, pos_z = 290 WHERE mobid = 17649827; -- Wyvern
UPDATE `mob_spawn_points` SET pos_x = 10, pos_y = 5, pos_z = 280 WHERE mobid = 17649826; -- Manticore
UPDATE `mob_spawn_points` SET pos_x = 39, pos_y = 3, pos_z = 280 WHERE mobid = 17649821; -- Manticore