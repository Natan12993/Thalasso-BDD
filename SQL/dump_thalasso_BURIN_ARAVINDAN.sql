--
-- Drop tables
--

DROP TABLE IF EXISTS saison CASCADE;
DROP TABLE IF EXISTS periode CASCADE;
DROP TABLE IF EXISTS hebergement CASCADE;
DROP TABLE IF EXISTS heberge CASCADE;
DROP TABLE IF EXISTS prestation CASCADE;
DROP TABLE IF EXISTS tarif CASCADE;
DROP TABLE IF EXISTS cure CASCADE;
DROP TABLE IF EXISTS weekend CASCADE;
DROP TABLE IF EXISTS objectifs CASCADE;
DROP TABLE IF EXISTS criteres CASCADE;
DROP TABLE IF EXISTS possede CASCADE;
DROP TABLE IF EXISTS soin CASCADE;
DROP TABLE IF EXISTS contient CASCADE;
DROP TABLE IF EXISTS etape CASCADE;
DROP TABLE IF EXISTS propose CASCADE;



--
-- Create table saison
--

CREATE TABLE saison (
	 idsaison serial PRIMARY KEY,
	 annee varchar(4),
	 libelle varchar(50)
);

--
-- Create table periode
--

CREATE TABLE periode (
     idperiode serial PRIMARY KEY,
	 datedebut date,
	 datefin date,
	 idsaison serial,
	 foreign key(idsaison) references saison(idsaison) 
	 ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Create table hebergement
--

CREATE TABLE hebergement (
	 idhebergement serial PRIMARY KEY,
	 typedechambre text,
     vue varchar(50)
);

--
-- Create table heberge
--

CREATE TABLE heberge (
	 idhebergement serial,
     idsaison serial,
     tarifhebergement int,
     PRIMARY KEY(idhebergement,idsaison),
     foreign key(idhebergement) references hebergement(idhebergement) 
     ON DELETE CASCADE ON UPDATE CASCADE,
     foreign key(idsaison) references saison(idsaison) 
     ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Create table prestation
--

CREATE TABLE prestation (
    codeprestation varchar(4) PRIMARY KEY,
    nom varchar(50)
);

--
-- Create table tarif
--

CREATE TABLE tarif (
    idsaison int,
    codeprestation varchar(4),
    tarif_saison int,
    PRIMARY KEY(idsaison,codeprestation),
    foreign key(idsaison) references saison(idsaison) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(codeprestation) references prestation(codeprestation) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Create table cure
--

CREATE TABLE cure (
    nomcure varchar(50) PRIMARY KEY,
    description varchar(100),
    codeprestation varchar(4)
);

--
-- Create table weekend
--

CREATE TABLE weekend (
	idweekend serial PRIMARY KEY,
    nbjour int DEFAULT 2,
    codeprestation varchar(4)
);

--
-- Create table objectifs
--

CREATE TABLE objectifs (
    codeobjectifs varchar(5) PRIMARY KEY,
    libelle_objectifs varchar(50)
);

--
-- Create table criteres
--

CREATE TABLE criteres (
    codecriteres varchar(5) PRIMARY KEY,
    libellecritère varchar(50),
    nomcure varchar(50),
    foreign key(nomcure) references cure(nomcure) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Create table possede
--

CREATE TABLE possede (
    nomcure varchar(50),
    codeobjectifs varchar(5),
    PRIMARY KEY(nomcure,codeobjectifs),
    foreign key(nomcure) references cure(nomcure) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(codeobjectifs) references objectifs(codeobjectifs) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Create table soin
--

CREATE TABLE soin (
    codesoin varchar(5) PRIMARY KEY,
    libelle_soin varchar(50),
    durree_estimee int,
    effectifmax int
);

--
-- Create table contient
--

CREATE TABLE contient (
    codeprestation varchar(4),
    codesoin varchar(5),
    nb_soin int,
    PRIMARY KEY(codeprestation,codesoin),
    foreign key(codeprestation) references prestation(codeprestation) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(codesoin) references soin(codesoin) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Create table etape
--

CREATE TABLE etape (
    numetape serial PRIMARY KEY,
    descriptionetape varchar(50),
    H int
);

--
-- Create table propose
--

CREATE TABLE propose (
    codesoin varchar(5),
    numetape serial,
    PRIMARY KEY(codesoin,numetape),
    foreign key(codesoin) references soin(codesoin) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(numetape) references etape(numetape) 
    ON DELETE CASCADE ON UPDATE CASCADE
);


--
-- Data for Name: saison
--

INSERT INTO saison (annee,libelle) VALUES (2008, 'saison hivernale');
INSERT INTO saison (annee,libelle) VALUES (2008, 'basse saison');
INSERT INTO saison (annee,libelle) VALUES (2008, 'moyenne saison');
INSERT INTO saison (annee,libelle) VALUES (2008, 'haute saison');

INSERT INTO saison (annee,libelle) VALUES (2009, 'saison hivernale');
INSERT INTO saison (annee,libelle) VALUES (2009, 'basse saison');
INSERT INTO saison (annee,libelle) VALUES (2009, 'moyenne saison');
INSERT INTO saison (annee,libelle) VALUES (2009, 'haute saison');

INSERT INTO saison (annee,libelle) VALUES (2010, 'saison hivernale');
INSERT INTO saison (annee,libelle) VALUES (2010, 'basse saison');
INSERT INTO saison (annee,libelle) VALUES (2010, 'moyenne saison');
INSERT INTO saison (annee,libelle) VALUES (2010, 'haute saison');

--
-- Data for Name: periode
--

INSERT INTO periode (datedebut,datefin) VALUES ('2008-01-15','2008-02-04');
INSERT INTO periode (datedebut,datefin) VALUES ('2008-02-19','2008-03-25');
INSERT INTO periode (datedebut,datefin) VALUES ('2008-10-08','2008-12-02');
INSERT INTO periode (datedebut,datefin) VALUES ('2008-02-05','2008-07-08');

INSERT INTO periode (datedebut,datefin) VALUES ('2009-01-18','2009-02-04');
INSERT INTO periode (datedebut,datefin) VALUES ('2009-02-08','2009-03-22');
INSERT INTO periode (datedebut,datefin) VALUES ('2009-10-08','2009-12-09');
INSERT INTO periode (datedebut,datefin) VALUES ('2009-01-15','2009-02-04');

INSERT INTO periode (datedebut,datefin) VALUES ('2010-01-01','2010-02-04');
INSERT INTO periode (datedebut,datefin) VALUES ('2010-02-19','2010-03-21');
INSERT INTO periode (datedebut,datefin) VALUES ('2010-10-08','2010-12-04');
INSERT INTO periode (datedebut,datefin) VALUES ('2010-02-03','2010-07-11');

--
-- Data for Name: hebergement
--

INSERT INTO hebergement (typedechambre,vue) VALUES ('standard simple','mer');
INSERT INTO hebergement (typedechambre,vue) VALUES ('standard simple','jardin');
INSERT INTO hebergement (typedechambre,vue) VALUES ('standard simple','rue');

INSERT INTO hebergement (typedechambre,vue) VALUES ('standard double','mer');
INSERT INTO hebergement (typedechambre,vue) VALUES ('standard double','jardin');
INSERT INTO hebergement (typedechambre,vue) VALUES ('standard double','rue');

INSERT INTO hebergement (typedechambre,vue) VALUES ('confort simple','mer');
INSERT INTO hebergement (typedechambre,vue) VALUES ('confort simple','jardin');
INSERT INTO hebergement (typedechambre,vue) VALUES ('confort simple','rue');

INSERT INTO hebergement (typedechambre,vue) VALUES ('confort double','mer');
INSERT INTO hebergement (typedechambre,vue) VALUES ('confort double','jardin');
INSERT INTO hebergement (typedechambre,vue) VALUES ('confort double','rue');

--
-- Data for Name: heberge
--

INSERT INTO heberge (tarifhebergement) VALUES (200);
INSERT INTO heberge (tarifhebergement) VALUES (190);
INSERT INTO heberge (tarifhebergement) VALUES (200);

INSERT INTO heberge (tarifhebergement) VALUES (150);
INSERT INTO heberge (tarifhebergement) VALUES (140);
INSERT INTO heberge (tarifhebergement) VALUES (125);

INSERT INTO heberge (tarifhebergement) VALUES (230);
INSERT INTO heberge (tarifhebergement) VALUES (220);
INSERT INTO heberge (tarifhebergement) VALUES (200);

INSERT INTO heberge (tarifhebergement) VALUES (175);
INSERT INTO heberge (tarifhebergement) VALUES (165);
INSERT INTO heberge (tarifhebergement) VALUES (150);

--
-- Data for Name: prestation
--

INSERT INTO prestation (codeprestation,nom) VALUES ('AM01','Cure bien-être');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM02','Cure remise en forme');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM03','Cure santé');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM04','Cure amincissent');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM05','Cure postnatale');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM06','Cure anti-âge');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM07','Cure santé du dos');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM08','Cure santé des jambes');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM09','Week-end détente');
INSERT INTO prestation (codeprestation,nom) VALUES ('AM10','Week-end beauté fraicheur');
                        
--
-- Data for Name: tarif
--

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (1,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (2,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (3,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (4,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (5,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (6,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (7,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (8,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (9,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (10,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (11,'AM10',597);

INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM01',456);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM02',419);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM03',452);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM04',622);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM05',123);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM06',789);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM07',546);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM08',465);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM09',865);
INSERT INTO tarif (idsaison,codeprestation,tarif_saison) VALUES (12,'AM10',597);
                        
--
-- Data for Name: cure
--

INSERT INTO cure (nomcure,description,codeprestation) VALUES ('bien-être','massage doux','AM01');
INSERT INTO cure (nomcure,description,codeprestation) VALUES ('remise en forme','massage tonique','AM02');
INSERT INTO cure (nomcure,description,codeprestation) VALUES ('santé','preparation physique aquatique','AM03');
INSERT INTO cure (nomcure,description,codeprestation) VALUES ('amincissement','bain chaleur','AM04');
INSERT INTO cure (nomcure,description,codeprestation) VALUES ('postnatale','massage doux dans un bain','AM05');
INSERT INTO cure (nomcure,description,codeprestation) VALUES ('anti-âge','soin et massage de peau','AM06');
INSERT INTO cure (nomcure,description,codeprestation) VALUES ('santé du dos','massage puissant au dos','AM07');
INSERT INTO cure (nomcure,description,codeprestation) VALUES ('santé des jambes','massage aux jambes et remise en forme','AM08');

--
-- Data for Name: weekend
--

INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM01');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM01');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM01');
INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM02');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM02');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM02');
INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM03');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM03');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM03');
INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM04');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM04');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM04');
INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM05');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM05');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM05');
INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM06');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM06');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM06');
INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM07');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM07');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM07');
INSERT INTO weekend (nbjour,codeprestation) VALUES (2,'AM08');
INSERT INTO weekend (nbjour,codeprestation) VALUES (4,'AM08');
INSERT INTO weekend (nbjour,codeprestation) VALUES (6,'AM08');
                     
--
-- Data for Name: objectifs
--

INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ01','détente chez la personne');
INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ02','remise en forme de la personne');
INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ03','controle général du corps');
INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ04','perte de poid et brule graisse');
INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ05','détente chez la femme enceinte');
INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ06','détente et amélioration de la peau');
INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ07','remise en place du dos et arret de douleur');
INSERT INTO objectifs (codeobjectifs,libelle_objectifs) VALUES ('OBJ08','remise en forme de la partie inférieur du corps');

--
-- Data for Name: criteres
--

INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM041','tour de taille','bien-être');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM042','tour de hanche','remise en forme');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM043','tour de cuisse','santé');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM051','tour de taille','amincissement');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM052','tour de ventre','postnatale');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM071','taille du dos','anti-âge');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM072','largeur des épaules','santé du dos');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM081','tour de cuisse','santé des jambes');
INSERT INTO criteres (codecriteres,libellecritère,nomcure) VALUES ('AM082','tour de mollet','santé des jambes');

