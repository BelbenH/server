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
-- INSERT INTO `mob_groups` VALUES (23,6532,196,'Accursed_Soldier',300,0,678,0,0,85,89,0);
-- INSERT INTO `mob_groups` VALUES (24,6537,196,'Accursed_Sorcerer',300,0,769,0,0,85,89,0);

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

-- Promyvion Dem
-- INSERT INTO `mob_groups` VALUES (2,2048,18,'Idle_Wanderer',960,0,1350,0,0,83,84,0);

-- Promyvion Holla
-- INSERT INTO `mob_groups` VALUES (3,2048,16,'Idle_Wanderer',960,0,1350,0,0,83,84,0);

-- Promyvion Mea
-- INSERT INTO `mob_groups` VALUES (3,2048,20,'Idle_Wanderer',960,0,1350,0,0,83,84,0);

-- Promyvion Vahzl
-- INSERT INTO `mob_groups` VALUES (7,2048,22,'Idle_Wanderer',960,0,1350,0,0,84,85,0);

-- Bhaflau Thickets
-- INSERT INTO `mob_groups` VALUES (52,1802,52,'Locus_Colibri',330,0,1225,0,0,133,135,0);
-- INSERT INTO `mob_groups` VALUES (53,4355,52,'Locus_Wivre',330,0,2952,0,0,135,137,0);

-- Lufaise Meadows
-- INSERT INTO `mob_groups` VALUES (75,4692,24,'Abununnu',0,128,0,0,9999,105,106,0);
-- INSERT INTO `mob_groups` VALUES (76,4691,24,'Gloam_Servitor_mage',0,128,0,0,9999,101,102,0);
-- INSERT INTO `mob_groups` VALUES (77,4690,24,'Gloam_Servitor_melee',0,128,0,0,0,101,102,0);

-- Phomiuna Aqueducts
-- INSERT INTO `mob_groups` VALUES (44,4531,27,'Aqueduct_Spider',330,0,3006,0,0,84,85,0);

-- Sacrarium
-- INSERT INTO `mob_groups` VALUES (41,4531,28,'Aqueduct_Spider',330,0,3006,0,0,84,86,0);

