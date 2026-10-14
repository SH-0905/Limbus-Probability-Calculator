DROP DATABASE IF EXISTS `limbus`;
CREATE DATABASE IF NOT EXISTS `limbus`;
USE `limbus`;

-- A 'Sinner' refer to each character. There are 13 sinners, but only 12 have variations.
DROP TABLE IF EXISTS `sinners`;

CREATE TABLE `sinners` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Literary Source` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
);

INSERT INTO `sinners` VALUES
  (1,'Yi Sang','The Wings'),
  (2,'Faust','Goethe''s Faust'),
  (3,'Don Quixote','The Ingenious Gentleman Don Quixote of La Mancha'),
  (4,'Ryōshū','Hell Screen'),
  (5,'Meursault','The Stranger'),
  (6,'Hong Lu','Dream of the Red Chamber'),
  (7,'Heathcliff','Wuthering Heights'),
  (8,'Ishmael','Moby-Dick'),
  (9,'Rodion','Crime and Punishment'),
  (10,'Dante','Dante''s Inferno'),
  (11,'Sinclair','Demian: The Story of Emil Sinclair''s Youth'),
  (12,'Outis','The Odyssey'),
  (13,'Gregor','The Metamorphosis');

DROP TABLE IF EXISTS `seasons`;

CREATE TABLE `seasons` (
  `ID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (ID)
);

INSERT INTO `seasons` VALUES
  (-1, 'Walpurgisnacht'),
  (0, 'Standard Fare'),
  (1, 'Orientation'),
  (2, 'Reminiscense'),
  (3, 'Bon Voyage'),
  (4, 'Clear All Cathy'),
  (5, 'Oblivion'),
  (6, 'Zàng Huā Yín'),
  (7, 'Kumo no ito - oti on akA'),
  (99, 'Custom Identity');