--
-- Data for Name: possede
--

INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('bien-être','OBJ01');
INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('remise en forme','OBJ02');
INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('santé','OBJ03');
INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('amincissement','OBJ04');
INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('postnatale','OBJ05');
INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('anti-âge','OBJ06');
INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('santé du dos','OBJ07');
INSERT INTO  possede (nomcure,codeobjectifs) VALUES ('santé des jambes','OBJ08');

--
-- Data for Name: soin
--

INSERT INTO soin (codesoin,libelle_soin,durree_estimee,effectifmax) VALUES ('SAM01','massage tonique',90,2);
INSERT INTO soin (codesoin,libelle_soin,durree_estimee,effectifmax) VALUES ('SAM02','massage anti-stress',70,2);
INSERT INTO soin (codesoin,libelle_soin,durree_estimee,effectifmax) VALUES ('SAM03','drainage lymphatique corps',140,5);
INSERT INTO soin (codesoin,libelle_soin,durree_estimee,effectifmax) VALUES ('SAM04','drainage lymphatique visage',100,4);
INSERT INTO soin (codesoin,libelle_soin,durree_estimee,effectifmax) VALUES ('SAM05','bain hydromassant',40,10);
INSERT INTO soin (codesoin,libelle_soin,durree_estimee,effectifmax) VALUES ('SAM06','douche abdominal',20,8);
INSERT INTO soin (codesoin,libelle_soin,durree_estimee,effectifmax) VALUES ('SAM07','enveloppement de boue d algues marines',140,5);

