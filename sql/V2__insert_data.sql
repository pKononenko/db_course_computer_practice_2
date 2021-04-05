INSERT INTO SUBJECT(subjName)
SELECT DISTINCT ukrtest
FROM ZNODATA
WHERE ukrtest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT histtest
FROM ZNODATA
WHERE histtest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT mathtest
FROM ZNODATA
WHERE mathtest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT phystest
FROM ZNODATA
WHERE phystest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT chemtest
FROM ZNODATA
WHERE chemtest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT biotest
FROM ZNODATA
WHERE biotest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT geotest
FROM ZNODATA
WHERE geotest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT engtest
FROM ZNODATA
WHERE engtest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT fratest
FROM ZNODATA
WHERE fratest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT deutest
FROM ZNODATA
WHERE deutest IS NOT NULL;

INSERT INTO SUBJECT(subjName)
SELECT DISTINCT spatest
FROM ZNODATA
WHERE spatest IS NOT NULL;


INSERT INTO EDUINSTITUTIONPARENT(EOParent)
SELECT DISTINCT EOParent
FROM ZNODATA
WHERE EOParent IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT REGNAME, AREANAME, TERNAME
FROM ZNODATA;


INSERT INTO STUDENT(outid, terId, birth, sex)
SELECT zd.outid, gl.terId, zd.birth, zd.sextypename
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.areaname = gl.areaname AND zd.regname = gl.regname AND zd.tername = gl.tername;


INSERT INTO ZNOINSTITUTION(PTName, terId)
SELECT DISTINCT zd.EONAME, gl.terId
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.EORegName = gl.regname AND zd.EOTerName = gl.regname AND zd.EOAreaName = gl.areaname
WHERE zd.EONAME IS NOT NULL;


INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, zd.EOParent, zd.EONAME, zd.EOTYPENAME
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.EORegName = gl.regname AND zd.EOTerName = gl.tername AND zd.EOAreaName = gl.areaname
WHERE zd.EONAME IS NOT NULL;


INSERT INTO EDUCATIONLEVEL(outid, institutionId, ClassProfileNAME, ClassLangName, REGTYPENAME)
SELECT zd.outid, eui.institutionId, zd.ClassProfileNAME, zd.ClassLangName, zd.REGTYPENAME
FROM ZNODATA zd
LEFT JOIN EDUINSTITUTION eui
ON zd.EOParent = eui.EOParent AND zd.EONAME = eui.EONAME
WHERE eui.institutionId IS NOT NULL;


INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, ukrtest, examYear, EOName, ukrTestStatus,
        ukrBall100, ukrBall12, ukrBall, NULL, NULL,
        ukradaptscale
    FROM ZNODATA
    WHERE ukrtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, histtest, examYear, EOName, histTestStatus,
        histBall100, histBall12, histBall, histlang, NULL,
        NULL
    FROM ZNODATA
    WHERE histtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, mathtest, examYear, EOName, mathTestStatus,
        mathBall100, mathBall12, mathBall, mathlang, NULL,
        NULL
    FROM ZNODATA
    WHERE mathtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, phystest, examYear, EOName, physTestStatus,
        physBall100, physBall12, physBall, physlang, NULL,
        NULL
    FROM ZNODATA
    WHERE phystest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, chemtest, examYear, EOName, chemTestStatus,
        chemBall100, chemBall12, chemBall, chemlang, NULL,
        NULL
    FROM ZNODATA
    WHERE chemtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, biotest, examYear, EOName, bioTestStatus,
        bioBall100, bioBall12, bioBall, biolang, NULL,
        NULL
    FROM ZNODATA
    WHERE biotest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, geotest, examYear, EOName, geoTestStatus,
        geoBall100, geoBall12, geoBall, geolang, NULL,
        NULL
    FROM ZNODATA
    WHERE geotest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, engtest, examYear, EOName, engTestStatus,
        engBall100, engBall12, engBall, NULL, engdpalevel,
        NULL
    FROM ZNODATA
    WHERE engtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, fratest, examYear, EOName, fraTestStatus,
        fraBall100, fraBall12, fraBall, NULL, fradpalevel,
        NULL
    FROM ZNODATA
    WHERE fratest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, deutest, examYear, EOName, deuTestStatus,
        deuBall100, deuBall12, deuBall, NULL, deudpalevel,
        NULL
    FROM ZNODATA
    WHERE deutest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, spatest, examYear, EOName, spaTestStatus,
        spaBall100, spaBall12, spaBall, NULL, spadpalevel,
        NULL
    FROM ZNODATA
    WHERE spatest IS NOT NULL;