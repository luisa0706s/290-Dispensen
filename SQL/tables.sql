-- Datenbank erstellen und verwenden
create database DispensenDB;
use DispensenDB;


-- BASIS Tabelle Schüler erstellen und Attribute definieren
CREATE TABLE Schueler (
                          SchuelerID INT PRIMARY KEY not null auto_increment,
                          anrede VARCHAR(10),
                          name VARCHAR(50),
                          vorname VARCHAR(50),
                          email VARCHAR(100),
                          telefonnummer VARCHAR(20),
                          klasse VARCHAR(10),
                          geburtstag DATE);

-- CRUD-BEFEHLE:

-- Daten einfügen in Tabelle Schüler (Crud)
INSERT INTO Schueler VALUES
                         (0, 'Herr', 'Mustermann', 'Max', 'max.mustermann@example.com', '123456789', 'ME21a', '2005-01-15'),
                         (0, 'Frau', 'Musterfrau', 'Anna', 'anna.musterfrau@example.com', '987654321', 'ME21b', '2004-08-22'),
                         (0, 'Herr', 'Schmidt', 'Tom', 'tom.schmidt@example.com', '555444333', 'AB21c', '2005-03-10'),
                         (0, 'Frau', 'Müller', 'Lisa', 'lisa.mueller@example.com', '111222333', 'AB22d', '2005-06-05'),
                         (0, 'Herr', 'Schulz', 'Markus', 'markus.schulz@example.com', '999888777', 'FBA22a', '2004-12-18'),
                         (0, 'Frau', 'Fischer', 'Julia', 'julia.fischer@example.com', '777666555', 'FB23b', '2005-02-28'),
                         (0, 'Herr', 'Wagner', 'Michael', 'michael.wagner@example.com', '333222111', 'IA22a', '2004-11-08'),
                         (0, 'Frau', 'Koch', 'Laura', 'laura.koch@example.com', '444555666', 'IM22b', '2005-09-14'),
                         (0, 'Herr', 'Becker', 'Stefan', 'stefan.becker@example.com', '666777888', 'KFA22a', '2005-07-20'),
                         (0, 'Frau', 'Schneider', 'Sophie', 'sophie.schneider@example.com', '222333444', 'KVA22b', '2004-10-03');

-- Tabelle ausgeben (cRud)
SELECT * from Schueler;

-- Tabelle filtern nach Geburtstag aufsteigend
SELECT * from Schueler
ORDER BY geburtstag;

-- Tabelle filtern nach Geburtstag absteigend
SELECT * from Schueler
ORDER BY geburtstag desc;

-- Tabelle aktualisieren (crUd)
UPDATE Schueler
set anrede = 'Mann'
    where name = 'Mustermann';

-- Tabelle löschen (cruD)
DROP table Schueler;
-- Bemerkung: Geht hier nicht, da Werte aus der Basistabelle 'Schueler' in der Relationstabelle 'Eintraege' verwendet werden.


-- BASIS Tabelle Lehrberuf erstellen
CREATE TABLE Lehrberufe (
                            LehrberufeID INT PRIMARY KEY not null auto_increment,
                            lehrberuf VARCHAR(50));

-- Daten einfügen in Tabelle Lehrberuf
INSERT INTO Lehrberufe VALUES
                           (0, 'KV'),
                           (0, 'Mediamatik'),
                           (0, 'Informatik'),
                           (0, 'Betreuung');


-- BASIS Tabelle Abteilung erstellen
CREATE TABLE Abteilung (
                           AbteilungID INT PRIMARY KEY not null auto_increment,
                           abteilung VARCHAR(50));

-- Daten einfügen in Tabelle Abteilung
INSERT INTO Abteilung VALUES
                          (0, 'Wirtschaft'),
                          (0, 'Betreuung');


-- BASIS Tabelle Gründe erstellen
CREATE TABLE Gruende (
                         GruendeID INT PRIMARY KEY not null auto_increment,
                         grund VARCHAR(100),
                         abkuerzung_grund VARCHAR(10));

-- Daten einfügen
INSERT INTO Gruende VALUES
                        (0, 'Krankheit', 'KR'),
                        (0, 'Familiäre Gründe', 'FG'),
                        (0, 'Notwendige Termine', 'NT'),
                        (0, 'Berufliche Verpflichtungen', 'BV'),
                        (0, 'Unfall', 'UF'),
                        (0, 'Persönliche Gründe', 'PG'),
                        (0, 'Unvorhergesehene Ereignisse', 'UE'),
                        (0, 'Sportliche Veranstaltungen', 'SpV'),
                        (0, 'Religiöse Feiertage', 'RF'),
                        (0, 'Sonstiges', 'SO');


-- BASIS Tabelle Betroffene Lehrer erstellen
CREATE TABLE BetroffeneLehrer (
                                  BetroffeneLehrerID INT PRIMARY KEY not null auto_increment,
                                  vorname_lehrer VARCHAR(50),
                                  nachname_lehrer VARCHAR(50),
                                  kuerzel_lehrer VARCHAR(10));

-- Daten einfügen in Tabelle Betroffene Lehrer
INSERT INTO BetroffeneLehrer VALUES
                                 (0, 'Max', 'Mustermann', 'MMu'),
                                 (0, 'Anna', 'Musterfrau', 'AMu'),
                                 (0, 'Tom', 'Schmidt', 'TSch'),
                                 (0, 'Lisa', 'Müller', 'LM'),
                                 (0, 'Markus', 'Schulz', 'MSch'),
                                 (0, 'Julia', 'Fischer', 'JF'),
                                 (0, 'Michael', 'Wagner', 'MWa'),
                                 (0, 'Laura', 'Koch', 'LK'),
                                 (0, 'Stefan', 'Becker', 'SBe'),
                                 (0, 'Sophie', 'Schneider', 'SSch');

