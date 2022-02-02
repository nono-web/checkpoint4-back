DROP TABLE IF EXISTS `footballplayer`;
DROP TABLE IF EXISTS `stadium`;
DROP TABLE IF EXISTS `club`;
DROP TABLE IF EXISTS `championship`;

CREATE TABLE `championship` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(350) NOT NULL,
  `logo` VARCHAR(350) NOT NULL
);

INSERT INTO `championship`(`name`, `logo`) 
VALUES 
  ('Ligue 1', 'https://seeklogo.com/images/L/ligue-1-uber-eats-logo-E440240623-seeklogo.com.png'),
  ('Ligue 2', 'https://www.footpack.fr/wp-content/uploads/2020/06/nouveau-logo-ligue-2-bkt-officiel-lfp.jpg'),
  ('Premiére ligue', 'https://logodownload.org/wp-content/uploads/2016/03/premier-league-5.png'),
  ('La liga', 'https://content.sportslogos.net/logos/130/4163/full/7308_la_liga_-primary-2015.png'),
  ('Bundesliga', 'https://2.bp.blogspot.com/-v2hnTua9OXg/ULB7Lg9ZWHI/AAAAAAAAARs/hF7hktyDj64/s400/Bundesliga-Logo-2010.png');

CREATE TABLE `club` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(355) NOT NULL,
  `crest` VARCHAR(355) NOT NULL,
  `championshipId` INT NOT NULL,
  FOREIGN KEY (championshipId) REFERENCES championship(id)
);

INSERT INTO `club`(`name`, `crest`, `championshipId`) 
VALUES 
  ('Angers', 'https://cdn.freelogovectors.net/wp-content/uploads/2020/08/angers-logo-768x768.png', 1),
  ('Bordeaux', 'https://logodownload.org/wp-content/uploads/2019/09/fc-bordeaux-logo-0.png', 1),
  ('Brest', 'https://apps-cloud.n-tv.de/img/1973241-1290239234000/4-3/320/logo-brest.jpg', 1),
  ('Clermont', 'https://www.stickers-folies.fr/ar-stickers-clermont-foot-63-15799.jpg', 1),
  ('Lens', 'https://www.color-stickers.com/2162-large_default/stickers-logo-foot-racing-club-de-lens.jpg', 1),
  ('Lille', 'https://www.logofootball.net/wp-content/uploads/Lille-OSC-HD-Logo.png', 1),
  ('Lorient', 'https://2.bp.blogspot.com/-iNpKRaby0SQ/U_Xe5OCOKVI/AAAAAAAADmY/HASua6tlFeY/s1600/Logo%2BFC%2BLorient.png', 1),
  ('Lyon', 'https://www.logofootball.net/wp-content/uploads/Olympique-Lyonnais-HD-Logo.png', 1),
  ('Marseille', 'https://www.logofootball.net/wp-content/uploads/Olympique-Marseille-HD-Logo.png', 1),
  ('Metz', 'https://logodownload.org/wp-content/uploads/2019/09/fc-metz-logo-0.png', 1),
  ('Monaco', 'https://www.logofootball.net/wp-content/uploads/AS-Monaco-FC-HD-Logo.png', 1),
  ('Montpellier', 'https://www.logofootball.net/wp-content/uploads/Montpellier-HSC-HD-Logo.png', 1),
  ('Nantes', 'https://www.logofootball.net/wp-content/uploads/FC-Nantes-HD-Logo.png', 1),
  ('Nice', 'https://www.logofootball.net/wp-content/uploads/OGC-Nice-HD-Logo.png', 1),
  ('PSG', 'https://www.logofootball.net/wp-content/uploads/Paris-Saint-Germain-FC-HD-Logo.png', 1),
  ('Reims', 'https://www.logofootball.net/wp-content/uploads/Stade-de-Reims-HD-Logo.png', 1),
  ('Rennes', 'https://www.logofootball.net/wp-content/uploads/Stade-Rennais-FC.png', 1),
  ('Saint Etienne', 'https://www.logofootball.net/wp-content/uploads/AS-Saint-Etienne-HD-Logo.png', 1),
  ('Strasbourg', 'https://www.logofootball.net/wp-content/uploads/RC-Strasbourg-Alsace-HD-Logo.png', 1),
  ('Troyes', 'https://clipart.info/images/ccovers/1503438039troyes-ac-logo-png.png', 1)
  ;

