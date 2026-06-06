-- -------------------------------------------------
-- Zone: Northern San d'Oria
-- -------------------------------------------------
-- Jeanvirgaud
UPDATE `npc_list` 
SET 
    `pos_rot` = 122, 
    `pos_x` = -218.279, 
    `pos_y` = 8.00, 
    `pos_z` = 18.265 
WHERE `npcid` = 17723597; 
-- Excenmille
UPDATE `npc_list` 
SET 
    `pos_rot` = 229, 
    `pos_x` = -238.364, 
    `pos_y` = 8.00, 
    `pos_z` = 143.364 
WHERE `npcid` = 17723601; 

-- -------------------------------------------------
-- Zone: Port Windurst
-- -------------------------------------------------
 -- Rottata
UPDATE `npc_list` 
SET 
    `pos_rot` = 161, 
    `pos_x` = -207.317, 
    `pos_y` = -8.00, 
    `pos_z` = 197.01 
WHERE `npcid` = 17760439;

-- -------------------------------------------------
-- Add out of era NPCs using content_tag: 'WOTG'
-- -------------------------------------------------
UPDATE `npc_list` SET `content_tag` = 'WOTG' WHERE `name` = 'Domenic';
UPDATE `npc_list` SET `content_tag` = 'WOTG' WHERE `name` = 'Achtelle';

-- -------------------------------------------------
-- Remove NPCs using content_tag: 'ROV'
-- -------------------------------------------------
-- Disable Explorer Moogles
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Explorer_Moogle';
-- Disabled myster box goblins
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Mystrix';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Habitox';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Bountibox';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Specilox';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Arbitrix';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Funtrox';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Priztrix';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Sweepstox';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Wondrix';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Rewardox';
UPDATE `npc_list` SET `content_tag` = 'ROV' WHERE `name` = 'Winrix';