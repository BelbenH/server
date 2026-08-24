-- Remove all spell lists and skill lists from trusts and reenter them manually.
-- Skill lists remain 0 and are handled individually
-- Spell lists are given unique / new spell lists
UPDATE `mob_pools` SET `skill_list_id` = 0, `spellList` = 0 WHERE `poolid` BETWEEN 5896 AND 6023;

-- Trust Spell lists
UPDATE `mob_pools` SET `spellList` = 1000 WHERE `poolid` IN (5920, 5952); -- Red Mages
UPDATE `mob_pools` SET `spellList` = 1001 WHERE `poolid` IN (5898, 5909, 5916, 5944, 5980); -- White Mages
UPDATE `mob_pools` SET `spellList` = 1002 WHERE `poolid` IN (5911, 5914); -- Bards
UPDATE `mob_pools` SET `spellList` = 314  WHERE `poolid` IN (5902, 5905, 5910, 5972); -- Paladins
UPDATE `mob_pools` SET `spellList` = 316  WHERE `poolid` IN (5904, 5896, 5986, 6019); -- Black Mages
UPDATE `mob_pools` SET `spellList` = 18   WHERE `poolid` IN (5906, 6010); -- Dark Knights
UPDATE `mob_pools` SET `spellList` = 7    WHERE `poolid` = 5918; -- Ninjas

-- Convert SMN jobs
UPDATE `mob_pools` SET `mJob` = 13, `sJob` = 3 WHERE `poolid` IN (5961, 5935); -- Kukki-Chebukki

-- Other Trust Changes
UPDATE `mob_pools` SET `cmbSkill` = 2   WHERE `poolid` = 5901; -- Give Nanna-Mihgo (Thief Trust) dual wield
UPDATE `mob_pools` SET `cmbDelay` = 480 WHERE `poolid` IN (5901, 5930); -- Give Nanna-Mihgo (Thief Trust) dual wield