DROP TABLE IF EXISTS `identities`;
-- 'Identities' are what the variants of the characters are named in-game.
-- 'Gore' describes how much graphic content is on the game art. No images will be included in the GUI. A second, unbiased opinion was consulted for classification.
CREATE TABLE `identities` (
  `SinnerID` int NOT NULL,
  `Identity` varchar(50) NOT NULL,
  `Release Date` Date NOT NULL,
  `Season` int NOT NULL,
  `Rarity` tinyint NOT NULL,
  `Gore` enum('None','Minor','Major') NOT NULL,
  PRIMARY KEY (`SinnerID`, `Identity`),
  FOREIGN KEY (`SinnerID`) REFERENCES `sinners`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Season`) REFERENCES `seasons`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Values from limbuscompany.wiki.gg/wiki/List_of_Identities/Data
-- There are 175 values below. Skip to line 243 for the next section.
INSERT INTO `identities` VALUES
  (1, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (1, 'Seven Assoc. South Section 6', '2023-02-27', 0, 2, 'None'),
  (1, 'Molar Office Fixer', '2023-09-14', 2, 2, 'None'),
  (1, 'The Pequod First Mate', '2023-12-07', 3, 2, 'Minor'),
  (1, 'Dieci Assoc. South Section 4', '2024-01-25', 0, 2, 'None'),
  (1, 'LCE E.G.O::Lantern', '2025-01-23', 5, 2, 'Minor'),
  (1, 'Blade Lineage Salsu', '2023-02-27', 0, 3, 'Minor'),
  (1, 'Effloresced E.G.O::Spicebush', '2023-06-15', 2, 3, 'Minor'),
  (1, 'W Corp. L3 Cleanup Agent', '2023-11-09', 0, 3, 'Major'),
  (1, 'The Ring Pointillist Student', '2024-05-16', 0, 3, 'Minor'),
  (1, 'Lobotomy E.G.O::Solemn Lament', '2024-09-05', -1, 3, 'None'),
  (1, 'Liu Assoc. South Section 3', '2025-02-20', 0, 3, 'None'),
  (1, 'N Corp. E.G.O::Fell Bullet', '2025-07-03', 6, 3, 'Major'),
  (1, 'Heishou Pack - Wu Branch Adept', '2025-08-28', 6, 3, 'Minor'),
  (1, 'The House of Spiders: The Index Nursefather', '2026-02-19', 7, 3, 'Minor'),
  (2, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (2, 'W Corp. L2 Cleanup Agent', '2023-02-27', 0, 2, 'Minor'),
  (2, 'Lobotomy Corp. Remnant', '2023-02-27', 1, 2, 'Major'),
  (2, 'Zwei Assoc. South Section 4', '2023-08-10', 0, 2, 'Minor'),
  (2, 'Wuthering Heights Butler', '2024-04-04', 4, 2, 'Minor'),
  (2, 'The One Who Grips', '2023-03-23', 1, 3, 'Major'),
  (2, 'Seven Assoc. South Section 4', '2023-09-07', 0, 3, 'Major'),
  (2, 'Lobotomy E.G.O::Regret', '2023-10-26', -1, 3, 'Minor'),
  (2, 'Blade Lineage Salsu', '2024-02-22', 3, 3, 'Minor'),
  (2, 'MultiCrack Office Rep', '2024-08-08', 4, 3, 'Major'),
  (2, 'LCE E.G.O::Ardor Blossom Star', '2025-01-23', 5, 3, 'None'),
  (2, 'Heishou Pack - Mao Branch Adept', '2025-05-22', 6, 3, 'None'),
  (2, 'Shi Assoc. East Section 3', '2025-10-09', 0, 3, 'Minor'),
  (2, 'The Index Proselyte: [Paper Slip]', '2025-12-31', 7, 3, 'Major'),
  (2, 'The House of Spiders: The Ring Apprentice', '2026-04-02', 7, 3, 'Major'),
  (3, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (3, 'Shi Assoc. South Section 5 Director', '2023-02-27', 0, 2, 'Minor'),
  (3, 'N Corp. Mittelhammer', '2023-05-03', 1, 2, 'Major'),
  (3, 'Lobotomy E.G.O::Lantern', '2024-01-11', -1, 2, 'Minor'),
  (3, 'Blade Lineage Salsu', '2024-02-22', 3, 2, 'Major'),
  (3, 'W Corp. L3 Cleanup Agent', '2023-02-27', 0, 3, 'Major'),
  (3, 'Cinq Assoc. South Section 5 Director', '2023-07-20', 0, 3, 'None'),
  (3, 'The Middle Little Sister', '2023-11-23', 3, 3, 'Minor'),
  (3, 'T Corp. Class 3 Collection Staff', '2024-06-27', 0, 3, 'None'),
  (3, 'The Manager of La Manchaland', '2024-12-12', 5, 3, 'Major'),
  (3, 'Cinq Assoc. East Section 3', '2025-03-06', 0, 3, 'Minor'),
  (3, 'Lobotomy E.G.O::In the Name of Love and Hate', '2025-07-17', -1, 3, 'Major'),
  (3, 'Heishou Pack - Wei Branch', '2025-11-20', 6, 3, 'None'),
  (3, 'The Index Proxy - Effloresced E.G.O::Procuration', '2026-01-08', 7, 3, 'Minor'),
  (4, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (4, 'Seven Assoc. South Section 6', '2023-02-27', 0, 2, 'Major'),
  (4, 'LCCB Assistant Manager', '2023-11-16', 3, 2, 'Minor'),
  (4, 'Liu Assoc. South Section 4', '2024-03-07', 0, 2, 'Major'),
  (4, 'District 20 Yurodivy', '2024-06-13', 4, 2, 'Minor'),
  (4, 'Kurokumo Clan Wakashu', '2023-02-27', 0, 3, 'Minor'),
  (4, 'R.B. Chef de Cuisine', '2023-04-20', 1, 3, 'Major'),
  (4, 'W Corp. L3 Cleanup Agent', '2023-08-24', 0, 3, 'Major'),
  (4, 'Edgar Family Chief Butler', '2024-04-18', 4, 3, 'None'),
  (4, 'Lobotomy E.G.O::Red Eyes & Penitence', '2024-09-05', -1, 3, 'None'),
  (4, 'Heishou Pack - Mao Branch', '2025-03-20', 5, 3, 'Minor'),
  (4, 'N Corp. E.G.O::Contempt, Awe', '2025-09-11', 6, 3, 'Minor'),
  (4, 'Drifting Blade of Hongyuan', '2025-12-04', 6, 3, 'Major'),
  (4, 'Lobotomy E.G.O::Faint Aroma & Solitude', '2026-03-05', -1, 3, 'None'),
  (5, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (5, 'Liu Assoc. South Section 6', '2023-02-27', 0, 2, 'None'),
  (5, 'Rosespanner Workshop Fixer', '2023-06-01', 2, 2, 'None'),
  (5, 'The Middle Little Brother', '2023-11-23', 3, 2, 'Minor'),
  (5, 'Dead Rabbits Boss', '2024-03-28', 4, 2, 'Minor'),
  (5, 'W Corp. L2 Cleanup Agent', '2023-02-27', 0, 3, 'Major'),
  (5, 'N Corp. Großhammer', '2023-03-09', 1, 3, 'Major'),
  (5, 'R Corp. 4th Pack Rhino', '2023-07-13', 0, 3, 'Major'),
  (5, 'Blade Lineage Mentor', '2024-02-22', 3, 3, 'Major'),
  (5, 'Dieci Assoc. South Section 4 Director', '2024-07-11', 0, 3, 'Minor'),
  (5, 'Cinq Assoc. West Section 3', '2024-10-10', 5, 3, 'Minor'),
  (5, 'The Thumb East Capo IIII', '2025-06-19', 6, 3, 'Minor'),
  (5, 'The Prince of La Manchaland', '2025-10-23', 6, 3, 'Major'),
  (5, 'Lobotomy E.G.O::Hornet [Alteration]', '2026-03-05', -1, 3, 'None'),
  (5, 'The Ring Fauvist Student', '2026-04-16', 7, 3, 'Major'),
  (6, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (6, 'Kurokumo Clan Wakashu', '2023-02-27', 0, 2, 'None'),
  (6, 'Liu Assoc. South Section 5', '2023-04-06', 0, 2, 'None'),
  (6, 'W Corp. L2 Cleanup Agent', '2023-08-24', 0, 2, 'Minor'),
  (6, 'Hook Office Fixer', '2023-10-26', -1, 2, 'Minor'),
  (6, 'Fanghunt Office Fixer', '2024-10-17', 5, 2, 'Minor'),
  (6, 'Tingtang Gang Gangleader', '2023-02-27', 1, 3, 'Major'),
  (6, 'K Corp. Class 3 Excision Staff', '2023-06-29', 2, 3, 'Major'),
  (6, 'Dieci Assoc. South Section 4', '2024-01-25', 0, 3, 'Minor'),
  (6, 'District 20 Yurodivy', '2024-06-13', 4, 3, 'Minor'),
  (6, 'Full-Stop Office Rep', '2025-01-09', -1, 3, 'Major'),
  (6, 'R Corp. 4th Pack Reindeer', '2025-04-30', 0, 3, 'Minor'),
  (6, 'The Lord of Hongyuan', '2025-08-14', 6, 3, 'Minor'),
  (6, 'The House of Spiders: The Ring Nursefather', '2026-04-02', 7, 3, 'Major'),
  (7, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (7, 'Shi Assoc. South Section 5', '2023-02-27', 0, 2, 'Minor'),
  (7, 'N Corp. Kleinhammer', '2023-03-23', 1, 2, 'Major'),
  (7, 'Seven Assoc. South Section 4', '2023-09-07', 0, 2, 'Minor'),
  (7, 'MultiCrack Office Fixer', '2024-08-08', 4, 2, 'Minor'),
  (7, 'R Corp. 4th Pack Rabbit', '2023-02-27', 0, 3, 'Minor'),
  (7, 'Lobotomy E.G.O::Sunshower', '2023-06-08', 2, 3, 'Minor'),
  (7, 'The Pequod Harpooneer', '2023-12-07', 3, 3, 'Major'),
  (7, 'Öufi Assoc. South Section 3', '2024-03-21', 0, 3, 'Major'),
  (7, 'Wild Hunt', '2024-08-22', 4, 3, 'None'),
  (7, 'Full-Stop Office Fixer', '2025-01-09', -1, 3, 'None'),
  (7, 'Kurokumo Clan Wakashu', '2025-02-06', 5, 3, 'Minor'),
  (7, 'W Corp. L4 Cleanup Agent - CCA', '2025-10-23', 6, 3, 'Minor'),
  (7, 'Heishou Pack - You Branch Adept', '2025-11-20', 6, 3, 'Minor'),
  (7, 'The Middle Big Brother', '2026-04-30', 7, 3, 'Minor'),
  (8, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (8, 'Shi Assoc. South Section 5', '2023-02-27', 0, 2, 'Major'),
  (8, 'LCCB Assistant Manager', '2023-02-27', 1, 2, 'None'),
  (8, 'Lobotomy E.G.O::Sloshing', '2023-06-15', 2, 2, 'None'),
  (8, 'Edgar Family Butler', '2024-04-18', 4, 2, 'Minor'),
  (8, 'R Corp. 4th Pack Reindeer', '2023-02-27', 0, 3, 'None'),
  (8, 'Liu Assoc. South Section 4', '2023-07-06', 0, 3, 'Minor'),
  (8, 'Molar Boatworks Fixer', '2023-07-27', 2, 3, 'Minor'),
  (8, 'The Pequod Captain', '2024-02-28', 3, 3, 'Minor'),
  (8, 'Zwei Assoc. West Section 3', '2024-10-03', 0, 3, 'None'),
  (8, 'Kurokumo Clan Captain', '2025-02-06', 5, 3, 'Minor'),
  (8, 'Family Hierarch Candidate', '2025-06-05', 6, 3, 'Minor'),
  (8, 'Jeong''s Office Rep', '2025-11-06', -1, 3, 'None'),
  (8, 'The House of Spiders: The Middle Apprentice', '2026-01-22', 7, 3, 'Major'),
  (9, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (9, 'LCCB Assistant Manager', '2023-02-27', 1, 2, 'None'),
  (9, 'N Corp. Mittelhammer', '2023-03-09', 1, 2, 'Major'),
  (9, 'Zwei Assoc. South Section 5', '2023-07-13', 0, 2, 'Major'),
  (9, 'T Corp. Class 2 Collection Staff', '2024-06-27', 0, 2, 'None'),
  (9, 'Kurokumo Clan Wakashu', '2023-02-27', 0, 3, 'None'),
  (9, 'Rosespanner Workshop Rep', '2023-06-01', 2, 3, 'Major'),
  (9, 'Dieci Assoc. South Section 4', '2023-09-21', 0, 3, 'Minor'),
  (9, 'Liu Assoc. South Section 4 Director', '2024-03-07', 0, 3, 'None'),
  (9, 'Devyat'' Assoc. North Section 3', '2024-09-19', 0, 3, 'Minor'),
  (9, 'The Princess of La Manchaland', '2024-11-14', 5, 3, 'Major'),
  (9, 'Heishou Pack - Si Branch', '2025-05-15', 6, 3, 'Minor'),
  (9, 'Lobotomy E.G.O::The Sword Sharpened with Tears', '2025-07-17', -1, 3, 'Minor'),
  (9, 'R Corp. 4th Pack Reindeer', '2025-12-18', 0, 3, 'Minor'),
  (9, 'The Ring Fauvist Docent', '2026-04-16', 7, 3, 'Major'),
  (11, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (11, 'Zwei Assoc. South Section 6', '2023-02-27', 0, 2, 'Minor'),
  (11, 'Los Mariachis Jefe', '2023-02-27', 1, 2, 'None'),
  (11, 'Lobotomy E.G.O::Red Sheet', '2023-06-29', 2, 2, 'Minor'),
  (11, 'Molar Boatworks Fixer', '2023-07-27', 2, 2, 'None'),
  (11, 'Zwei Assoc. West Section 3', '2024-10-10', 5, 2, 'None'),
  (11, 'Blade Lineage Salsu', '2023-02-27', 0, 3, 'Minor'),
  (11, 'The One Who Shall Grip', '2023-05-03', 1, 3, 'Major'),
  (11, 'Cinq Assoc. South Section 4 Director', '2023-12-21', 0, 3, 'Major'),
  (11, 'Dawn Office Fixer', '2024-05-02', -1, 3, 'Minor'),
  (11, 'Devyat'' Assoc. North Section 3', '2024-11-28', 0, 3, 'Major'),
  (11, 'The Middle Little Brother', '2025-04-03', 0, 3, 'Minor'),
  (11, 'The Thumb East Soldato II', '2025-06-19', 6, 3, 'Major'),
  (11, 'Heishou Pack - You Branch', '2025-08-28', 6, 3, 'Minor'),
  (11, 'The House of Spiders: The Pinky Apprentice', '2026-02-05', 7, 3, 'Major'),
  (12, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (12, 'Blade Lineage Salsu', '2023-02-27', 0, 2, 'Major'),
  (12, 'G Corp. Head Manager', '2023-02-27', 1, 2, 'Minor'),
  (12, 'Cinq Assoc. South Section 4', '2023-12-21', 0, 2, 'None'),
  (12, 'The Ring Pointillist Student', '2024-05-16', 0, 2, 'Major'),
  (12, 'Seven Assoc. South Section 6 Director', '2023-04-06', 0, 3, 'Major'),
  (12, 'Molar Office Fixer', '2023-09-14', 2, 3, 'Major'),
  (12, 'Lobotomy E.G.O::Magic Bullet', '2024-01-11', -1, 3, 'None'),
  (12, 'Wuthering Heights Chief Butler', '2024-03-28', 4, 3, 'None'),
  (12, 'W Corp. L3 Cleanup Captain', '2024-07-25', 0, 3, 'Major'),
  (12, 'The Barber of La Manchaland', '2024-10-17', 5, 3, 'Major'),
  (12, 'Heishou Pack - Mao Branch', '2025-03-20', 5, 3, 'Major'),
  (12, 'T Corp. Class 3 VDCU Staff', '2025-07-31', 6, 3, 'Major'),
  (12, 'LCA Udjat Vanguard Team 3 Leader', '2025-12-31', 7, 3, 'Major'),
  (13, 'LCB Sinner', '2023-02-27', 0, 1, 'None'),
  (13, 'Liu Assoc. South Section 6', '2023-02-27', 0, 2, 'None'),
  (13, 'R.B. Sous-chef', '2023-04-20', 1, 2, 'Major'),
  (13, 'Rosespanner Workshop Fixer', '2023-06-08', 2, 2, 'Major'),
  (13, 'Kurokumo Clan Captain', '2024-02-22', 3, 2, 'None'),
  (13, 'G Corp. Manager Corporal', '2023-02-27', 1, 3, 'Major'),
  (13, 'Zwei Assoc. South Section 4', '2023-08-10', 0, 3, 'None'),
  (13, 'Twinhook Pirates First Mate', '2023-11-16', 0, 3, 'None'),
  (13, 'Edgar Family Heir', '2024-04-04', 4, 3, 'None'),
  (13, 'The Priest of La Manchaland', '2024-10-31', 5, 3, 'Major'),
  (13, 'Firefist Office Survivor', '2025-03-06', 5, 3, 'Minor'),
  (13, 'Heishou Pack - Si Branch', '2025-05-15', 6, 3, 'Minor'),
  (13, 'Night Awls Capitano', '2025-11-06', -1, 3, 'Major'),
  (13, 'Lobotomy E.G.O::Lamp', '2026-02-05', 7, 3, 'Major'),
  (13, 'LCE E.G.O::AEDD', '2026-03-19', 7, 3, 'Minor');

DROP TABLE IF EXISTS `skills`;
-- Black and White does not exist in the game yet, but is present in the game files.
CREATE TABLE `skills` (
    `Sinner` int NOT NULL,
    `Identity` varchar(50) NOT NULL,
    `Number` tinyint NOT NULL,
    `Name` varchar(120) NOT NULL,
    `Color` enum('Red','Orange','Yellow','Green','Blue','Navy','Violet','Black','White'),
    `Base Power` tinyint NOT NULL,
    `Coin Number` tinyint NOT NULL,
    `Coin Power` tinyint NOT NULL,
    `Max Chance` decimal(5,3) NOT NULL,
    `Alternate` boolean,
    PRIMARY KEY (Sinner, Identity, Number),
    FOREIGN KEY (Sinner, Identity) REFERENCES `identities`(`SinnerID`,`Identity`) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Skip to line 785 for the next section.
INSERT INTO `skills` VALUES
    (1, 'LCB Sinner', 1, 'Deflect', 'Blue', 4, 1, 7, 50, False),
    (1, 'LCB Sinner', 2, 'End-stop Stab', 'Violet', 4, 2, 4, 25, False),
    (1, 'LCB Sinner', 3, 'Enjamb', 'Yellow', 6, 3, 2, 12.5, False),
    (1, 'Seven Assoc. South Section 6', 1, 'Flèche', 'Blue', 5,1,7,50,False),
    (1, 'Seven Assoc. South Section 6', 2,'Riposte','Green',5,2,4,25,False),
    (1, 'Seven Assoc. South Section 6', 3,'Moulinet','Yellow',5,3,3,12.5,False),
    (1, 'Molar Office Fixer', 1, 'Stay Calm', 'Orange', 3, 2, 4, 25, False),
    (1, 'Molar Office Fixer', 2, 'Gamble', 'Yellow', 4, 1, 12, 50, False),
    (1, 'Molar Office Fixer', 3, 'Grinding the Molars', 'Red', 4, 3, 3, 12.5, False),
    (1, 'The Pequod First Mate', 1, 'Impale', 'Navy', 3, 2, 4, 25, False),
    (1, 'The Pequod First Mate', 2, 'Relentless Stabbing', 'Violet', 4, 2, 4, 25, False),
    (1, 'The Pequod First Mate', 3, 'Ambush', 'Green', 4, 2, 6, 25, False),
    (1, 'Dieci Assoc. South Section 4', 1, 'Expend Knowledge', 'Green', 3, 2, 4, 25, False),
    (1, 'Dieci Assoc. South Section 4', 2, 'Seal Shut', 'Orange', 4, 3, 3, 12.5, False),
    (1, 'Dieci Assoc. South Section 4', 3, 'Grace of Knowledge', 'Yellow', 4, 4, 2, 6.25, False),
    (1, 'LCE E.G.O::Lantern', 1, 'Though it must be prefaced that E.G.O gears are standardized equipment,', 'Yellow', 4, 2, 3, 25, False),
    (1, 'LCE E.G.O::Lantern', 2, 'when juxtaposed with E.G.O gear from L Corp., depending on the degree of attunement to the Abnormality,', 'Violet', 8, 1, 6, 50, False),
    (1, 'LCE E.G.O::Lantern', 3, 'the idiosyncrasies of the source may be utilized with greater flexibility', 'Green', 16, 3, -5, 12.5, False),
    (1, 'Blade Lineage Salsu', 1, 'Striker''s Stance', 'Navy', 6, 1, 7, 50, False),
    (1, 'Blade Lineage Salsu', 2, 'Heel Turn', 'Red', 7, 2, 2, 25, False),
    (1, 'Blade Lineage Salsu', 3, 'Flank Thrust', 'Violet', 8, 3, 2, 12.5, False),
    (1, 'Effloresced E.G.O::Spicebush', 1, 'Sprouting Bud', 'Green', 3, 3, 2, 12.5, False),
    (1, 'Effloresced E.G.O::Spicebush', 2, 'Moment''s Floral Breeze', 'Yellow', 4, 3, 4, 12.5, False),
    (1, 'Effloresced E.G.O::Spicebush', 3, 'Bloodsteeped Scent', 'Navy', 6, 3, 4, 12.5, False),
    (1, 'W Corp. L3 Cleanup Agent', 1, 'Dimensional Slit', 'Yellow', 5, 1, 6, 50, False),
    (1, 'W Corp. L3 Cleanup Agent', 2, 'Energy Cycle', 'Green', 5, 2, 5, 25, False),
    (1, 'W Corp. L3 Cleanup Agent', 3, 'Dimensional Rift', 'Blue', 5, 3, 4, 12.5, False),
    (1, 'The Ring Pointillist Student', 1, 'Paint Over', 'Blue', 2, 3, 3, 12.5, False),
    (1, 'The Ring Pointillist Student', 2, 'Sanguine Pointillism', 'Orange', 8, 1, 8, 50, False),
    (1, 'The Ring Pointillist Student', 3, 'Hematic Coloring', 'Yellow', 3, 4, 3, 6.25, False),
    (1, 'Lobotomy E.G.O::Solemn Lament', 1, 'Celebration for the Departed', 'Navy', 4, 2, 4, 50, False),
    (1, 'Lobotomy E.G.O::Solemn Lament', 2, 'Solemn Lament for the Living', 'Blue', 4, 2, 6, 25, False),
    (1, 'Lobotomy E.G.O::Solemn Lament', 3, 'Goodbye Now, A Sorrow In You', 'Yellow', 4, 4, 3, 6.25, False),
    (1, 'Liu Assoc. South Section 3', 1, 'Flame Hew', 'Yellow', 3, 2, 4, 25, False),
    (1, 'Liu Assoc. South Section 3', 2, 'Frontal Assault', 'Red', 4, 3, 4, 12.5, False),
    (1, 'Liu Assoc. South Section 3', 3, 'Flow of the Sword', 'Violet', 4, 4, 3, 6.25, False),
    (1, 'N Corp. E.G.O::Fell Bullet', 1, 'See Through Defenses', 'Red', 5, 1, 6, 50, False),
    (1, 'N Corp. E.G.O::Fell Bullet', 2, 'Punch Through', 'Orange', 4, 2, 6, 25, False),
    (1, 'N Corp. E.G.O::Fell Bullet', 3, 'Target Readjustment Fire', 'Navy', 4, 2, 7, 25, False),
    (1, 'Heishou Pack - Wu Branch Adept', 1, 'Cut Down and Trample', 'Yellow', 3, 2, 4, 25, False),
    (1, 'Heishou Pack - Wu Branch Adept', 2, 'Crescent Blade Strike', 'Violet', 4, 2, 5, 25, False),
    (1, 'Heishou Pack - Wu Branch Adept', 3, 'Cavalry''s Vanguard Charge', 'Green', 5, 3, 4, 12.5, True),
    (1, 'The House of Spiders: The Index Nursefather', 1, '"Enwrap 330 times in Long Swaths of Frozen Blood"', 'Green',3,2,4,25,False),
    (1, 'The House of Spiders: The Index Nursefather',2, '"Revel with Soundless Applause, Impale in Voiceless Sorrow"', 'Navy',4,3,4,12.5,False),
    (1, 'The House of Spiders: The Index Nursefather',3, '"Raise and Laugh the Blade, Cry the Waterfall Like the Scent of Fallen Leaves"', 'Blue', 4,4,3,6.25,True),
    (2, 'LCB Sinner', 1, 'Downward Slash', 'Navy', 4, 1, 7, 50, False),
    (2, 'LCB Sinner', 2, 'Upward Slash', 'Yellow', 5, 2, 4, 25, False),
    (2, 'LCB Sinner', 3, 'Drilling Stab', 'Green', 7, 2, 2, 25, False),
    (2,'W Corp. L2 Cleanup Agent',1,'Energy Cycle','Violet',4,1,8,50,FALSE),
    (2,'W Corp. L2 Cleanup Agent',2,'Leap','Blue',6,2,4,25,FALSE),
    (2,'W Corp. L2 Cleanup Agent',3,'Overcharge','Red',6,3,3,12.5,FALSE),
    (2,'Lobotomy Corp. Remnant',1,'Sole Strike','Orange',3,1,8,50,FALSE),
    (2,'Lobotomy Corp. Remnant',2,'Deep Cuts','Blue',5,3,3,12.5,FALSE),
    (2,'Lobotomy Corp. Remnant',3,'Opportunistic Slash','Violet',4,2,8,25,FALSE),
    (2,'Zwei Assoc. South Section 4',1,'Patrolling','Violet',3,2,4,25,FALSE),
    (2,'Zwei Assoc. South Section 4',2,'Client Protection','Blue',4,3,3,12.5,FALSE),
    (2,'Zwei Assoc. South Section 4',3,'Law and Order','Orange',6,2,5,25,FALSE),
    (2,'Wuthering Heights Butler',1,'Confiscation','Blue',3,2,4,25,False),
    (2,'Wuthering Heights Butler',2,'Interloper Reception','Orange',4,2,5,25,False),
    (2,'Wuthering Heights Butler',3,'Reception Arts 4: Heartseal','Red',4,4,2,6.25,False),
    (2,'The One Who Grips',1,'Cackle','Violet',4,2,3,25,False),
    (2,'The One Who Grips',2,'The Gripping','Orange',4,3,4,12.5,False),
    (2,'The One Who Grips',3,'Execution','Navy',6,3,2,12.5,False),
    (2,'Seven Assoc. South Section 4',1,'Predictive Analysis','Violet',4,2,3,25,False),
    (2,'Seven Assoc. South Section 4',2,'Dissect Target','Blue',4,3,4,12.5,False),
    (2,'Seven Assoc. South Section 4',3,'Profiling','Green',5,3,4,12.5,False),
    (2,'Lobotomy E.G.O::Regret',1,'Contracting Straight-jacket','Yellow',4,1,7,50,False),
    (2,'Lobotomy E.G.O::Regret',2,'Metallic Ringing','Navy',4,3,4,12.5,False),
    (2,'Lobotomy E.G.O::Regret',3,'Unleashed Violence','Red',3,3,5,12.5,False),
    (2,'Blade Lineage Salsu',1,'Moonlit Blade Dance','Yellow',3,3,2,12.5,False),
    (2,'Blade Lineage Salsu',2,'Acupuncture','Navy',4,2,6,25,False),
    (2,'Blade Lineage Salsu',3,'Red Plum Blossoms Scatter','Blue',5,2,6,25,False),
    (2,'MultiCrack Office Rep',1,'40Y-3 Activation','Orange',3,2,4,25,False),
    (2,'MultiCrack Office Rep',2,'Charge Countercurrent','Violet',4,3,4,12.5,False),
    (2,'MultiCrack Office Rep',3,'40Y-3 Charge','Blue',4,4,3,6.25,False),
    (2,'LCE E.G.O::Ardor Blossom Star',1,'Ignition','Yellow',3,2,4,25,False),
    (2,'LCE E.G.O::Ardor Blossom Star',2,'E.G.O - A.B.S. Activation','Navy',4,3,4,12.5,False),
    (2,'LCE E.G.O::Ardor Blossom Star',3,'Drawn by Flame','Red',5,3,4,12.5,True),
    (2,'Heishou Pack - Mao Branch Adept',1,'Blinkstep','Yellow',3,2,4,25,False),
    (2,'Heishou Pack - Mao Branch Adept',2,'Clearing the Path, My Lord.','Navy',4,2,6,25, False),
    (2,'Heishou Pack - Mao Branch Adept',3,'Traceless to Sight and Sound Alike.','Green',5,3,4,12.5,True),
    (2,'Shi Assoc. East Section 3',1,'Cleave','Red',4,2,4,25,False),
    (2,'Shi Assoc. East Section 3',2,'Positioning Maneuver','Navy',4,3,4,12.5,False),
    (2,'Shi Assoc. East Section 3',3,'Glimmering Bow','Orange',4,4,3,6.25,True),
    (2,'The Index Proselyte: [Paper Slip]',1,'Unerringly, As the Prescript Demands','Yellow',3,2,4,25,False),
    (2,'The Index Proselyte: [Paper Slip]',2,'Undertake the Prescript, Again Undertake','Navy',4,3,4,12.5,False),
    (2,'The Index Proselyte: [Paper Slip]',3,'As the Prescript Demands, You will be Eliminated.','Blue',5,3,4,12.5,False),
    (2,'The House of Spiders: The Ring Apprentice',1,'Butcher - Ribs','Green',3,2,4,25,False), -- alt exists in-game but no numeric difference
    (2,'The House of Spiders: The Ring Apprentice',2,'Fascia Hungers','Violet',4,3,4,12.5,True),
    (2,'The House of Spiders: The Ring Apprentice',3,'Repressed Flesh','Orange',4,4,3,6.25,True),
    (3, 'LCB Sinner', 1, 'Joust', 'Orange', 4, 1, 7, 50, False),
    (3, 'LCB Sinner', 2, 'Galloping Tilt', 'Violet', 4, 1, 12, 50, False),
    (3, 'LCB Sinner', 3, 'For Justice!', 'Green', 3, 3, 3, 12.5, False),
    (3, 'Shi Assoc. South Section 5 Director', 1, 'Catch Breath', 'Red', 4, 1, 7, 50, False),
    (3, 'Shi Assoc. South Section 5 Director', 2, 'Dual Strike', 'Violet', 4, 2, 6, 25, False),
    (3, 'Shi Assoc. South Section 5 Director', 3, 'Overbreathe', 'Orange', 4, 1, 21, 50, False),
    (3, 'N Corp. Mittelhammer', 1, 'Rightful Purge', 'Orange', 3, 2, 4, 25, False),
    (3, 'N Corp. Mittelhammer', 2, 'Enactment!', 'Green', 4, 1, 12, 50, False),
    (3, 'N Corp. Mittelhammer', 3, 'Fanatical Judgement', 'Red', 5, 3, 3, 12.5, False),
    (3, 'Lobotomy E.G.O::Lantern', 1, 'I Shall Nibble Thee!', 'Green', 5, 1, 7, 50, False),
    (3, 'Lobotomy E.G.O::Lantern', 2, 'Flashing Lure', 'Orange', 4, 3, 3, 12.5, False),
    (3, 'Lobotomy E.G.O::Lantern', 3, 'Whirlwind Om-Nom-Nom!', 'Blue', 4, 3, 3, 12.5, False),
    (3, 'Blade Lineage Salsu', 1, 'Draw of the Sword', 'Navy', 3, 2, 4, 25, False),
    (3, 'Blade Lineage Salsu', 2, 'Blade Arc', 'Violet', 4, 2, 5, 25, False),
    (3, 'Blade Lineage Salsu', 3, 'Fare Thee Well!', 'Yellow', 4, 3, 3, 12.5, False),
    (3, 'W Corp. L3 Cleanup Agent', 1, 'Rip', 'Yellow', 5, 1, 6, 50, False),
    (3, 'W Corp. L3 Cleanup Agent', 2, 'Leap', 'Blue', 4, 3, 4, 12.5, False),
    (3, 'W Corp. L3 Cleanup Agent', 3, 'Rip Space', 'Violet', 1, 5, 2, 3.125, False),
    (3, 'Cinq Assoc. South Section 5 Director', 1, 'Remise', 'Orange', 4, 2, 3, 25, False),
    (3, 'Cinq Assoc. South Section 5 Director', 2, 'Flèche', 'Blue', 5,2,5, 25, False),
    (3, 'Cinq Assoc. South Section 5 Director', 3, 'Salut!', 'Navy', 6,2,6, 25, False),
    (3, 'The Middle Little Sister', 1, 'Checking the Book', 'Red', 4, 2, 3, 25, False),
    (3, 'The Middle Little Sister', 2, 'Proof of Loyalty', 'Violet', 4,2,6, 25, False),
    (3, 'The Middle Little Sister', 3, 'A Just Vengeance', 'Navy', 4,4,3, 6.25, False),
    (3, 'T Corp. Class 3 Collection Staff', 1, 'Let Us Prepare to Collect', 'Green', 3, 2, 4, 25, False),
    (3, 'T Corp. Class 3 Collection Staff', 2, 'T Corp. Accelerated Amputator', 'Navy', 4, 3, 4, 12.5, False),
    (3, 'T Corp. Class 3 Collection Staff', 3, 'I Command Thee, Halt!', 'Yellow', 4, 4, 3, 6.25, False),
    (3, 'The Manager of La Manchaland', 1, 'Enough is Enough', 'Yellow', 3, 2, 4, 25, True),
    (3, 'The Manager of La Manchaland', 2, 'Let All Blossom Free', 'Red', 4,2,6, 25, True),
    (3, 'The Manager of La Manchaland', 3, 'I Shall Impale', 'Orange', 5,3,4, 12.5, True),
    (3, 'Cinq Assoc. East Section 3', 1, 'Fa Jin', 'Green', 3, 2, 4, 25, False),
    (3, 'Cinq Assoc. East Section 3', 2, 'Virescent Flame Palm', 'Red', 4,3,4, 12.5, False),
    (3, 'Cinq Assoc. East Section 3', 3, 'Prithee, let this be an enlightening bout', 'Navy', 4,4,3, 6.25, False),
    (3, 'Lobotomy E.G.O::In the Name of Love and Hate', 1, 'By Manager Esquire''s Orders, I Am Here!', 'Red', 3, 2, 4, 25, True),
    (3, 'Lobotomy E.G.O::In the Name of Love and Hate', 2, 'With Love! Hyah!', 'Violet', 6, 2, 5, 25, True),
    (3, 'Lobotomy E.G.O::In the Name of Love and Hate', 3, 'Arcana Beats!! / Minor Arcana Slave!!!', 'Violet', 5, 3, 4, 12.5, True),
    (3, 'Heishou Pack - Wei Branch', 1, 'Breakthrough', 'Orange', 3, 2, 4, 25, False),
    (3, 'Heishou Pack - Wei Branch', 2, 'Seize the Momentum, Shatter the Wall', 'Green', 4, 3, 4, 12.5, False),
    (3, 'Heishou Pack - Wei Branch', 3, 'Crushing Horns', 'Blue', 4, 4, 3, 6.25, False),
    (3, 'The Index Proxy - Effloresced E.G.O::Procuration', 1, 'Skull Crushing', 'Orange', 3, 2, 4, 25, True),
    (3, 'The Index Proxy - Effloresced E.G.O::Procuration', 2, 'B-be Thee Silent', 'Navy', 4, 3, 4, 12.5, True),
    (3, 'The Index Proxy - Effloresced E.G.O::Procuration', 3, 'T-the Prescript Must be Fulfilled Anon...', 'Blue', 6, 2, 6, 25, True),
    (4, 'LCB Sinner', 1, 'Paint', 'Green', 4, 1, 7, 50, False),
    (4, 'LCB Sinner', 2, 'Splatter', 'Orange', 4, 2, 5, 25, False),
    (4, 'LCB Sinner', 3, 'Brushstroke', 'Navy', 5, 3, 3, 12.5, False),
    (4, 'Seven Assoc. South Section 6', 1, 'Slash', 'Yellow', 4, 1, 8, 50, False),
    (4, 'Seven Assoc. South Section 6', 2, 'Upper Slash', 'Navy', 4, 1, 14, 50, False),
    (4, 'Seven Assoc. South Section 6', 3, 'Swash', 'Green', 4, 3, 5, 12.5, False),
    (4, 'LCCB Assistant Manager', 1, 'Shove', 'Orange', 5, 1, 5, 50, False),
    (4, 'LCCB Assistant Manager', 2, 'T.N.', 'Green', 4, 2, 5, 25, False),
    (4, 'LCCB Assistant Manager', 3, 'O.O.F.', 'Navy', 4, 3, 3, 12.5, False),
    (4, 'Liu Assoc. South Section 4', 1, 'All-out War', 'Green', 3, 2, 4, 25, False),
    (4, 'Liu Assoc. South Section 4', 2, 'Fiery Knifehand', 'Red', 4, 2, 5, 25, False),
    (4, 'Liu Assoc. South Section 4', 3, 'Flame Cleave', 'Orange', 4, 4, 2, 6.25, False),
    (4, 'District 20 Yurodivy', 1, 'Got a Screw Loose?', 'Orange', 3, 2, 4, 25, False),
    (4, 'District 20 Yurodivy', 2, 'Compression Wind-up Spanner', 'Yellow', 4, 3, 3, 12.5, False),
    (4, 'District 20 Yurodivy', 3, 'Percussive Maintenance', 'Green', 4, 3, 3, 12.5, False),
    (4, 'Kurokumo Clan Wakashu', 1, 'Focus Strike', 'Green', 5, 1, 6, 50, False),
    (4, 'Kurokumo Clan Wakashu', 2, 'Clean Up', 'Navy', 5, 2, 5, 25, False),
    (4, 'Kurokumo Clan Wakashu', 3, 'Lenticular Swirl', 'Orange', 8, 2, 4, 25, False),
    (4, 'R.B. Chef de Cuisine', 1, 'P.C.', 'Red', 4, 2, 3, 25, False),
    (4, 'R.B. Chef de Cuisine', 2, 'I.H.', 'Violet', 3, 3, 5, 12.5, False),
    (4, 'R.B. Chef de Cuisine', 3, 'I Can Cook Anything', 'Orange', 3, 4, 3, 6.25, False),
    (4, 'W Corp. L3 Cleanup Agent', 1, 'E.C.', 'Orange', 3, 3, 2, 12.5, False),
    (4, 'W Corp. L3 Cleanup Agent', 2, 'Leap', 'Navy', 2, 3, 5, 12.5, False),
    (4, 'W Corp. L3 Cleanup Agent', 3, 'D.D.E.D.R.', 'Violet', 3, 4, 2, 6.25, False),
    (4, 'Edgar Family Chief Butler', 1, 'Receiving Arts 1: The Hunt', 'Orange', 3, 2, 4, 25, False),
    (4, 'Edgar Family Chief Butler', 2, 'Receiving Arts 7: Capture', 'Navy', 4, 2, 6, 25, False),
    (4, 'Edgar Family Chief Butler', 3, 'Receiving Arts 2: S.Y.N.C.', 'Red', 4, 2, 7, 25, False),
    (4, 'Lobotomy E.G.O::Red Eyes & Penitence', 1, 'Both of You, Shut Up', 'Violet', 4, 2, 4, 25, False),
    (4, 'Lobotomy E.G.O::Red Eyes & Penitence', 2, 'S.H. / S.F.', 'Blue', 4, 3, 4, 12.5, False),
    (4, 'Lobotomy E.G.O::Red Eyes & Penitence', 3, 'Skullbuster', 'Orange', 5, 3, 4, 12.5, True),
    (4, 'Heishou Pack - Mao Branch', 1, 'Blinkstep', 'Orange', 3, 2, 4, 25, False),
    (4, 'Heishou Pack - Mao Branch', 2, 'As Written', 'Green', 4, 2, 6, 25, False),
    (4, 'Heishou Pack - Mao Branch', 3, 'I''ll gut you with a curse-engraved blade', 'Navy', 5, 3, 4, 12.5, False),
    (4, 'N Corp. E.G.O::Contempt, Awe', 1, 'Contemptuous Thing', 'Violet', 3, 2, 4, 25, False),
    (4, 'N Corp. E.G.O::Contempt, Awe', 2, 'Be Awed', 'Red', 4, 2, 6, 25, False),
    (4, 'N Corp. E.G.O::Contempt, Awe', 3, 'Awe, Contempt', 'Orange', 5, 3, 4, 12.5, True),
    (4, 'Drifting Blade of Hongyuan', 1, 'Hey, Back Off', 'Blue', 6, 1, 7, 50, False),
    (4, 'Drifting Blade of Hongyuan', 2, 'Engraved in Flesh and Bone', 'Green', 4, 3, 4, 12.5, False),
    (4, 'Drifting Blade of Hongyuan', 3, 'Aiding Strike', 'Navy', 4, 4, 3, 6.25, False),
    (4, 'Lobotomy E.G.O::Faint Aroma & Solitude', 1, 'Bang. Bang.', 'Yellow', 4, 2, 4, 25, True),
    (4, 'Lobotomy E.G.O::Faint Aroma & Solitude', 2, 'Blossoming Fragrance in the Void', 'Violet', 4, 3, 4, 12.5, False),
    (4, 'Lobotomy E.G.O::Faint Aroma & Solitude', 3, 'Full Bloom', 'Blue', 5, 3, 4, 12.5, True),
    (5,'LCB Sinner',1,'Un, Deux','Yellow',3,2,4,25,False),
    (5,'LCB Sinner',2,'Nailing Fist','Navy',6,1,9,50,False),
    (5,'LCB Sinner',3,'Des Coups','Blue',4,4,2,6.25,False),
    (5,'Liu Assoc. South Section 6',1,'Assault','Orange',3,2,4,25,False),
    (5,'Liu Assoc. South Section 6',2,'Stalwart Stance','Yellow',7,2,2,25,False),
    (5,'Liu Assoc. South Section 6',3,'Perfected Death Fist','Red',5,3,3,12.5,False),
    (5,'Rosespanner Workshop Fixer',1,'Saddled Tasks','Blue',4,1,6,50,False),
    (5,'Rosespanner Workshop Fixer',2,'Forced Break','Navy',5,2,4,25,False),
    (5,'Rosespanner Workshop Fixer',3,'Finishing Runup','Yellow',4,4,2,6.25,False),
    (5,'The Middle Little Brother',1,'We Remember','Yellow',3,2,4,25,False),
    (5,'The Middle Little Brother',2,'Chains of Loyalty','Violet',4,2,5,25,False),
    (5,'The Middle Little Brother',3,'Recording','Red',4,3,3,12.5,False),
    (5,'Dead Rabbits Boss',1,'Bat Strike','Orange',5,1,6,50,False),
    (5,'Dead Rabbits Boss',2,'Smackdown','Red',4,2,5,25,False),
    (5,'Dead Rabbits Boss',3,'Relentless','Green',4,4,2,6.25,False),
    (5,'W Corp. L2 Cleanup Agent',1,'Rip','Violet',5,1,6,50,False),
    (5,'W Corp. L2 Cleanup Agent',2,'Energy Cycle','Blue',5,3,2,12.5,False),
    (5,'W Corp. L2 Cleanup Agent',3,'Energy Current','Navy',5,4,2,6.25,False),
    (5,'N Corp. Großhammer',1,'Drive','Yellow',5,2,1,25,False),
    (5,'N Corp. Großhammer',2,'You Are Cleansed of Sin','Red',6,2,3,25,False),
    (5,'N Corp. Großhammer',3,'Annihilate Heretics','Navy',8,2,3,25,False),
    (5,'R Corp. 4th Pack Rhino',1,'Weighty Bash','Violet',5,1,6,50,False),
    (5,'R Corp. 4th Pack Rhino',2,'Demolish','Blue',5,3,3,12.5,False),
    (5,'R Corp. 4th Pack Rhino',3,'Rhino Ram','Orange',6,3,3,12.5,False),
    (5,'Blade Lineage Mentor',1,'Draw of the Sword','Navy',3,2,4,25,False),
    (5,'Blade Lineage Mentor',2,'Acupuncture','Navy',3,3,5,12.5,False),
    (5,'Blade Lineage Mentor',3,'Yield My Flesh','Red',20,1,-8,50,False),
    (5,'Dieci Assoc. South Section 4 Director',1,'Studious Dedication','Green',3,2,4,25,False),
    (5,'Dieci Assoc. South Section 4 Director',2,'Moment of Erudition','Yellow',4,2,6,25,False),
    (5,'Dieci Assoc. South Section 4 Director',3,'Scorch Knowledge','Blue',5,3,4,12.5,False),
    (5,'Cinq Assoc. West Section 3',1,'Allez','Navy',3,2,4,25,False),
    (5,'Cinq Assoc. West Section 3',2,'Fente','Green',4,3,4,12.5,False),
    (5,'Cinq Assoc. West Section 3',3,'Salut','Blue',5,3,4,12.5,False),
    (5,'The Thumb East Capo IIII',1,'Double Slash - Blast','Yellow',4,2,4,25,False),
    (5,'The Thumb East Capo IIII',2,'Triple Slash - Blast','Orange',4,3,4,12.5,False),
    (5,'The Thumb East Capo IIII',3,'Tanglecleaver','Red',5,3,4,12.5,True),
    (5,'The Prince of La Manchaland',1,'March Conductor','Violet',2,3,3,12.5,False),
    (5,'The Prince of La Manchaland',2,'Responsibility to Rebuild','Navy',4,2,6,25,False),
    (5,'The Prince of La Manchaland',3,'Let us wear the coagulated mantle of blood.','Orange',4,4,3,6.25,True),
    (5,'Lobotomy E.G.O::Hornet [Alteration]',1,'Warning Shot','Orange',4,2,4,25,False),
    (5,'Lobotomy E.G.O::Hornet [Alteration]',2,'E.G.O Alteration - Buckshot','Red',4,3,4,12.5,False),
    (5,'Lobotomy E.G.O::Hornet [Alteration]',3,'Field Test - Dust Spark','Red',4,4,3,6.25,False),
    (5,'The Ring Fauvist Student',1,'Rough Portrayal','Red',3,2,4,25,False),
    (5,'The Ring Fauvist Student',2,'Visceral Strokes','Navy',4,3,4,12.5,False),
    (5,'The Ring Fauvist Student',3,'Le Fauvisme - Reveal Submission','Orange',5,3,4,12.5,False),
    (6,'LCB Sinner',1,'Downward Cleave','Navy',4,1,7,50,False),
    (6,'LCB Sinner',2,'Dual Strike','Yellow',4,2,4,25,False),
    (6,'LCB Sinner',3,'Whirlwind','Orange',6,2,4,25,False),
    (6,'Kurokumo Clan Wakashu',1,'Cleave','Orange',4,1,7,50,False),
    (6,'Kurokumo Clan Wakashu',2,'Cloud Cutter','Navy','5',2,4,25,False),
    (6,'Kurokumo Clan Wakashu',3,'Cloudburst','Yellow',7,3,2,12.5,False),
    (6,'Liu Assoc. South Section 5',1,'Warm Up','Blue',3,2,4,25,False),
    (6,'Liu Assoc. South Section 5',2,'Flowing Flame','Orange',6,2,2,25,False),
    (6,'Liu Assoc. South Section 5',3,'Crimson Blaze Fist','Red',5,2,6,25,False),
    (6,'W Corp. L2 Cleanup Agent',1,'Energy Cycle','Navy',3,2,4,25,False),
    (6,'W Corp. L2 Cleanup Agent',2,'Cleanup Support','Red',6,2,4,25,False),
    (6,'W Corp. L2 Cleanup Agent',3,'Deploy Charge Barrier','Green','5',3,4,12.5,False),
    (6,'Hook Office Fixer',1,'Track','Red',3,2,4,25,False),
    (6,'Hook Office Fixer',2,'Goin'' First','Orange',4,3,3,12.5,False),
    (6,'Hook Office Fixer',3,'Rampage','Navy',4,4,2,6.25,False),
    (6,'Fanghunt Office Fixer',1,'Slam','Green',3,2,4,25,False),
    (6,'Fanghunt Office Fixer',2,'Bonecrusher','Navy',4,2,'5',25,False),
    (6,'Fanghunt Office Fixer',3,'A Cheerful Hunt''s End','Red',4,3,3,12.5,False),
    (6,'Tingtang Gang Gangleader',1,'Throat Slit','Violet','5',1,8,50,False),
    (6,'Tingtang Gang Gangleader',2,'Shank','Orange',3,3,'5',12.5,False),
    (6,'Tingtang Gang Gangleader',3,'Mutilate','Green','5',1,25,50,False),
    (6,'K Corp. Class 3 Excision Staff',1,'Impede the Intruder','Navy','5',1,6,50,False),
    (6,'K Corp. Class 3 Excision Staff',2,'Decay Blade','Green',6,2,'5',25,False),
    (6,'K Corp. Class 3 Excision Staff',3,'Excise Target','Yellow',8,2,4,25,False),
    (6,'Dieci Assoc. South Section 4',1,'Expend Knowledge','Red','5',1,'5',50,False),
    (6,'Dieci Assoc. South Section 4',2,'Unveil','Blue',4,3,4,12.5,False),
    (6,'Dieci Assoc. South Section 4',3,'Cyclical Knowledge','Yellow','5',3,3,12.5,False),
    (6,'District 20 Yurodivy',1,'Deduction Start','Blue',3,2,4,25,False),
    (6,'District 20 Yurodivy',2,'Morph Cane Technique','Yellow',4,3,4,12.5,False),
    (6,'District 20 Yurodivy',3,'You''re the Culprit!','Green',3,4,3,6.25,False),
    (6,'Full-Stop Office Rep',1,'Take the Shot','Yellow',3,3,3,12.5,True),
    (6,'Full-Stop Office Rep',2,'Target Marked','Blue',4,3,4,12.5,True),
    (6,'Full-Stop Office Rep',3,'Full-Stop to Life','Navy',7,3,4,12.5,True),
    (6,'R Corp. 4th Pack Reindeer',1,'Energy Strike','Green',3,2,4,25,False),
    (6,'R Corp. 4th Pack Reindeer',2,'Mind Whip','Violet',2,4,3,6.25,False),
    (6,'R Corp. 4th Pack Reindeer',3,'Concentration','Red',8,1,'10',50,False),
    (6,'The Lord of Hongyuan',1,'I Wish to Open the Path','Blue',4,2,4,25,False),
    (6,'The Lord of Hongyuan',2,'Tarnished Blood''s Absolute Cleaver of Ambitions','Green',3,4,3,6.25,False),
    (6,'The Lord of Hongyuan',3,'Answer Me, Heishou Packs','Navy','10',1,'12',50,False),
    (6,'The House of Spiders: The Ring Nursefather',1,'Anatomize','Navy',3,2,4,25,False),
    (6,'The House of Spiders: The Ring Nursefather',2,'Gather Ingredient - Blood-bathed Objet','Violet',4,3,4,12.5,False),
    (6,'The House of Spiders: The Ring Nursefather',3,'Tibia''s Melody - Anatomization of the Unanatomized by the Anatomized','Orange',4,4,3,6.25,True),
    (7,'LCB Sinner',1,'Bat Bash','Violet',4,1,7,50,False),
    (7,'LCB Sinner',2,'Smackdown','Red',4,2,4,25,False),
    (7,'LCB Sinner',3,'Upheaval','Orange',4,2,8,25,False),
    (7,'Shi Assoc. South Section 5',1,'Extreme Edge','Orange',4,1,6,50,False),
    (7,'Shi Assoc. South Section 5',2,'Flying Sword','Red',5,1,10,50,False),
    (7,'Shi Assoc. South Section 5',3,'Flashing Strike','Violet',5,2,6,25,False),
    (7,'N Corp. Kleinhammer',1,'Gawky Nailing','Violet',3,2,4,25,False),
    (7,'N Corp. Kleinhammer',2,'Puri...fy!','Blue',6,1,8,50,False),
    (7,'N Corp. Kleinhammer',3,'Infirm Retribution','Orange',4,3,4,12.5,False),
    (7,'Seven Assoc. South Section 4',1,'Intuition','Red',3,2,4,25,False),
    (7,'Seven Assoc. South Section 4',2,'The Wrap-Up','Violet',6,1,10,50,False),
    (7,'Seven Assoc. South Section 4',3,'Forensics','Green',4,4,2,6.25,False),
    (7,'MultiCrack Office Fixer',1,'40S-2 Activation','Red',3,2,4,25,False),
    (7,'MultiCrack Office Fixer',2,'Photoelectric Mark','Violet',4,3,3,12.5,False),
    (7,'MultiCrack Office Fixer',3,'Photoelectric Harpoon','Blue',5,4,2,6.25,False),
    (7,'R Corp. 4th Pack Rabbit',1,'Graze the Grass','Red',4,3,2,12.5,False),
    (7,'R Corp. 4th Pack Rabbit',2,'Concentrated Fire','Green',4,4,2,6.25,False),
    (7,'R Corp. 4th Pack Rabbit',3,'Quick Suppression','Violet',3,5,2,3.125,False),
    (7,'Lobotomy E.G.O::Sunshower',1,'Umbrella Thwack','Violet',6,3,-2,12.5,False),
    (7,'Lobotomy E.G.O::Sunshower',2,'Puddle Stomp','Blue',10,4,-3,6.25,False),
    (7,'Lobotomy E.G.O::Sunshower',3,'Spread Out!','Yellow',18,3,-7,12.5,False),
    (7,'The Pequod Harpooneer',1,'Stalk Prey','Navy',3,2,4,25,False),
    (7,'The Pequod Harpooneer',2,'Snagharpoon','Violet',4,3,4,12.5,False),
    (7,'The Pequod Harpooneer',3,'Sever Knot','Violet',4,4,3,6.25,False),
    (7,'Öufi Assoc. South Section 3',1,'Execution Advised','Violet',3,2,4,25,False),
    (7,'Öufi Assoc. South Section 3',2,'Final Warning','Blue',4,2,6,25,False),
    (7,'Öufi Assoc. South Section 3',3,'Execution Sentencing','Navy',5,3,4,12.5,False),
    (7,'Wild Hunt',1,'Beheading','Red',3,2,4,25,False),
    (7,'Wild Hunt',2,'Memorial Procession','Violet',5,3,3,12.5,False),
    (7,'Wild Hunt',3,'Requiem','Blue',6,2,6,25,True),
    (7,'Full-Stop Office Fixer',1,'Return Fire','Blue',5,3,3,12.5,False),
    (7,'Full-Stop Office Fixer',2,'Headshot','Violet',10,1,12,50,False),
    (7,'Full-Stop Office Fixer',3,'Goin'' for the Bullseye','Navy',12,1,14,50,True),
    (7,'Kurokumo Clan Wakashu',1,'Lenticular Rend','Red',3,2,4,25,False),
    (7,'Kurokumo Clan Wakashu',2,'Stormcloud','Navy',4,2,6,25,False),
    (7,'Kurokumo Clan Wakashu',3,'Thundercleave','Orange',5,3,4,12.5,False),
    (7,'W Corp. L4 Cleanup Agent - CCA',1,'Congestion Cleanup','Green',3,2,4,25,False),
    (7,'W Corp. L4 Cleanup Agent - CCA',2,'Boost: Elbow Blade','Blue',5,2,6,25,False),
    (7,'W Corp. L4 Cleanup Agent - CCA',3,'Rip Space - CCA Overdrive','Violet',3,4,2,6.25,False),
    (7,'Heishou Pack - You Branch Adept',1,'Peck ''em','Violet',2,3,3,12.5,False),
    (7,'Heishou Pack - You Branch Adept',2,'Mutilating Talons','Green',4,3,4,12.5,False),
    (7,'Heishou Pack - You Branch Adept',3,'Bloodflame Massacre','Red',4,4,3,6.25,True),
    (7,'The Middle Big Brother',1,'Kicking','Red',2,3,3,12.5,False),
    (7,'The Middle Big Brother',2,'Watch Your Back!','Violet',4,3,4,12.5,False),
    (7,'The Middle Big Brother',3,'MY HAIR COUPOOOOOOOOOOONS!!!!','Violet',10,1,12,50,True),
    (8,'LCB Sinner',1,'Loggerhead','Red',4,1,7,50,False),
    (8,'LCB Sinner',2,'Slide','Green',6,1,9,50,False),
    (8,'LCB Sinner',3,'Shield Bash','Blue',8,1,12,50,False),
    (8,'Shi Assoc. South Section 5',1,'Flying Sword','Violet',3,2,4,25,False),
    (8,'Shi Assoc. South Section 5',2,'Flashing Strike','Orange',5,2,4,25,False),
    (8,'Shi Assoc. South Section 5',3,'Catch Breath','Red',6,2,6,25,False),
    (8,'LCCB Assistant Manager',1,'Shove','Green',4,1,6,50,False),
    (8,'LCCB Assistant Manager',2,'Quake Rounds','Blue',4,3,3,12.5,False),
    (8,'LCCB Assistant Manager',3,'Suppress','Navy',4,4,2,6.25,False),
    (8,'Lobotomy E.G.O::Sloshing',1,'It''s Heavy...!','Blue',4,1,6,50,False),
    (8,'Lobotomy E.G.O::Sloshing',2,'It''s Churning...!','Red',5,2,4,25,False),
    (8,'Lobotomy E.G.O::Sloshing',3,'Corrosive Splash','Green',6,1,16,50,False),
    (8,'Edgar Family Butler',1,'Sweeping Redirection','Yellow',3,2,4,25,False),
    (8,'Edgar Family Butler',2,'Housekeeping','Green',4,2,5,25,False),
    (8,'Edgar Family Butler',3,'Restraining Technique','Blue',4,3,3,12.5,False),
    (8,'R Corp. 4th Pack Reindeer',1,'Mind Strike','Blue',4,2,5,25,False),
    (8,'R Corp. 4th Pack Reindeer',2,'Flaying Surge','Violet',6,1,12,50,False),
    (8,'R Corp. 4th Pack Reindeer',3,'Mind Whip','Red',2,4,6,6.25,False),
    (8,'Liu Assoc. South Section 4',1,'Red Kick','Orange',4,2,3,25,False),
    (8,'Liu Assoc. South Section 4',2,'Frontal Assault','Red',4,3,4,12.5,False),
    (8,'Liu Assoc. South Section 4',3,'Inner Gate Elbow Strike','Violet',3,4,3,6.25,False),
    (8,'Molar Boatworks Fixer',1,'Ready to Crush','Navy',4,2,3,25,False),
    (8,'Molar Boatworks Fixer',2,'Explosive Blast','Yellow',5,2,5,25,False),
    (8,'Molar Boatworks Fixer',3,'Risky Judgement','Blue',3,3,5,12.5,False),
    (8,'The Pequod Captain',1,'To Me!','Violet',4,2,4,25,False),
    (8,'The Pequod Captain',2,'Pursue Them to the End!','Navy',4,3,4,12.5,False),
    (8,'The Pequod Captain',3,'Harpoon of Obsession','Red',4,4,3,6.25,False),
    (8,'Zwei Assoc. West Section 3',1,'Zwei Knight''s Greatsword Form','Navy',3,2,4,25,False),
    (8,'Zwei Assoc. West Section 3',2,'Can''t Let You Through.','Violet',4,3,4,12.5,False),
    (8,'Zwei Assoc. West Section 3',3,'Ward','Green',5,3,4,12.5,False),
    (8,'Kurokumo Clan Captain',1,'Clean Up','Violet',3,2,4,25,False),
    (8,'Kurokumo Clan Captain',2,'Sharpened Blade','Navy',4,2,6,25,False),
    (8,'Kurokumo Clan Captain',3,'Ink Over','Orange',5,3,4,12.5,False),
    (8,'Family Hierarch Candidate',1,'Crimson Strike','Blue',3,2,4,25,True),
    (8,'Family Hierarch Candidate',2,'Crimson Phoenix','Green',2,4,3,6.25,False),
    (8,'Family Hierarch Candidate',3,'Crimson Spring','Violet',8,1,14,50,False),
    (8,'Jeong''s Office Rep',1,'Tsuru-giri','Red',4,2,4,25,False),
    (8,'Jeong''s Office Rep',2,'Susuki Misdirection','Yellow',4,3,4,12.5,False),
    (8,'Jeong''s Office Rep',3,'Sakura-sen','Blue',5,3,4,12.5,True),
    (8,'The House of Spiders: The Middle Apprentice',1,'Totally Badass Ass-kicking','Orange',3,2,4,25,True),
    (8,'The House of Spiders: The Middle Apprentice',2,'Crossing Dervish','Red',4,3,4,12.5,False),
    (8,'The House of Spiders: The Middle Apprentice',3,'Violet~ Breaking Slam','Violet',4,4,3,6.25,False),
    (9,'LCB Sinner',1,'Strike Down','Green',4,1,7,50,False),
    (9,'LCB Sinner',2,'Axe Combo','Navy',4,2,4,25,False),
    (9,'LCB Sinner',3,'Slay','Red',4,4,2,6.25,False),
    (9,'LCCB Assistant Manager',1,'Bludgeon','Navy',5,1,6,50,False),
    (9,'LCCB Assistant Manager',2,'Thrust','Green',6,2,1,25,False),
    (9,'LCCB Assistant Manager',3,'Suppress','Violet',7,2,2,25,False),
    (9,'N Corp. Mittelhammer',1,'Devoted Hammering','Navy',3,2,4,25,False),
    (9,'N Corp. Mittelhammer',2,'Zealous Purge','Orange',6,2,2,25,False),
    (9,'N Corp. Mittelhammer',3,'Ironclad Retribution','Red',4,4,2,6.25,False),
    (9,'Zwei Assoc. South Section 5',1,'Careful Obstruction','Red',4,2,2,25,False),
    (9,'Zwei Assoc. South Section 5',2,'Focused Defense','Yellow',6,2,4,25,False),
    (9,'Zwei Assoc. South Section 5',3,'Subdue Threat','Blue',5,3,2,12.5,False),
    (9,'T Corp. Class 2 Collection Staff',1,'Prepare to Collect','Violet',3,2,4,25,False),
    (9,'T Corp. Class 2 Collection Staff',2,'T Corp. Martial Suppression','Red',4,2,5,25,False),
    (9,'T Corp. Class 2 Collection Staff',3,'Execute Collections','Yellow',2,4,3,6.25,False),
    (9,'Kurokumo Clan Wakashu',1,'Sharpened Blade','Blue',5,1,6,50,False),
    (9,'Kurokumo Clan Wakashu',2,'Scattering Slash','Orange',6,2,3,25,False),
    (9,'Kurokumo Clan Wakashu',3,'Sky-clearing Cut','Navy',7,1,18,50,False),
    (9,'Rosespanner Workshop Rep',1,'Rev Up','Navy',4,2,3,25,False),
    (9,'Rosespanner Workshop Rep',2,'Vibration Compression','Blue',6,2,3,25,False),
    (9,'Rosespanner Workshop Rep',3,'Let’s Rack Up Some Scores','Violet',5,3,4,12.5,False),
    (9,'Dieci Assoc. South Section 4',1,'Illuminate Thy Vacuity','Blue',3,3,2,12.5,False),
    (9,'Dieci Assoc. South Section 4',2,'Weight of Knowledge','Violet',3,4,3,6.25,False),
    (9,'Dieci Assoc. South Section 4',3,'Excruciating Study','Yellow',4,4,3,6.25,False),
    (9,'Liu Assoc. South Section 4 Director',1,'Flaming Fists','Navy',3,2,4,25,False),
    (9,'Liu Assoc. South Section 4 Director',2,'Fiery Knifehand-Combust','Red',4,3,4,12.5,False),
    (9,'Liu Assoc. South Section 4 Director',3,'Pinpoint Blitz','Orange',4,4,3,6.25,False),
    (9,'Devyat'' Assoc. North Section 3',1,'Courier Trunk - Decay Knife','Orange',3,2,4,25,False),
    (9,'Devyat'' Assoc. North Section 3',2,'Courier Trunk - Gadget Reveal','Red',4,3,4,12.5,False),
    (9,'Devyat'' Assoc. North Section 3',3,'I Trust Ya, Polu!','Green',5,3,4,12.5,False),
    (9,'The Princess of La Manchaland',1,'Begone...','Navy',3,2,4,25,False),
    (9,'The Princess of La Manchaland',2,'In Finely Ground Mistfall','Violet',4,3,4,12.5,False),
    (9,'The Princess of La Manchaland',3,'The Festival Will End','Orange',4,3,4,12.5,True),
    (9,'Heishou Pack - Si Branch',1,'Serpent Glint','Violet',3,2,4,25,False),
    (9,'Heishou Pack - Si Branch',2,'Snake Fang','Green',4,3,4,12.5,False),
    (9,'Heishou Pack - Si Branch',3,'Serpent''s Mortal Flurry','Blue',5,3,4,12.5,False),
    (9,'Lobotomy E.G.O::The Sword Sharpened with Tears',1,'The Knight''s Sanctuary','Blue',4,2,4,25,True),
    (9,'Lobotomy E.G.O::The Sword Sharpened with Tears',2,'With the Power of Justice','Violet',4,3,4,12.5,True),
    (9,'Lobotomy E.G.O::The Sword Sharpened with Tears',3,'Arcana Pierce','Navy',5,3,4,12.5,True),
    (9,'R Corp. 4th Pack Reindeer',1,'Energy Strike - ''That''s What You Get for Giving Us Holiday Shifts!''','Blue',3,2,4,25,False),
    (9,'R Corp. 4th Pack Reindeer',2,'Concentration - ''Burst and Pop with Christmas Colors!''','Violet',4,2,6,25,False),
    (9,'R Corp. 4th Pack Reindeer',3,'Mind Whip - ''Ahaha... Look, Everyone! We''re the Fireworks this Christmas!''','Red',4,4,3,6.25,False),
    (9,'The Ring Fauvist Docent',1,'Vehement Overpainting','Blue',6,1,7,50,False),
    (9,'The Ring Fauvist Docent',2,'Expression of Primary Colors','Violet',4,2,6,25,False),
    (9,'The Ring Fauvist Docent',3,'Le Fauvisme - Déchaînement Brutal','Orange',4,4,3,6.25,True),
    (11,'LCB Sinner',1,'Downward Swing','Navy',4,1,7,50,False),
    (11,'LCB Sinner',2,'Halberd Combo','Red',4,3,2,12.5,False),
    (11,'LCB Sinner',3,'Ravaging Cut','Violet',5,3,3,12.5,False),
    (11,'Zwei Assoc. South Section 6',1,'Baton','Blue',4,1,6,50,False),
    (11,'Zwei Assoc. South Section 6',2,'Suppress','Red',6,2,2,25,False),
    (11,'Zwei Assoc. South Section 6',3,'Strong Strike','Yellow',7,1,13,50,False),
    (11,'Los Mariachis Jefe',1,'Baile y Rola','Yellow',4,2,2,25,False),
    (11,'Los Mariachis Jefe',2,'Danza de Pasión','Violet',5,3,1,12.5,False),
    (11,'Los Mariachis Jefe',3,'Pañata Party','Blue',8,1,11,50,False),
    (11,'Lobotomy E.G.O::Red Sheet',1,'Magnify Wound','Green',5,1,5,50,False),
    (11,'Lobotomy E.G.O::Red Sheet',2,'Proliferating Talismans','Navy',4,3,3,12.5,False),
    (11,'Lobotomy E.G.O::Red Sheet',3,'Rupturing Talisman','Orange',5,2,6,25,False),
    (11,'Molar Boatworks Fixer',1,'Fierce Assault','Blue',2,4,1,6.25,False),
    (11,'Molar Boatworks Fixer',2,'Steady...','Violet',4,1,12,50,False),
    (11,'Molar Boatworks Fixer',3,'Gamble','Green',4,2,6,25,False),
    (11,'Zwei Assoc. West Section 3',1,'Suppressing.','Orange',3,2,4,25,False),
    (11,'Zwei Assoc. West Section 3',2,'Combat Preparation','Blue',4,2,5,25,False),
    (11,'Zwei Assoc. West Section 3',3,'Fence','Yellow',4,3,3,12.5,False),
    (11,'Blade Lineage Salsu',1,'Slice then Stab','Green',5,2,2,25,False),
    (11,'Blade Lineage Salsu',2,'Slash Series','Red',6,3,2,12.5,False),
    (11,'Blade Lineage Salsu',3,'To Claim Their Bones','Navy',8,1,18,50,False),
    (11,'The One Who Shall Grip',1,'Coerced Judgement','Blue',8,2,-2,25,False),
    (11,'The One Who Shall Grip',2,'Amoral Enactment','Orange',16,4,-4,6.25,False),
    (11,'The One Who Shall Grip',3,'Self-destructive Purge','Red',30,3,-12,12.5,False),
    (11,'Cinq Assoc. South Section 4 Director',1,'Remise','Green',3,2,4,25,False),
    (11,'Cinq Assoc. South Section 4 Director',2,'Engagement','Navy',4,3,4,12.5,False),
    (11,'Cinq Assoc. South Section 4 Director',3,'Contre Attaque','Orange',5,3,4,12.5,False),
    (11,'Dawn Office Fixer',1,'Fierce Charge','Blue',3,1,7,50,False),
    (11,'Dawn Office Fixer',2,'Sunset Blade','Violet',5,3,3,12.5,False),
    (11,'Dawn Office Fixer',3,'Stigmatize','Red',4,2,7,25,True),
    (11,'Devyat'' Assoc. North Section 3',1,'Courier Trunk - Decay Hammer','Orange',3,2,4,25,False),
    (11,'Devyat'' Assoc. North Section 3',2,'Courier Trunk - Demolition Gadget','Green',4,3,4,12.5,False),
    (11,'Devyat'' Assoc. North Section 3',3,'Poludnitsa... I trust you!','Red',5,3,4,12.5,False),
    (11,'The Middle Little Brother',1,'Is it You?!','Green',3,2,4,25,False),
    (11,'The Middle Little Brother',2,'Payback with Interest','Violet',4,3,4,12.5,False),
    (11,'The Middle Little Brother',3,'Write ''em all down','Violet',5,3,4,12.5,False),
    (11,'The Thumb East Soldato II',1,'Adherence to Propriety.','Orange',3,2,4,25,False),
    (11,'The Thumb East Soldato II',2,'Respect the Thumb.','Yellow',4,2,6,25,False),
    (11,'The Thumb East Soldato II',3,'Thruster Compression','Red',5,3,4,12.5,False),
    (11,'Heishou Pack - You Branch',1,'Oh, Let the Smell of Burning Blood…','Orange',2,3,3,12.5,False),
    (11,'Heishou Pack - You Branch',2,'… Fuel My Rampage.','Green',4,3,4,12.5,False),
    (11,'Heishou Pack - You Branch',3,'Bloodflame Massacre','Red',4,4,3,6.25,False),
    (11,'The House of Spiders: The Pinky Apprentice',1,'Chainstrike','Blue',3,2,4,25,False),
    (11,'The House of Spiders: The Pinky Apprentice',2,'Nameless Slash','Navy',6,2,5,25,False),
    (11,'The House of Spiders: The Pinky Apprentice',3,'Fallstar Slayer','Red',8,1,14,50,False),
    (12,'LCB Sinner',1,'Pulled Blade','Yellow',3,3,2,12.5,False),
    (12,'LCB Sinner',2,'Backslash','Navy',5,2,4,25,False),
    (12,'LCB Sinner',3,'Piercing Thrust','Blue',7,1,14,50,False),
    (12,'Blade Lineage Salsu',1,'Draw of the Sword','Red',4,1,6,50,False),
    (12,'Blade Lineage Salsu',2,'Acupuncture','Orange',5,2,4,25,False),
    (12,'Blade Lineage Salsu',3,'Decisive Dive','Navy',6,2,4,25,False),
    (12,'G Corp. Head Manager',1,'Order','Yellow',4,1,6,50,False),
    (12,'G Corp. Head Manager',2,'Onslaught Command','Green',6,1,10,50,False),
    (12,'G Corp. Head Manager',3,'Focus','Blue',6,1,16,50,False),
    (12,'Cinq Assoc. South Section 4',1,'Marche','Navy',3,2,4,25,False),
    (12,'Cinq Assoc. South Section 4',2,'Punition','Blue',4,2,5,25,False),
    (12,'Cinq Assoc. South Section 4',3,'Balestra Fente','Orange',8,1,14,50,False),
    (12,'The Ring Pointillist Student',1,'Dotting','Orange',3,2,4,25,False),
    (12,'The Ring Pointillist Student',2,'Sanguine Painting','Red',5,2,4,25,False),
    (12,'The Ring Pointillist Student',3,'Artwork Inspection','Green',4,2,6,25,False),
    (12,'Seven Assoc. South Section 6 Director',1,'Predictive Analysis','Green',6,1,4,50,False),
    (12,'Seven Assoc. South Section 6 Director',2,'Field Command','Yellow',5,2,5,25,False),
    (12,'Seven Assoc. South Section 6 Director',3,'Exploit the Gap','Orange',6,3,2,12.5,False),
    (12,'Molar Office Fixer',1,'Wait Up!','Red',4,1,7,50,False),
    (12,'Molar Office Fixer',2,'Slice','Orange',3,3,5,12.5,False),
    (12,'Molar Office Fixer',3,'Daring Decision','Yellow',4,4,3,6.25,False),
    (12,'Lobotomy E.G.O::Magic Bullet',1,'Ignition','Red',3,2,4,25,False),
    (12,'Lobotomy E.G.O::Magic Bullet',2,'Detonate Magic Bullet','Navy',4,2,6,25,False),
    (12,'Lobotomy E.G.O::Magic Bullet',3,'Magic Bullet Fire','Navy',15,1,4,50,False),
    (12,'Wuthering Heights Chief Butler',1,'Knocking','Navy',3,2,4,25,False),
    (12,'Wuthering Heights Chief Butler',2,'Dusting','Blue',4,3,4,12.5,False),
    (12,'Wuthering Heights Chief Butler',3,'As Mistress Commands','Orange',4,4,3,6.25,False),
    (12,'W Corp. L3 Cleanup Captain',1,'Ripple','Navy',3,2,4,25,False),
    (12,'W Corp. L3 Cleanup Captain',2,'Charged Leap','Violet',5,2,6,25,False),
    (12,'W Corp. L3 Cleanup Captain',3,'Rip Dimension','Blue',4,4,3,6.25,False),
    (12,'The Barber of La Manchaland',1,'Sewing','Green',3,2,4,25,False),
    (12,'The Barber of La Manchaland',2,'Scission','Orange',4,3,4,12.5,False),
    (12,'The Barber of La Manchaland',3,'I''ll Make You a New Dress!','Red',3,4,3,6.25,False),
    (12,'Heishou Pack - Mao Branch',1,'Blinkstep','Yellow',4,2,3,25,False),
    (12,'Heishou Pack - Mao Branch',2,'Perforating Kill','Green',4,3,6,12.5,False),
    (12,'Heishou Pack - Mao Branch',3,'Cursewrit Butcherblade','Blue',5,3,4,12.5,False),
    (12,'T Corp. Class 3 VDCU Staff',1,'Prepare to Collect','Navy',3,2,4,25,False),
    (12,'T Corp. Class 3 VDCU Staff',2,'T Corp. Microcavity Module','Yellow',3,3,5,12.5,False),
    (12,'T Corp. Class 3 VDCU Staff',3,'T-3 Collector Mace Max Activation','Orange',5,3,4,12.5,False),
    (12,'LCA Udjat Vanguard Team 3 Leader',1,'Khopesh Swordplay','Navy',3,2,4,25,False),
    (12,'LCA Udjat Vanguard Team 3 Leader',2,'Mirage Incision','Yellow',4,3,4,12.5,False),
    (12,'LCA Udjat Vanguard Team 3 Leader',3,'The Vanguard will See it Done','Blue',6,3,4,12.5,False),
    (13,'LCB Sinner',1,'Swipe','Blue',4,1,7,50,False),
    (13,'LCB Sinner',2,'Jag','Green',5,2,10,25,False),
    (13,'LCB Sinner',3,'Chop Up','Yellow',6,2,4,25,False),
    (13,'Liu Assoc. South Section 6',1,'Single-point Stab','Red',4,2,2,25,False),
    (13,'Liu Assoc. South Section 6',2,'Rush Down','Orange',5,3,2,12.5,False),
    (13,'Liu Assoc. South Section 6',3,'Perfected Palm Strike','Yellow',4,4,2,6.25,False),
    (13,'R.B. Sous-chef',1,'Keep It Fresh','Orange',4,2,2,25,False),
    (13,'R.B. Sous-chef',2,'You Fresh Enough?','Green',6,1,8,50,False),
    (13,'R.B. Sous-chef',3,'Butcher Viand','Violet',5,4,1,6.25,False),
    (13,'Rosespanner Workshop Fixer',1,'Rev Up','Green',3,2,4,25,False),
    (13,'Rosespanner Workshop Fixer',2,'Grease Chains','Violet',4,1,12,50,False),
    (13,'Rosespanner Workshop Fixer',3,'Let''s Grind ''Em','Blue',4,3,3,12.5,False),
    (13,'Kurokumo Clan Captain',1,'Lenticular Rend','Yellow',5,1,5,50,False),
    (13,'Kurokumo Clan Captain',2,'Shadow Cloud','Orange',5,2,5,25,False),
    (13,'Kurokumo Clan Captain',3,'Shadowcloud Shattercleave','Blue',4,3,3,12.5,False),
    (13,'G Corp. Manager Corporal',1,'Hack','Green',4,2,3,25,False),
    (13,'G Corp. Manager Corporal',2,'Dismember','Yellow',6,1,10,50,False),
    (13,'G Corp. Manager Corporal',3,'Eviscerate','Orange',4,4,2,6.25,False),
    (13,'Zwei Assoc. South Section 4',1,'Standoff','Yellow',4,2,3,25,False),
    (13,'Zwei Assoc. South Section 4',2,'Flexible Suppression','Green',3,4,3,6.25,False),
    (13,'Zwei Assoc. South Section 4',3,'Guardian','Blue',5,3,3,12.5,False),
    (13,'Twinhook Pirates First Mate',1,'Negotiation Start','Yellow',4,2,3,25,False),
    (13,'Twinhook Pirates First Mate',2,'Unilateral Business','Navy',4,2,6,25,False),
    (13,'Twinhook Pirates First Mate',3,'Foregone Conclusion','Blue',5,2,6,25,False),
    (13,'Edgar Family Heir',1,'Sabre Slash','Violet',5,1,6,50,False),
    (13,'Edgar Family Heir',2,'Remise','Blue',4,2,6,25,False),
    (13,'Edgar Family Heir',3,'Nightmare Hunt','Orange',4,4,3,6.25,False),
    (13,'The Priest of La Manchaland',1,'Sacrifice for the Family','Green',3,2,4,25,False),
    (13,'The Priest of La Manchaland',2,'Suffocating Guilt','Navy',4,2,6,25,False),
    (13,'The Priest of La Manchaland',3,'The Unforgivable Sin','Orange',5,3,4,12.5,False),
    (13,'Firefist Office Survivor',1,'Flamethrow','Orange',3,2,4,25,False),
    (13,'Firefist Office Survivor',2,'I''ll burn away every last drop of your filthy blood','Red',4,2,6,25,False),
    (13,'Firefist Office Survivor',3,'Firefist','Red',5,3,4,12.5,False),
    (13,'Night Awls Capitano',1,'Gap Attack','Yellow',3,2,4,25,True),
    (13,'Night Awls Capitano',2,'Stiletto Doppio','Orange',4,3,4,12.5,False),
    (13,'Night Awls Capitano',3,'Execution','Navy',4,4,3,6.25,True),
    (13,'Lobotomy E.G.O::Lamp',1,'Intense Stare: Zero Range','Red',3,2,4,25,False),
    (13,'Lobotomy E.G.O::Lamp',2,'Destroy the Visible with the Invisible','Blue',3,4,3,6.25,False),
    (13,'Lobotomy E.G.O::Lamp',3,'Salvation for those Enchanted by the Lamp','Navy',5,3,4,12.5,False),
    (13,'LCE E.G.O::AEDD',1,'Electric Release','Green',3,2,4,25,False),
    (13,'LCE E.G.O::AEDD',2,'DC Inversion','Blue',4,3,4,12.5,False),
    (13,'LCE E.G.O::AEDD',3,'High-voltage Current Discharge','Violet',5,3,4,12.5,True);
DROP TABLE IF EXISTS `alternate skills`;

CREATE TABLE `alternate skills` (
    `Sinner` int NOT NULL,
    `Identity` varchar(50) NOT NULL,
    `Number` tinyint NOT NULL,
    `Name` varchar(120) NOT NULL,
    `Color` enum('Red','Orange','Yellow','Green','Blue','Navy','Violet','Black','White'),
    `Base Power` tinyint NOT NULL,
    `Coin Number` tinyint NOT NULL,
    `Coin Power` tinyint NOT NULL,
    `Max Chance` decimal(5,3) NOT NULL,
    PRIMARY KEY (Sinner, Identity, Number),
    FOREIGN KEY (Sinner, Identity, Number) REFERENCES `skills`(`Sinner`,`Identity`,`Number`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `alternate skills` VALUES
    (1, 'Heishou Pack - Wu Branch Adept', 3, 'Obsidian Stormrider''s Crescent Decapitator', 'Green', 5, 4, 3, 6.25),
    (1, 'The House of Spiders: The Index Nursefather', 3, 'Furioso-Replica', 'Red', 3, 9, 3, 0.195),
    (2, 'LCE E.G.O::Ardor Blossom Star',3,'A.B.S. Max Attunement [Degraded Corrosion]','Red',5,3,4,12.5),
    (2, 'Heishou Pack - Mao Branch Adept',3,'Ascendant Heishou - Mao Technique: Cloudsplitting Manifestation','Green',5,3,4,12.5),
    (2, 'Shi Assoc. East Section 3',3,'Bow''s Glimmer','Orange',4,1,4,50),
    (2, 'The House of Spiders: The Ring Apprentice',2,'Time for Your Meal, Fascia','Violet',4,3,4,12.5),
    (2, 'The House of Spiders: The Ring Apprentice',3,'Liberation of the Repressed Flesh','Orange',4,4,3,6.25),
    (3, 'The Manager of La Manchaland', 1, 'Variant Sancho Hardblood Arts 6 - Whip', 'Yellow', 4, 3, 3, 12.5),
    (3, 'The Manager of La Manchaland', 2, 'Variant Sancho Hardblood Arts 8 - Split Apart', 'Red', 4,3,3, 12.5),
    (3, 'The Manager of La Manchaland', 3, 'Ascendant Sancho Hardblood Arts - La Sangre', 'Orange', 5,4,5, 6.25),
    (3, 'Lobotomy E.G.O::In the Name of Love and Hate', 1, 'Where are... the villains...?', 'Red', 12, 2, -4, 25),
    (3, 'Lobotomy E.G.O::In the Name of Love and Hate', 2, 'Get out of my head...', 'Violet', 15, 2, -6, 25),
    (3, 'Lobotomy E.G.O::In the Name of Love and Hate', 3, 'Reversed Beats / Reversed Arcana Slave', 'Violet', 20, 3, -6, 12.5),
    (3, 'The Index Proxy - Effloresced E.G.O::Procuration', 1, 'Let These Hands be the Proxy with Which...', 'Orange', 4, 2, 4, 25),
    (3, 'The Index Proxy - Effloresced E.G.O::Procuration', 2, 'Procuration: Engrave', 'Navy', 5, 3, 4, 12.5),
    (3, 'The Index Proxy - Effloresced E.G.O::Procuration', 3, 'Procuration: Annihilate', 'Blue', 5, 4, 3, 6.25),
    (4, 'Lobotomy E.G.O::Red Eyes & Penitence', 3, 'Serious Skullbuster', 'Orange', 5, 3, 4, 12.5),
    (4, 'N Corp. E.G.O::Contempt, Awe', 3, 'Cascading Gaze of Awe Underneath Contempt', 'Orange', 14, 1, 14, 50),
    (4, 'Lobotomy E.G.O::Faint Aroma & Solitude', 1, 'Stories that Never Cease', 'Yellow', 9, 3, 1, 12.5),
    (4, 'Lobotomy E.G.O::Faint Aroma & Solitude', 3, 'Magnificent End', 'Blue', 12, 1, 7, 50),
    (5,'The Thumb East Capo IIII',3,'Savage Tigerslayer''s Perfected Flurry of Blades','Red',3,5,3,3.125),
    (5,'The Prince of La Manchaland',3,'Ouvertüre','Orange',4,4,3,6.25),
    (6,'Full-Stop Office Rep',1,'Melee Support','Navy','5',2,4,25),
    (6,'Full-Stop Office Rep',2,'Combo: Target Marked','Blue',4,4,4,6.25),
    (6,'Full-Stop Office Rep',3,'Combo: Full-Stop to Life','Navy',7,4,4,6.25),
    (6,'The House of Spiders: The Ring Nursefather',3,'Closing Time - Installation Art no. 1: Your Flesh and Bones as the Gallery''s Seats','Orange',3,5,4,3.125),
    (7,'Wild Hunt',3,'Lament, Mourn, and Despair','Blue',31,2,-13,25),
    (7,'Full-Stop Office Fixer',3,'AL-HV Pulverisation Round','Navy',15,1,18,50),
    (7,'Heishou Pack - You Branch Adept',3,'Rooster''s Rampaging Blades Under the Ensanguined Heaven','Red',5,4,3,6.25),
    (7,'The Middle Big Brother',3,'COMPLETE AND TOTAL EXTERMINATION!!','Violet',16,1,10,50),
    (8,'Family Hierarch Candidate',1,'Crimson Strike - Launcher','Blue',2,2,2,25),
    (8,'Jeong''s Office Rep',3,'Kōzan','Violet',4,1,5,50),
    (9,'The Princess of La Manchaland',3,'Ascendant Don Quixote Hardblood Arts - The Finale','Orange',4,3,5,12.5),
    (9,'Lobotomy E.G.O::The Sword Sharpened with Tears',1,'Faded Faith','Blue','10',2,-4,25),
    (9,'Lobotomy E.G.O::The Sword Sharpened with Tears',2,'With the Tear-sharpened Sword','Violet',16,3,-4,12.5),
    (9,'Lobotomy E.G.O::The Sword Sharpened with Tears',3,'Arcana: Tear and Pierce','Navy',20,3,-5,12.5),
    (9,'The Ring Fauvist Docent',3,'Burst Forth the Pulsing Crimson under Your Skin','Orange',5,4,3,6.25),
    (11,'Dawn Office Fixer',3,'Blazing Strike','Red',13,1,15,50),
    (13,'Night Awls Capitano',1,'Mercé','Yellow',4,1,6,50),
    (13,'Night Awls Capitano',3,'The Night''s Awl','Navy',4,4,3,6.25),
    (13,'LCE E.G.O::AEDD',3,'Maximum Output - Ultra High-voltage Current Discharge','Violet',5,3,5,12.5);

-- Views
CREATE VIEW `ID Summary` AS
SELECT identities.`Release Date`, sinners.Name, identities.identity AS Identity, seasons.Name AS Season,
  CASE Rarity -- In the game, rarity is classified into 0, 00, and 000.
    WHEN 1 THEN '0'
    WHEN 2 THEN '00'
    WHEN 3 THEN '000'
  END AS Rarity,
  identities.Gore
  FROM identities
  JOIN sinners ON identities.SinnerID = sinners.ID
  JOIN seasons ON identities.Season = seasons.ID
  ORDER BY `Release Date` DESC, `Rarity` DESC, `Season` ASC;

CREATE VIEW `Identity Total` AS
  SELECT sinners.Name,
  COUNT(*) AS `Number of Identities`,
  MAX(identities.`Release Date`) AS `Most Recent Identity`
  FROM identities
  JOIN sinners ON identities.SinnerID = sinners.ID
  GROUP BY SinnerID;

CREATE VIEW `Skill Summary` AS  -- better way to do this?
    SELECT DISTINCT sinners.Name, identities.Identity, skills.Number AS `Skill Number`, skills.Name AS `Skill Name`,
        LEAST(skills.`Base Power`, skills.`Base Power` + (skills.`Coin Number`*skills.`Coin Power`)) AS `Min Power`,
        GREATEST(skills.`Base Power`, skills.`Base Power` + (skills.`Coin Number`*skills.`Coin Power`)) AS `Max Power`,
        CONCAT(TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM skills.`Max Chance`)), '%') AS `Max Chance`,
        'No' AS `Is Alternate`
    FROM skills
    JOIN sinners ON skills.Sinner = sinners.ID
    JOIN identities ON skills.Identity = identities.Identity
    UNION ALL
    SELECT DISTINCT sinners.Name, identities.Identity, `alternate skills`.Number AS `Skill Number`, `alternate skills`.Name AS `Skill Name`,
        LEAST(`alternate skills`.`Base Power`, `alternate skills`.`Base Power` + (`alternate skills`.`Coin Number`*`alternate skills`.`Coin Power`)) AS `Min Power`,
        GREATEST(`alternate skills`.`Base Power`, `alternate skills`.`Base Power` + (`alternate skills`.`Coin Number`*`alternate skills`.`Coin Power`)) AS `Max Power`,
        CONCAT(TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM `alternate skills`.`Max Chance`)), '%') AS `Max Chance`,
        'Yes' AS `Is Alternate`
    FROM `alternate skills`
    JOIN sinners ON `alternate skills`.Sinner = sinners.ID
    JOIN identities ON `alternate skills`.Identity = identities.Identity
    ORDER BY Name, Identity, `Is Alternate`, `Skill Number`;

-- Functions
DROP FUNCTION IF EXISTS getSinnerID;
Delimiter $$
CREATE FUNCTION getSinnerID(mySinnerName varchar(50))
RETURNS INT DETERMINISTIC
BEGIN
   DECLARE foundSinnerID INT;
   SELECT ID INTO foundSinnerID FROM sinners WHERE Name = mySinnerName;
   IF foundSinnerID IS NULL
       THEN SET foundSinnerID = -1;
   END IF;
   RETURN foundSinnerID;
END $$
Delimiter ;

DROP FUNCTION IF EXISTS getSeasonID;
Delimiter $$
CREATE FUNCTION getSeasonID(mySeasonName varchar(50))
RETURNS INT DETERMINISTIC
BEGIN
   DECLARE foundSeasonID INT;
   SELECT ID INTO foundSeasonID FROM sinners WHERE Name = mySeasonName;
   IF foundSeasonID IS NULL
       THEN SET foundSeasonID = -2;
   END IF;
   RETURN foundSeasonID;
END $$
Delimiter ;


-- Procedures
DROP PROCEDURE IF EXISTS getSinnerList;
DROP PROCEDURE IF EXISTS getSeasonList;
DROP PROCEDURE IF EXISTS getIdentityList;
DROP PROCEDURE IF EXISTS getSkillList;
DROP PROCEDURE IF EXISTS getCustomSkillList;
DROP PROCEDURE IF EXISTS getBaseChance;
DROP PROCEDURE IF EXISTS getCoinDetails;
DROP PROCEDURE IF EXISTS hasAlternate;
DROP PROCEDURE IF EXISTS getAltCoinDetails;
DROP PROCEDURE IF EXISTS getAltBaseChance;

Delimiter $$
CREATE PROCEDURE getSinnerList()
BEGIN
    SELECT Name FROM sinners;
END $$

CREATE PROCEDURE getSeasonList()
BEGIN
    SELECT Name FROM seasons;
END $$

CREATE PROCEDURE getIdentityList(mySinnerName varchar(50))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    SELECT Identity FROM identities WHERE SinnerID = foundSinnerID;
END $$

CREATE PROCEDURE getSkillList(mySinnerName varchar(50), myIdentityName varchar(50))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) into foundSinnerID;
    SELECT Name FROM skills WHERE Sinner = foundSinnerID AND Identity = myIdentityName;
END $$

CREATE PROCEDURE getCustomSkillList(mySinnerName varchar(50), myIdentityName varchar(50))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) into foundSinnerID;
    SELECT Name FROM skills WHERE Sinner = foundSinnerID AND Identity = myIdentityName AND Number = 4;
END $$

CREATE PROCEDURE getBaseChance(mySinnerName varchar(50), myIDName varchar(50), mySkillName varchar(120))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    SELECT `Max Chance` FROM skills WHERE Sinner = foundSinnerID AND Identity = myIDName AND Name = mySkillName;
END $$

CREATE PROCEDURE getCoinDetails(mySinnerName varchar(50), myIDName varchar(50), mySkillName varchar(120))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    SELECT `Base Power`, `Coin Number`, `Coin Power` FROM skills WHERE Sinner = foundSinnerID AND Identity = myIDName AND Name = mySkillName;
END $$

CREATE PROCEDURE hasAlternate(mySinnerName varchar(50), myIDName varchar(50), mySkillName varchar(120))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    SELECT Alternate FROM skills WHERE Sinner = foundSinnerID AND Identity = myIDName AND Name = mySkillName;
END $$

CREATE PROCEDURE getAltCoinDetails(mySinnerName varchar(50), myIDName varchar(50), mySkillName varchar(120))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    SELECT `Base Power`, `Coin Number`, `Coin Power` FROM `alternate skills` WHERE Sinner = foundSinnerID AND Identity = myIDName AND Name = mySkillName;
END $$

CREATE PROCEDURE getAltBaseChance(mySinnerName varchar(50), myIDName varchar(50), mySkillName varchar(120))
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    SELECT `Max Chance` FROM `alternate skills` WHERE Sinner = foundSinnerID AND Identity = myIDName AND Name = mySkillName;
END $$
Delimiter ;


DROP PROCEDURE IF EXISTS addIdentity;
DROP PROCEDURE IF EXISTS addSkill;

Delimiter $$
CREATE PROCEDURE addIdentity(IN mySinnerName varchar(50), myIdentityName varchar(50), myRarity tinyint)
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;

    IF foundSinnerID = -1
		THEN SELECT -2 AS NotFound;
	ELSEIF EXISTS (
        SELECT * FROM identities WHERE SinnerID = foundSinnerID AND Identity = myIdentityName
    )   THEN SELECT -1 AS NotFound;
    ELSE INSERT INTO identities
		VALUES(foundSinnerID, myIdentityName, CURDATE(), 99, myRarity, 'None');
	END IF;
END $$
Delimiter ;

Delimiter $$
CREATE PROCEDURE addSkill(IN mySinnerName varchar(50), myIdentityName varchar(50), mySkillNumber tinyint, mySkillName varchar(120), mySkillColor enum('Red','Orange','Yellow','Green','Blue','Navy','Violet','Black','White'), myBasePower tinyint, myCoinNumber tinyint, myCoinPower tinyint)
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    IF foundSinnerID = -1
		THEN SELECT -2 AS NotFound;
	ELSEIF EXISTS (
        SELECT * FROM skills WHERE Sinner = foundSinnerID AND Identity = myIdentityName AND Number = mySkillNumber
    )   THEN SELECT -1 AS NotFound;
    ELSE INSERT INTO skills
		VALUES(foundSinnerID, myIdentityName, mySkillNumber, mySkillName, mySkillColor, myBasePower, myCoinNumber, myCoinPower, (1.0/(2*myCoinNumber)*100), False);
	END IF;
END $$
Delimiter ;

DROP PROCEDURE IF EXISTS deleteIdentity;
DROP PROCEDURE IF EXISTS deleteSkill;

Delimiter $$

CREATE PROCEDURE deleteIdentity(IN mySinnerID int, identityName varchar(50))
BEGIN
    DELETE FROM identities WHERE SinnerID = mySinnerID AND Identity = identityName;
    IF ROW_COUNT() = 0 THEN
        SELECT -1 AS NotFound;
    END IF;
END $$
Delimiter ;

Delimiter $$
CREATE PROCEDURE deleteSkill(IN mySinnerName varchar(50), identityName varchar(50), mySkillNumber tinyint)
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    DELETE FROM skills WHERE Sinner = foundSinnerID AND Identity = identityName AND Number = mySkillNumber;
    IF ROW_COUNT() = 0 THEN
        SELECT -1 AS NotFound;
    END IF ;
END $$
Delimiter ;

DROP PROCEDURE IF EXISTS updateIdentity;
DROP PROCEDURE IF EXISTS updateSkill;

Delimiter $$
CREATE PROCEDURE updateIdentity(IN mySinnerName varchar(50), myIdentityName varchar(50), myRarity tinyint)
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;

    IF foundSinnerID = -1
		THEN SELECT -2 AS NotFound;
	ELSEIF NOT EXISTS (
        SELECT * FROM identities WHERE SinnerID = foundSinnerID AND Identity = myIdentityName
    )   THEN SELECT -1 AS NotFound;
    ELSE UPDATE identities
		SET Rarity = myRarity WHERE SinnerID = foundSinnerID AND Identity = myIdentityName;
	END IF;
END $$
Delimiter ;

Delimiter $$
CREATE PROCEDURE updateSkill(IN mySinnerName varchar(50), myIdentityName varchar(50), mySkillNumber tinyint, mySkillName varchar(120), mySkillColor enum('Red','Orange','Yellow','Green','Blue','Navy','Violet','Black','White'), myBasePower tinyint, myCoinNumber tinyint, myCoinPower tinyint)
BEGIN
    DECLARE foundSinnerID int;
    SELECT getSinnerID(mySinnerName) INTO foundSinnerID;
    IF foundSinnerID = -1
		THEN SELECT -2 AS NotFound;
	ELSEIF NOT EXISTS (
        SELECT * FROM skills WHERE Sinner = foundSinnerID AND Identity = myIdentityName AND Number = mySkillNumber
    )   THEN SELECT -1 AS NotFound;
    ELSE UPDATE skills
		SET Name = mySkillName,
		    Color = mySkillColor,
		    `Base Power` = myBasePower,
            `Coin Number` = myCoinNumber,
            `Coin Power` = myCoinPower,
            `Max Chance` = (1.0/(2*myCoinNumber)*100)
        WHERE Sinner = foundSinnerID AND Identity = myIdentityName AND Number = mySkillNumber;
	END IF;
END $$
Delimiter ;