-- BASIS Tabelle Bestaetigung erstellen
CREATE TABLE Bestaetigung (
                              BestaetigungID INT PRIMARY KEY not null auto_increment,
                              bestaetigung_lehrbetrieb VARCHAR(4),
                              bestaetigung_erziehungsberechtigte VARCHAR(4)
);

-- Daten einfügen in Tabelle Bestaetigung
INSERT INTO Bestaetigung VALUES
                             (0, 'Ja', 'Ja'),
                             (0, 'Nein', 'Nein'),
                             (0, 'Ja', 'Nein'),
                             (0, 'Nein', 'Ja');

-- RELATIONS Tabelle Eintraege erstellen
CREATE TABLE Eintraege (
                           EintraegeID INT PRIMARY KEY not null auto_increment,
                           abwesenheitsdatum DATE,
                           kommentar VARCHAR(255),
                           SchuelerID INT,
                           LehrberufID INT,
                           AbteilungID INT,
                           GruendeID INT,
                           BetroffeneLehrerID INT,
                           BestaetigungID INT,
                           FOREIGN KEY (SchuelerID) REFERENCES Schueler (SchuelerID),
                           FOREIGN KEY (LehrberufID) REFERENCES Lehrberufe (LehrberufeID),
                           FOREIGN KEY (AbteilungID) REFERENCES Abteilung (AbteilungID),
                           FOREIGN KEY (GruendeID) REFERENCES Gruende (GruendeID),
                           FOREIGN KEY (BetroffeneLehrerID) REFERENCES BetroffeneLehrer (BetroffeneLehrerID),
                           FOREIGN KEY (BestaetigungID) REFERENCES Bestaetigung (BestaetigungID));

-- Daten einfügen in Tabelle Eintraege
INSERT INTO Eintraege (abwesenheitsdatum, kommentar, SchuelerID, LehrberufID, AbteilungID, GruendeID, BetroffeneLehrerID, BestaetigungID)
VALUES
    ('2023-01-10', 'Arzttermin', 1, 3, 1, 3, 2, 1),
    ('2023-02-05', 'Familiäre Angelegenheit', 4, 2, 2, 6, 5, 2),
    ('2023-03-20', 'Teilnahme an Wettbewerb', 7, 1, 1, 5, 8, 1),
    ('2023-04-15', 'Sportveranstaltung', 2, 4, 2, 8, 1, 1),
    ('2023-05-12', 'Schulausflug', 5, 3, 1, 2, 4, 2),
    ('2023-06-25', 'Ferien', 10, 1, 2, 10, 9, 1),
    ('2023-07-08', 'Krankheit', 3, 2, 1, 1, 7, 2),
    ('2023-08-19', 'Familienfeier', 6, 4, 2, 4, 2, 1),
    ('2023-09-03', 'Teilnahme an Seminar', 9, 3, 1, 9, 10, 2),
    ('2023-10-17', 'Arzttermin', 8, 1, 2, 7, 3, 1);


-- Tabelle Eintraege mit JOIN-Anweisungen ausgeben
SELECT
    E.abwesenheitsdatum,
    E.kommentar,
    S.anrede,
    S.name,
    S.vorname,
    L.lehrberuf,
    A.abteilung,
    G.grund,
    BL.vorname_lehrer AS betroffener_lehrer_vorname,
    BL.nachname_lehrer AS betroffener_lehrer_nachname,
    BE.bestaetigung_lehrbetrieb,
    BE.bestaetigung_erziehungsberechtigte
FROM Eintraege E
         INNER JOIN Schueler S ON E.SchuelerID = S.SchuelerID
         INNER JOIN Lehrberufe L ON E.LehrberufID = L.LehrberufeID
         INNER JOIN Abteilung A ON E.AbteilungID = A.AbteilungID
         INNER JOIN Gruende G ON E.GruendeID = G.GruendeID
         INNER JOIN BetroffeneLehrer BL ON E.BetroffeneLehrerID = BL.BetroffeneLehrerID
         INNER JOIN Bestaetigung BE ON E.BestaetigungID = BE.BestaetigungID;



-- Neuen User für den Zugriff der App auf die DB anlegen und mit Berechtigungen versehenAnlegen der Datenbank

-- Aus Sicherheitsgründen können wir den root-user (Zugriffsprofile) für den Zugriff auf die DB nicht gebrauchen.
-- Wir müssen einen neuen User anlegen, allerdings mit beschränkten Zugriffsrechten auf die DB
-- Damit wir den neuen User nicht doppelt anlegen, lassen wir uns alle DB-User anzeigen.

SELECT user FROM mysql.user;

-- Gegebenenfalls müssen wir DB-User löschen

DROP USER 'appAdmin'@'localhost';



-- Aus Sicherheitsgründen können wir den root-user für unseren Zugriff auf die DB nicht gebrauchen.
-- Daher legen wir einen neuen User an mit eingeschränkten Berechtigungen.

CREATE USER  'appAdmin'@'localhost' IDENTIFIED BY'appAdminPW';
ALTER USER 'appAdmin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'appAdminPW';
--    host: 'localhost',
--    user: 'appAdmin',
--    password: 'appAdminPW',
--    database: 'appDB',


-- Privilegien/Berechtigungen setzten für die neuen User auf der neuen DB

GRANT all privileges ON dispensendb.* TO 'appAdmin'@'localhost';



-- Berechtigungen müssen jetzt noch aktiviert werden

FLUSH PRIVILEGES;

-- 3.6 Berechtigungen anzeigen lassen

SELECT user,host FROM mysql.user;
SHOW GRANTS FOR appAdmin@localhost;

