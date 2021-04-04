-- IF TABLE ZNODATA IS NOT EXIST IN DB TO AVOID ERRORS
CREATE TABLE IF NOT EXISTS ZNODATA(
    OUTID VARCHAR(36) PRIMARY KEY,
    Birth INTEGER,
    SEXTYPENAME VARCHAR(500), 

    REGNAME VARCHAR(500), 
    AREANAME VARCHAR(500), 
    TERNAME VARCHAR(500), REGTYPENAME VARCHAR(500), 

    TerTypeName VARCHAR(500),
    ClassProfileNAME VARCHAR(500),
    ClassLangName VARCHAR(500),
    
    EONAME VARCHAR(500), 
    EOTYPENAME VARCHAR(500),
    EORegName VARCHAR(500),
    EOAreaName VARCHAR(500),
    EOTerName VARCHAR(500),
    EOParent VARCHAR(500),
    
    UkrTest VARCHAR(500),
    UkrTestStatus VARCHAR(500),
    UkrBall100 REAL,
    UkrBall12 REAL,
    UkrBall REAL,
    UkrAdaptScale INTEGER,
    UkrPTName VARCHAR(500),
    UkrPTRegName VARCHAR(500),
    UkrPTAreaName VARCHAR(500),
    UkrPTTerName VARCHAR(500),
    
    histTest VARCHAR(500),
    HistLang VARCHAR(500),
    histTestStatus VARCHAR(500),
    histBall100 REAL,
    histBall12 REAL,
    histBall REAL,
    histPTName VARCHAR(500), 
    histPTRegName VARCHAR(500), 
    histPTAreaName VARCHAR(500), 
    histPTTerName VARCHAR(500),
    
    mathTest VARCHAR(500), 
    mathLang VARCHAR(500), 
    mathTestStatus VARCHAR(500), 
    mathBall100 REAL, 
    mathBall12 REAL, 
    mathBall REAL, 
    mathPTName VARCHAR(500), 
    mathPTRegName VARCHAR(500),
    mathPTAreaName VARCHAR(500), 
    mathPTTerName VARCHAR(500),
    
    physTest VARCHAR(500),
    physLang VARCHAR(500), 
    physTestStatus VARCHAR(500), 
    physBall100 REAL, 
    physBall12 REAL, 
    physBall REAL, 
    physPTName VARCHAR(500), 
    physPTRegName VARCHAR(500), 
    physPTAreaName VARCHAR(500), 
    physPTTerName VARCHAR(500),
    
    chemTest VARCHAR(500),
    chemLang VARCHAR(500), 
    chemTestStatus VARCHAR(500), 
    chemBall100 REAL, 
    chemBall12 REAL, 
    chemBall REAL, 
    chemPTName VARCHAR(500), 
    chemPTRegName VARCHAR(500), 
    chemPTAreaName VARCHAR(500), 
    chemPTTerName VARCHAR(500), 
    
    bioTest VARCHAR(500),
    bioLang VARCHAR(500), 
    bioTestStatus VARCHAR(500), 
    bioBall100 REAL, 
    bioBall12 REAL, 
    bioBall REAL, 
    bioPTName VARCHAR(500), 
    bioPTRegName VARCHAR(500), 
    bioPTAreaName VARCHAR(500), 
    bioPTTerName VARCHAR(500), 
    
    geoTest VARCHAR(500), 
    geoLang VARCHAR(500), 
    geoTestStatus VARCHAR(500), 
    geoBall100 REAL, 
    geoBall12 REAL, 
    geoBall REAL, 
    geoPTName VARCHAR(500), 
    geoPTRegName VARCHAR(500), 
    geoPTAreaName VARCHAR(500), 
    geoPTTerName VARCHAR(500),
    
    engTest VARCHAR(500), 
    engTestStatus VARCHAR(500),
    engBall100 REAL, 
    engBall12 REAL, 
    engDPALevel VARCHAR(500), 
    engBall REAL, 
    engPTName VARCHAR(500), 
    engPTRegName VARCHAR(500), 
    engPTAreaName VARCHAR(500), 
    engPTTerName VARCHAR(500),
    
    fraTest VARCHAR(500), 
    fraTestStatus VARCHAR(500), 
    fraBall100 REAL, 
    fraBall12 REAL, 
    fraDPALevel VARCHAR(500), 
    fraBall REAL, 
    fraPTName VARCHAR(500), 
    fraPTRegName VARCHAR(500), 
    fraPTAreaName VARCHAR(500), 
    fraPTTerName VARCHAR(500),
    
    deuTest VARCHAR(500), 
    deuTestStatus VARCHAR(500), 
    deuBall100 REAL, 
    deuBall12 REAL, 
    deuDPALevel VARCHAR(500), 
    deuBall REAL, 
    deuPTName VARCHAR(500), 
    deuPTRegName VARCHAR(500), 
    deuPTAreaName VARCHAR(500), 
    deuPTTerName VARCHAR(500),
    
    spaTest VARCHAR(500),
    spaTestStatus VARCHAR(500),
    spaBall100 REAL,
    spaBall12 REAL,
    spaDPALevel VARCHAR(500),
    spaBall REAL,
    spaPTName VARCHAR(500),
    spaPTRegName VARCHAR(500),
    spaPTAreaName VARCHAR(500),
    spaPTTerName VARCHAR(500),
    
    EXAMYEAR INTEGER
);