CREATE TABLE `stadium` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(355) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `capacity` VARCHAR(20) NOT NULL,
  `img` VARCHAR(255) NOT NULL,
  `clubId` INT NOT NULL,
  FOREIGN KEY (clubId) REFERENCES club(id)
);

INSERT INTO `stadium`(`name`, `city`, `capacity`, `img`, `clubId`) 
VALUES 
  ('Matmut Atlantique', 'Bordeaux', '42052', 'https://img.20mn.fr/knbPfii8QjubLDQ4Ai22Vg/490x314_le-stade-matmut-atlantique-a-l-occasion-du-quart-de-finale-de-l-euro-entre-l-allemagne-et-l-italie.jpg', 2);
  
CREATE TABLE `footballplayer` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(350) NOT NULL,
  `lastname` VARCHAR(350) NOT NULL,
  `age` VARCHAR(20) NOT NULL,
  `img` VARCHAR(355) NOT NULL,
  `height` FLOAT NOT NULL,
  `weight` FLOAT NOT NULL,
  `number` VARCHAR(20) NOT NULL,
  `post` VARCHAR(255) NOT NULL,   
  `clubId` INT NOT NULL,
  FOREIGN KEY (clubId) REFERENCES club(id)
);

INSERT INTO `footballplayer`(`firstname`, `lastname`, `age`, `img`, `height`, `weight`, `number`, `post`, `clubId`) 
VALUES 
  ('Benoit', 'Costil', '34',  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Beno%C3%AEt_Costil_2018.jpg/250px-Beno%C3%AEt_Costil_2018.jpg', 1.88, 88, '1', 'Gardien de but', 2),
  ('Laurent', 'koscielny', '36', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Koscielny_France.jpg/220px-Koscielny_France.jpg', 1.85, 82, '6', 'defenseur central', 2),
  ('Enock', 'Kwateng', '25', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/FBBP01_-_FCN_-_20151028_-_Coupe_de_la_Ligue_-_Enock_Kwateng.jpg/280px-FBBP01_-_FCN_-_20151028_-_Coupe_de_la_Ligue_-_Enock_Kwateng.jpg', 1.81, 80, '25', 'defenseur droit', 2),
  ('Paul', 'baysse', '33', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Paul_Baysse_%28cropped%29.jpg/230px-Paul_Baysse_%28cropped%29.jpg', 1.85, 77, '24', 'defenseur central', 2),
  ('Loris', 'Benito', '29',  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/SwitzerlandU21_03_Loris_Benito_130606_Sve-Sch_3-2_170826_6200.jpg/180px-SwitzerlandU21_03_Loris_Benito_130606_Sve-Sch_3-2_170826_6200.jpg', 1.84, 75, '23', 'defenseur gauche', 2),
  ('Yacine', 'Adli', '21', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_52.jpg/250px-Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_52.jpg', 1.86, 73, '19', 'millieu defensif', 2),
  ('Toma', 'Basic', '23', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_61.jpg/280px-Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_61.jpg', 1.89, 80, '26', 'millieu defensif', 2),
  ('Tom', 'Lacoux', '23', 'http://www.formationgirondins.fr/upload/joueurs/1563442394.png', 1.75, 68, '27', 'millieu', 2),
  ('Jimmy', 'Briand', '36', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_9.jpg/250px-Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_9.jpg', 1.83, 84, '7', 'attaquant', 2),
  ('Samuel', 'Kalu', '26', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_56.jpg/250px-Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_56.jpg', 1.76, 74, '10', 'attaquant', 2),
  ('Remi', 'Oudin', '25', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_65.jpg/250px-Lens_-_Girondins_de_Bordeaux_%2819-09-2020%29_65.jpg', 1.85, 82, '28', 'attaquant', 2);