-- Tememos
-- INSERT INTO `mob_groups` VALUES (122,6153,37,'Temenos_Aern_nin',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (123,6154,37,'Temenos_Aern_drg',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (124,6155,37,'Temenos_Aern_war',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (125,6156,37,'Temenos_Aern_blm',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (126,6157,37,'Temenos_Aern_brd',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (127,6158,37,'Temenos_Aern_mnk',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (128,6159,37,'Temenos_Aern_sam',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (129,6160,37,'Temenos_Aern_thf',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (130,6161,37,'Temenos_Aern_rng',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (131,6162,37,'Temenos_Aern_bst',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (132,6163,37,'Temenos_Aern_whm',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (133,6164,37,'Temenos_Aern_rdm',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (134,6165,37,'Temenos_Aern_smn',0,128,2861,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (135,6166,37,'Temenos_Aern_drk',0,128,2861,0,0,101,102,0);

-- Appolyon
-- INSERT INTO `mob_groups` VALUES (82,6106,38,'Apollyon_Demon_blm',0,128,2865,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (83,6107,38,'Apollyon_Demon_pld',0,128,2865,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (84,6108,38,'Apollyon_Demon_drk',0,128,2865,0,0,101,102,0);
-- INSERT INTO `mob_groups` VALUES (85,6109,38,'Apollyon_Demon_rdm',0,128,2865,0,0,101,102,0);

-- Mount Zhayolm
-- INSERT INTO `mob_groups` VALUES (54,3465,61,'Sarameya',0,128,2162,50000,0,88,89,0);
-- INSERT INTO `mob_groups` VALUES (55,5191,61,'Vanasarvik',0,128,0,0,25000,99,99,0);
-- INSERT INTO `mob_groups` VALUES (56,6751,61,'Elders_Imp',0,128,0,0,0,99,99,0);
-- INSERT INTO `mob_groups` VALUES (57,6752,61,'Grand_Grenade',0,128,0,0,0,99,99,0);
-- INSERT INTO `mob_groups` VALUES (58,6753,61,'Sarama',0,128,0,0,0,99,99,0);

-- Mamook
-- INSERT INTO `mob_groups` VALUES (70,6756,65,'Predatory_Colibri',0,128,0,0,0,99,99,0);

-- Aydeewa Subterrane
-- INSERT INTO `mob_groups` VALUES (37,0,68,'Tumult_Curator',0,128,0,0,0,99,99,0);
-- INSERT INTO `mob_groups` VALUES (38,0,68,'Tumult_Lamp',0,128,0,0,0,99,99,0);

-- The Boyhada Tree
-- INSERT INTO `mob_groups` VALUES (25,4578,153,'Mourning_Crawler',330,0,3007,0,0,103,105,0);
-- INSERT INTO `mob_groups` VALUES (26,4577,153,'Snaggletooth_Peapuk',330,0,2814,0,0,102,105,0);
-- INSERT INTO `mob_groups` VALUES (27,6369,153,'Viseclaw',330,0,3197,0,0,102,105,0);

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

-- Korroloka Tunnel
-- INSERT INTO `mob_groups` VALUES (18,4816,173,'Lacerator',330,0,0,0,0,87,91,0);
-- INSERT INTO `mob_groups` VALUES (19,6404,173,'Spool_Leech',330,0,79,0,0,87,91,0);

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
-- INSERT INTO `mob_groups` VALUES (18,5356,193,'Buds_Bunny',330,0,326,0,0,83,89,0);
-- INSERT INTO `mob_groups` VALUES (19,6395,193,'Bilis_Leech',330,0,2599,0,0,83,89,0);
-- INSERT INTO `mob_groups` VALUES (24,6352,193,'Swagger_Spruce',330,0,3358,0,0,86,89,0);
-- INSERT INTO `mob_groups` VALUES (25,6074,193,'Targe_Beetle',330,0,670,0,0,83,89,0);

-- The Eldieme Necropolis
-- INSERT INTO `mob_groups` VALUES (15,6531,195,'Hellbound_Warrior',330,0,0,0,0,91,95,0);
-- INSERT INTO `mob_groups` VALUES (16,6536,195,'Hellbound_Warlock',330,0,769,0,0,91,95,0);

-- Crawler's Nest
-- INSERT INTO `mob_groups` VALUES (16,5839,197,'King_Crawler',300,0,3008,0,0,91,96,0);
-- INSERT INTO `mob_groups` VALUES (17,3335,197,'Vespo',300,0,584,0,0,92,96,0);
-- INSERT INTO `mob_groups` VALUES (18,6325,197,'Dancing_Jewel',300,0,923,0,0,93,96,0);
-- INSERT INTO `mob_groups` VALUES (19,6344,197,'Olid_Funguar',300,0,1440,0,0,93,96,0);

-- Maze of Shakrami
-- INSERT INTO `mob_groups` VALUES (18,6401,198,'Bleeder_Leech',300,0,18,0,0,83,85,0);
-- INSERT INTO `mob_groups` VALUES (21,6437,198,'Chaser_Bats',300,0,82,0,0,83,85,0);
-- INSERT INTO `mob_groups` VALUES (22,6314,198,'Crypterpillar',300,0,422,0,0,86,88,0);
-- INSERT INTO `mob_groups` VALUES (23,6451,198,'Warren_Bat',300,0,461,0,0,86,88,0);

-- Garlaige Citadel
-- INSERT INTO `mob_groups` VALUES (15,6425,200,'Fortalice_Bats',300,0,82,0,0,92,96,0);
-- INSERT INTO `mob_groups` VALUES (35,6072,200,'Warden_Beetle',300,0,670,0,0,92,96,0);

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
-- INSERT INTO `mob_groups` VALUES (31,6542,213,'Babaulas',330,0,3194,0,0,95,98,0);
-- INSERT INTO `mob_groups` VALUES (32,6538,213,'Boribaba',330,0,3194,0,0,95,98,0);