CREATE TABLE IF NOT EXISTS SUBJECT(
    subjName VARCHAR(255) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS EDUINSTITUTIONPARENT(
    EOParent VARCHAR(500) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS GEOLOCATION(
    terId SERIAL PRIMARY KEY,
    RegName VARCHAR(500),
    AreaName VARCHAR(500),
    TerName VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS EDUINSTITUTION(
    institutionId SERIAL PRIMARY KEY,
    terId INTEGER,
    EOParent VARCHAR(500),
    EOName VARCHAR(500),
    EOTypeName VARCHAR(500),
    FOREIGN KEY (terId) REFERENCES GEOLOCATION(terId),
    FOREIGN KEY (EOParent) REFERENCES EDUINSTITUTIONPARENT(EOParent)
);

CREATE TABLE IF NOT EXISTS STUDENT(
    outid VARCHAR(36) PRIMARY KEY,
    terId INTEGER,
    birth INTEGER,
    sex VARCHAR(100),
    FOREIGN KEY (terId) REFERENCES GEOLOCATION(terId)
);

CREATE TABLE IF NOT EXISTS ZNOINSTITUTION(
    PTName VARCHAR(500) PRIMARY KEY,
    terId INTEGER,
    FOREIGN KEY (terId) REFERENCES GEOLOCATION(terId)
);

CREATE TABLE IF NOT EXISTS EDUCATIONLEVEL(
    outid VARCHAR(36),
    institutionId INTEGER,
    CLASSPROFILENAME VARCHAR(500),
    CLASSLANGNAME VARCHAR(500),
    REGTYPENAME VARCHAR(500)
);

ALTER TABLE EDUCATIONLEVEL 
    ADD CONSTRAINT EDUCATIONLEVEL_PK PRIMARY KEY (outid, institutionId);

ALTER TABLE EDUCATIONLEVEL
    ADD CONSTRAINT EDUCATIONLEVEL_STUDENT_FK FOREIGN KEY (outid) 
        REFERENCES STUDENT(outid);

ALTER TABLE EDUCATIONLEVEL
    ADD CONSTRAINT EDUCATIONLEVEL_INSTITUTION_FK FOREIGN KEY (institutionId)
        REFERENCES EDUINSTITUTION (institutionId);


CREATE TABLE IF NOT EXISTS ZNOEXAM(
    outid VARCHAR(36),
    subjName VARCHAR(255),
    examYear INTEGER,
    PTName VARCHAR(500),
    TestStatus VARCHAR(500),
    Ball100 REAL,
    Ball12 REAL,
    Ball REAL,
    examLanguage VARCHAR(500),
    DPALevel VARCHAR(500),
    AdaptScale INTEGER
);

ALTER TABLE ZNOEXAM 
    ADD CONSTRAINT ZNOEXAM_PK PRIMARY KEY (outid, subjName, examYear);

ALTER TABLE ZNOEXAM
    ADD CONSTRAINT ZNOEXAM_STUDENT_FK FOREIGN KEY (outid)
        REFERENCES STUDENT(outid);

ALTER TABLE ZNOEXAM
    ADD CONSTRAINT ZNOEXAM_SUBJECT_FK FOREIGN KEY (subjName)
        REFERENCES SUBJECT(subjName);

ALTER TABLE ZNOEXAM
    ADD CONSTRAINT ZNOEXAM_ZNOINSTITUTION_FK FOREIGN KEY (PTName)
        REFERENCES ZNOINSTITUTION(PTName);
