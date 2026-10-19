-- Projet 3 — Base de données d'assurance habitation (SQLite)
-- Schéma relationnel : une table Contrat rattachée à une table Region par le code commune INSEE.

CREATE TABLE Region (
    Code_dep_code_commune VARCHAR NOT NULL,
    reg_code              INTEGER NOT NULL,
    reg_nom               VARCHAR NOT NULL,
    aca_nom               VARCHAR NOT NULL,
    dep_nom               VARCHAR NOT NULL,
    com_nom_maj_court     VARCHAR NOT NULL,
    dep_code              INTEGER NOT NULL,
    dep_nom_num           VARCHAR NOT NULL,
    CONSTRAINT Region_pk PRIMARY KEY (Code_dep_code_commune)
);

CREATE TABLE Contrat (
    Contrat_ID              INTEGER NOT NULL,
    No_voie                 INTEGER NOT NULL,
    B_T_Q                   VARCHAR(1) NOT NULL,
    Type_de_voie            VARCHAR NOT NULL,
    Voie                    VARCHAR NOT NULL,
    Code_dep_code_commune   VARCHAR NOT NULL,
    Code_postal             VARCHAR(5) NOT NULL,
    Commune                 VARCHAR NOT NULL,
    Surface                 INTEGER NOT NULL,
    Type_local              VARCHAR NOT NULL,
    Occupation              VARCHAR NOT NULL,
    Type_contrat            VARCHAR NOT NULL,
    Formule                 VARCHAR NOT NULL,
    Valeur_declaree_biens   VARCHAR NOT NULL,
    Prix_cotisation_mensuel INTEGER NOT NULL,
    CONSTRAINT Contrat_pk PRIMARY KEY (Contrat_ID),
    CONSTRAINT Region_Contrat_fk FOREIGN KEY (Code_dep_code_commune)
        REFERENCES Region (Code_dep_code_commune)
);
