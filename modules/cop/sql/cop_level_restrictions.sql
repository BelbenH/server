-----------------------------------
-- CoP Level Capped Zones Module
-- Implements era-appropriate level caps for all CoP mission battlefields
------------------------------------
-- Source: https://www.bg-wiki.com/ffxi/Version_Update_(06/21/2010)
-----------------------------------

UPDATE `zone_settings` SET restriction = 35 WHERE `name` = "Promyvion-Holla";
UPDATE `zone_settings` SET restriction = 35 WHERE `name` = "Promyvion-Dem";
UPDATE `zone_settings` SET restriction = 35 WHERE `name` = "Promyvion-Mea";
UPDATE `zone_settings` SET restriction = 55 WHERE `name` = "Promyvion-Vahzl";
UPDATE `zone_settings` SET restriction = 45 WHERE `name` = "Phomiuna_Aqueducts";
UPDATE `zone_settings` SET restriction = 55 WHERE `name` = "Sacrarium";
UPDATE `zone_settings` SET restriction = 55 WHERE `name` = "Riverne-Site_B01";
UPDATE `zone_settings` SET restriction = 45 WHERE `name` = "Riverne-Site_A01";