--
-- Data for Name: contient
--

INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM01','SAM01','1');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM01','SAM06','2');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM01','SAM02','1');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM02','SAM02','4');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM03','SAM04','1');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM04','SAM03','2');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM04','SAM05','2');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM05','SAM05','3');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM06','SAM04','3');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM06','SAM07','1');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM06','SAM02','1');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM07','SAM07','2');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM08','SAM06','4');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM09','SAM01','1');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM10','SAM05','1');
INSERT INTO contient (codeprestation,codesoin,nb_soin) VALUES ('AM10','SAM02','3');

--
-- Data for Name: etape
--

INSERT INTO etape (descriptionetape,H) VALUES ('massage dur/puissant',15);
INSERT INTO etape (descriptionetape,H) VALUES ('massage doux/calme',10);
INSERT INTO etape (descriptionetape,H) VALUES ('stimule la circulationde la lymph dans le corps',20);
INSERT INTO etape (descriptionetape,H) VALUES ('stimule la circulationde la lymph dans le visage',30);
INSERT INTO etape (descriptionetape,H) VALUES ('bain avec jet d eau massant',15);
INSERT INTO etape (descriptionetape,H) VALUES ('douche froide à haut pression',40);
INSERT INTO etape (descriptionetape,H) VALUES ('pose d algue et de boue sur le corps',60);

--
-- Data for Name: propose
--

INSERT INTO propose (codesoin) VALUES ('SAM01');
INSERT INTO propose (codesoin) VALUES ('SAM02');
INSERT INTO propose (codesoin) VALUES ('SAM03');
INSERT INTO propose (codesoin) VALUES ('SAM04');
INSERT INTO propose (codesoin) VALUES ('SAM05');
INSERT INTO propose (codesoin) VALUES ('SAM06');
INSERT INTO propose (codesoin) VALUES ('SAM07');