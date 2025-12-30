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
UPDATE `mob_spawn_points`SET groupid = 42, mobname = 'Hobgoblin_Physician', polutils_name = 'Hobgoblin Physician'
WHERE mobid IN (16793818, 16793838, 16793843);
UPDATE `mob_spawn_points`SET groupid = 43, mobname = 'Hobgoblin_Alastor', polutils_name = 'Hobgoblin Alastor'
WHERE mobid IN (16793821, 16793839, 16793840);
UPDATE `mob_spawn_points` SET groupid = 44, mobname = 'Hypnos_Eft', polutils_name = 'Hypnos Eft'
WHERE mobname = 'Locus_Ghost_Crab' OR mobname = 'Locus_Hypnos_Eft';
UPDATE `mob_spawn_points`SET groupid = 45, mobname = 'Hobgoblin_Angler', polutils_name = 'Hobgoblin Angler'
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
-- INSERT INTO `mob_groups` VALUES (20,6606,166,'Hovering_Oculus',330,0,3196,0,0,87,92,0);
-- INSERT INTO `mob_groups` VALUES (21,6459,166,'Bilesucker',330,0,461,0,0,87,92,0);
-- INSERT INTO `mob_groups` VALUES (22,6657,166,'Goblin_Hoodoo',330,0,1149,0,0,86,90,0);
-- INSERT INTO `mob_groups` VALUES (23,6662,166,'Goblin_Artificer',330,0,1163,0,0,88,90,0);
-- INSERT INTO `mob_groups` VALUES (24,6655,166,'Goblin_Tanner',330,0,1065,0,0,88,90,0);
-- INSERT INTO `mob_groups` VALUES (25,6668,166,'Goblin_Chaser',330,0,1124,0,0,88,90,0);
-- INSERT INTO `mob_groups` VALUES (26,1721,166,'Goblins_Bats',0,128,0,0,0,83,84,0);

-- The Bostaunieux Obliette
-- INSERT INTO `mob_groups` VALUES (15,6475,167,'Blind_Bat',300,0,2165,0,0,94,99,0);
-- INSERT INTO `mob_groups` VALUES (16,6411,167,'Panna_Cotta',300,0,1972,0,0,95,96,0);
-- INSERT INTO `mob_groups` VALUES (17,6509,167,'Nachtmahr',300,0,2164,0,0,96,97,0);
-- INSERT INTO `mob_groups` VALUES (18,6527,167,'Dabilla',300,0,2878,0,0,94,97,0);
-- INSERT INTO `mob_groups` VALUES (19,6582,167,'Wurdalak',300,0,2882,0,0,97,99,0);

-- The Toromarai Canal
-- INSERT INTO `mob_groups` VALUES (24,619,169,'Blackwater_Pugil',330,0,3204,0,0,96,98,0);
-- INSERT INTO `mob_groups` VALUES (25,6366,169,'Plunderer_Crab',330,0,3200,0,0,95,98,0);
-- INSERT INTO `mob_groups` VALUES (28,6426,169,'Deviling_Bats',330,0,3198,0,0,95,97,0);
-- INSERT INTO `mob_groups` VALUES (29,6541,169,'Sodden_Bones',330,0,3203,0,0,95,98,0);
-- INSERT INTO `mob_groups` VALUES (30,6534,169,'Drowned_Bones',330,0,3199,0,0,95,98,0);
-- INSERT INTO `mob_groups` VALUES (31,6073,169,'Starborer',330,0,3108,0,0,95,97,0);
-- INSERT INTO `mob_groups` VALUES (32,6335,169,'Rapier_Scorpion',330,0,3202,0,0,95,99,0);
-- INSERT INTO `mob_groups` VALUES (35,6377,169,'Poroggo_Excavator',330,0,3201,0,0,97,99,0);
-- INSERT INTO `mob_groups` VALUES (36,6378,169,'Flume_Toad',330,0,3205,0,0,94,96,0);

-- Korroloka Tunnel
UPDATE `mob_spawn_points` SET groupid = 13, mobname = 'Clipper', polutils_name = 'Clipper'
WHERE mobname = 'Lacerator';
UPDATE `mob_spawn_points` SET groupid = 6, mobname = 'Thread_Leech', polutils_name = 'Thread Leech'
WHERE mobname = 'Spool_Leech';

-- King Ranperre's Tomb
-- INSERT INTO `mob_groups` VALUES (26,3946,190,'Locus_Tomb_Worm',330,0,428,293000,0,131,133,0);
-- INSERT INTO `mob_groups` VALUES (27,6460,190,'Locus_Dire_Bat',330,0,461,300000,0,133,135,0);
-- INSERT INTO `mob_groups` VALUES (28,6801,190,'Locus_Cutlass_Scorpion',330,0,549,305000,0,135,137,0);
-- INSERT INTO `mob_groups` VALUES (29,6391,190,'Locus_Thousand_Eyes',300,0,2402,305
-- INSERT INTO `mob_groups` VALUES (30,1898,190,'Hati',960,0,1278,0,0,135,137,0);
-- INSERT INTO `mob_groups` VALUES (36,244,190,'Locus_Armet_Beetle',330,0,670,302500,0,134,136,0);
-- INSERT INTO `mob_groups` VALUES (50,7059,190,'Locus_Spartoi_Sorcerer',960,0,2301,311800,0,135,137,0);
-- INSERT INTO `mob_groups` VALUES (49,7060,190,'Locus_Spartoi_Warrior',960,0,2125,311800,0,135,137,0);

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
WHERE mobname = 'Skinnymajinx';
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
WHERE mobname = 'Exoray';

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
-- INSERT INTO `mob_groups` VALUES (16,6513,204,'Wekufe',330,0,2530,0,0,97,99,0);
-- INSERT INTO `mob_groups` VALUES (17,6598,204,'Sentient_Carafe',330,0,3191,0,0,95,99,0);
-- INSERT INTO `mob_groups` VALUES (18,6474,204,'Balayang',330,0,3190,0,0,95,99,0);
-- INSERT INTO `mob_groups` VALUES (40,6892,204,'Orientalis_Shadow',0,128,0,0,0,128,128,0);
-- INSERT INTO `mob_groups` VALUES (41,6893,204,'Borealis_Shadow',0,128,0,0,0,128,128,0);
-- INSERT INTO `mob_groups` VALUES (42,6894,204,'Australis_Shadow',0,128,0,0,0,128,128,0);
-- INSERT INTO `mob_groups` VALUES (43,6895,204,'Occidentalis_Shadow',0,128,0,0,0,128,128,0);
-- INSERT INTO `mob_groups` VALUES (44,6896,204,'Carousing_Celine',0,128,0,0,0,128,128,0);
-- INSERT INTO `mob_groups` VALUES (45,6889,204,'Arcus_Blades',0,128,0,0,0,125,125,0);

-- Labyrinth of Onzozo
UPDATE `mob_spawn_points` SET pos_x = 28, pos_y = 5, pos_z = 290 WHERE mobid = 17649827; -- Wyvern
UPDATE `mob_spawn_points` SET pos_x = 10, pos_y = 5, pos_z = 280 WHERE mobid = 17649826; -- Manticore
UPDATE `mob_spawn_points` SET pos_x = 39, pos_y = 3, pos_z = 280 WHERE mobid = 17649821; -- Manticore