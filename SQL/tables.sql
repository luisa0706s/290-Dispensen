create database DispensenDB;


use DispensenDB;


-- BASIS Tabelle Schüler erstellen
CREATE TABLE Schueler (
                         SchuelerID INT PRIMARY KEY,
                         anrede VARCHAR(10),
                         name VARCHAR(50),
                         vorname VARCHAR(50),
                         email VARCHAR(100),
                         telefonnummer VARCHAR(20),
                         klasse VARCHAR(10),
                         geburtstag DATE);

-- Daten einfügen in Tabelle Schüler
INSERT INTO Schueler VALUES
                        (1, 'Herr', 'Mustermann', 'Max', 'max.mustermann@example.com', '123456789', '10A', '2005-01-15'),
                        (2, 'Frau', 'Musterfrau', 'Anna', 'anna.musterfrau@example.com', '987654321', '10B', '2004-08-22'),
                        (3, 'Herr', 'Schmidt', 'Tom', 'tom.schmidt@example.com', '555444333', '10A', '2005-03-10'),
                        (4, 'Frau', 'Müller', 'Lisa', 'lisa.mueller@example.com', '111222333', '10C', '2005-06-05'),
                        (5, 'Herr', 'Schulz', 'Markus', 'markus.schulz@example.com', '999888777', '10B', '2004-12-18'),
                        (6, 'Frau', 'Fischer', 'Julia', 'julia.fischer@example.com', '777666555', '10A', '2005-02-28'),
                        (7, 'Herr', 'Wagner', 'Michael', 'michael.wagner@example.com', '333222111', '10C', '2004-11-08'),
                        (8, 'Frau', 'Koch', 'Laura', 'laura.koch@example.com', '444555666', '10B', '2005-09-14'),
                        (9, 'Herr', 'Becker', 'Stefan', 'stefan.becker@example.com', '666777888', '10A', '2005-07-20'),
                        (10, 'Frau', 'Schneider', 'Sophie', 'sophie.schneider@example.com', '222333444', '10C', '2004-10-03');


-- BASIS Tabelle Lehrberuf erstellen
CREATE TABLE Lehrberufe (
                           LehrberufeID INT PRIMARY KEY,
                           lehrberuf VARCHAR(50));

-- Daten einfügen in Tabelle Lehrberuf
INSERT INTO Lehrberufe VALUES
                          (1, 'KV'),
                          (2, 'Mediamatik'),
                          (3, 'Informatik'),
                          (4, 'Betreuung');


-- BASIS Tabelle Abteilung erstellen
CREATE TABLE Abteilung (
                           AbteilungID INT PRIMARY KEY,
                           abteilung VARCHAR(50));

-- Daten einfügen in Tabelle Abteilung
INSERT INTO Abteilung VALUES
                          (1, 'Wirtschaft'),
                          (2, 'Betreuung');


-- BASIS Tabelle Gründe erstellen
CREATE TABLE Gruende (
                                GruendeID INT PRIMARY KEY,
                                grund VARCHAR(100),
                                abkuerzung_grund VARCHAR(10));

-- Daten einfügen
INSERT INTO Gruende VALUES
                               (1, 'Krankheit', 'KR'),
                               (2, 'Familiäre Gründe', 'FG'),
                               (3, 'Notwendige Termine', 'NT'),
                               (4, 'Berufliche Verpflichtungen', 'BV'),
                               (5, 'Unfall', 'UF'),
                               (6, 'Persönliche Gründe', 'PG'),
                               (7, 'Unvorhergesehene Ereignisse', 'UE'),
                               (8, 'Sportliche Veranstaltungen', 'SpV'),
                               (9, 'Religiöse Feiertage', 'RF'),
                               (10, 'Sonstiges', 'SO');


-- BASIS Tabelle Betroffene Lehrer erstellen
CREATE TABLE BetroffeneLehrer (
                                  BetroffeneLehrerID INT PRIMARY KEY,
                                  vorname_lehrer VARCHAR(50),
                                  nachname_lehrer VARCHAR(50),
                                  kuerzel_lehrer VARCHAR(10));

-- Daten einfügen in Tabelle Betroffene Lehrer
INSERT INTO BetroffeneLehrer VALUES
                                 (1, 'Max', 'Mustermann', 'MMu'),
                                 (2, 'Anna', 'Musterfrau', 'AMu'),
                                 (3, 'Tom', 'Schmidt', 'TSch'),
                                 (4, 'Lisa', 'Müller', 'LM'),
                                 (5, 'Markus', 'Schulz', 'MSch'),
                                 (6, 'Julia', 'Fischer', 'JF'),
                                 (7, 'Michael', 'Wagner', 'MWa'),
                                 (8, 'Laura', 'Koch', 'LK'),
                                 (9, 'Stefan', 'Becker', 'SBe'),
                                 (10, 'Sophie', 'Schneider', 'SSch');

-- BASIS Tabelle Bestaetigung erstellen
CREATE TABLE Bestaetigung (
                             BestaetigungID INT PRIMARY KEY,
                             bestaetigung_lehrbetrieb VARCHAR(4),
                             bestaetigung_erziehungsberechtigte VARCHAR(4)
);

-- Daten einfügen in Tabelle Bestaetigung
INSERT INTO Bestaetigung VALUES
                            (1, 'Ja', 'Ja'),
                            (2, 'Nein', 'Nein'),
                            (3, 'Ja', 'Nein'),
                            (4, 'Nein', 'Ja');





