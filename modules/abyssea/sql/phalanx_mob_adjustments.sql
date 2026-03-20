-- Lufaise Meadows Abraxas (Reduce level for solo meriting)
UPDATE `mob_spawn_points` SET minLevel = 77, maxLevel = 79
WHERE mobid IN (16875630, 16875631, 16875632, 16875633, 16875634, 16875635, 16875636, 16875637);

UPDATE `mob_spawn_points` SET minLevel = 77, maxLevel = 79
WHERE mobid IN (16875639, 16875640, 16875641, 16875642, 16875643, 16875644, 16875645, 16875646, 16875647, 16875648, 16875649);

UPDATE `mob_spawn_points` SET minLevel = 77, maxLevel = 79
WHERE mobid IN (16875655, 16875656);

-- MOB GROUP EDITS
UPDATE `mob_groups` SET HP = 10000
where `name` IN ('Vulpangue', 'Chamrosh', 'Cheese_Hoarder_Gigiroon', 'Brass_Borer', 'Claret', 'Ob', 'Velonis', 'Chigre', 'Lil_Apkallu');

UPDATE `mob_groups` SET HP = 66000 where `name` = ('Pandemonium_Warden');