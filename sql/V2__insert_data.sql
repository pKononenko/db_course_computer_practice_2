-- INSERT INTO SUBJECTS
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


-- INSERT INTO EDUINSTITUTIONPARENT 
INSERT INTO EDUINSTITUTIONPARENT(EOParent)
SELECT DISTINCT EOParent
FROM ZNODATA
WHERE EOParent IS NOT NULL;


-- INSERT INTO GEOLOCATION
INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT REGNAME, AREANAME, TERNAME
FROM ZNODATA;
-- INSERT INTO GEOLOCATIONS ZNOINSTITUTION AREA
INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT ukrptregname, ukrptareaname, ukrpttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = ukrptregname
        AND areaname = ukrptareaname
        AND tername = ukrpttername
)
AND
ukrptregname IS NOT NULL
AND ukrptareaname IS NOT NULL
AND ukrpttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT histptregname, histptareaname, histpttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = histptregname
        AND areaname = histptareaname
        AND tername = histpttername
)
AND
histptregname IS NOT NULL
AND histptareaname IS NOT NULL
AND histpttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT mathptregname, mathptareaname, mathpttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = mathptregname
        AND areaname = mathptareaname
        AND tername = mathpttername
)
AND
mathptregname IS NOT NULL
AND mathptareaname IS NOT NULL
AND mathpttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT physptregname, physptareaname, physpttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = physptregname
        AND areaname = physptareaname
        AND tername = physpttername
)
AND
physptregname IS NOT NULL
AND physptareaname IS NOT NULL
AND physpttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT chemptregname, chemptareaname, chempttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = chemptregname
        AND areaname = chemptareaname
        AND tername = chempttername
)
AND
chemptregname IS NOT NULL
AND chemptareaname IS NOT NULL
AND chempttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT bioptregname, bioptareaname, biopttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = bioptregname
        AND areaname = bioptareaname
        AND tername = biopttername
)
AND
bioptregname IS NOT NULL
AND bioptareaname IS NOT NULL
AND biopttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT geoptregname, geoptareaname, geopttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = geoptregname
        AND areaname = geoptareaname
        AND tername = geopttername
)
AND
geoptregname IS NOT NULL
AND geoptareaname IS NOT NULL
AND geopttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT engptregname, engptareaname, engpttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = engptregname
        AND areaname = engptareaname
        AND tername = engpttername
)
AND
engptregname IS NOT NULL
AND engptareaname IS NOT NULL
AND engpttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT fraptregname, fraptareaname, frapttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = fraptregname
        AND areaname = fraptareaname
        AND tername = frapttername
)
AND
fraptregname IS NOT NULL
AND fraptareaname IS NOT NULL
AND frapttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT deuptregname, deuptareaname, deupttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = deuptregname
        AND areaname = deuptareaname
        AND tername = deupttername
)
AND
deuptregname IS NOT NULL
AND deuptareaname IS NOT NULL
AND deupttername IS NOT NULL;


INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
SELECT DISTINCT spaptregname, spaptareaname, spapttername
FROM ZNODATA
WHERE NOT EXISTS
(
    SELECT 1 FROM GEOLOCATION
    WHERE
        regname = spaptregname
        AND areaname = spaptareaname
        AND tername = spapttername
)
AND
spaptregname IS NOT NULL
AND spaptareaname IS NOT NULL
AND spapttername IS NOT NULL;


-- INSERT INTO STUDENT
INSERT INTO STUDENT(outid, terId, birth, sex)
SELECT zd.outid, gl.terId, zd.birth, zd.sextypename
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.areaname = gl.areaname AND zd.regname = gl.regname AND zd.tername = gl.tername;


-- INSERT INTO EDUINSTITUTION
INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, zd.EOParent, zd.EONAME, zd.EOTYPENAME
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.EORegName = gl.regname AND zd.EOTerName = gl.tername AND zd.EOAreaName = gl.areaname
WHERE zd.EONAME IS NOT NULL;
-- INSERT ZNOPUCTS
INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, NULL, zd.ukrptname, NULL
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.ukrptregname = gl.regname AND zd.ukrpttername = gl.tername AND zd.ukrptareaname = gl.areaname
WHERE
    zd.ukrptname IS NOT NULL
AND 
    gl.terId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EDUINSTITUTION ei
    WHERE ei.terId = gl.terid
    AND ei.eoname = zd.ukrptname);


INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, NULL, zd.histptname, NULL
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.histptregname = gl.regname AND zd.histpttername = gl.tername AND zd.histptareaname = gl.areaname
WHERE
    zd.histptname IS NOT NULL
AND 
    gl.terId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EDUINSTITUTION ei
    WHERE ei.terId = gl.terid
    AND ei.eoname = zd.histptname);


INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, NULL, zd.mathptname, NULL
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.mathptregname = gl.regname AND zd.mathpttername = gl.tername AND zd.mathptareaname = gl.areaname
WHERE
    zd.mathptname IS NOT NULL
AND 
    gl.terId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EDUINSTITUTION ei
    WHERE ei.terId = gl.terid
    AND ei.eoname = zd.mathptname);


INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, NULL, zd.physptname, NULL
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.physptregname = gl.regname AND zd.physpttername = gl.tername AND zd.physptareaname = gl.areaname
WHERE
    zd.physptname IS NOT NULL
AND 
    gl.terId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EDUINSTITUTION ei
    WHERE ei.terId = gl.terid
    AND ei.eoname = zd.physptname);


INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, NULL, zd.chemptname, NULL
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.chemptregname = gl.regname AND zd.chempttername = gl.tername AND zd.chemptareaname = gl.areaname
WHERE
    zd.chemptname IS NOT NULL
AND 
    gl.terId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EDUINSTITUTION ei
    WHERE ei.terId = gl.terid
    AND ei.eoname = zd.chemptname);


INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.terId, NULL, zd.engptname, NULL
FROM ZNODATA zd
LEFT JOIN GEOLOCATION gl
ON zd.engptregname = gl.regname AND zd.engpttername = gl.tername AND zd.engptareaname = gl.areaname
WHERE
    zd.engptname IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EDUINSTITUTION ei
    WHERE ei.terId = gl.terid
    AND ei.eoname = zd.engptname);


-- INSERT INTO EDUCATIONLEVEL
INSERT INTO EDUCATIONLEVEL(outid, institutionId, ClassProfileNAME, ClassLangName, REGTYPENAME)
SELECT zd.outid, eui.institutionId, zd.ClassProfileNAME, zd.ClassLangName, zd.REGTYPENAME
FROM ZNODATA zd
LEFT JOIN EDUINSTITUTION eui
ON zd.EOParent = eui.EOParent AND zd.EONAME = eui.EONAME
WHERE eui.institutionId IS NOT NULL;


-- INSERT ZNOEXAM
INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.ukrtest, zd.examYear, jd.institutionId, zd.ukrTestStatus,
        zd.ukrBall100, zd.ukrBall12, zd.ukrBall, NULL, NULL,
        zd.ukradaptscale
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.ukrptregname = jd.regname
        AND zd.ukrptareaname = jd.areaname
        AND zd.ukrpttername = jd.tername
    WHERE
        ukrtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.histtest, zd.examYear, jd.institutionId, zd.histTestStatus,
        zd.histBall100, zd.histBall12, zd.histBall, zd.histlang, NULL,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.histptregname = jd.regname
        AND zd.histptareaname = jd.areaname
        AND zd.histpttername = jd.tername
    WHERE
        histtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.mathtest, zd.examYear, jd.institutionId, zd.mathTestStatus,
        zd.mathBall100, zd.mathBall12, zd.mathBall, zd.mathlang, NULL,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.mathptregname = jd.regname
        AND zd.mathptareaname = jd.areaname
        AND zd.mathpttername = jd.tername
    WHERE
        mathtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.phystest, zd.examYear, jd.institutionId, zd.physTestStatus,
        zd.physBall100, zd.physBall12, zd.physBall, zd.physlang, NULL,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.physptregname = jd.regname
        AND zd.physptareaname = jd.areaname
        AND zd.physpttername = jd.tername
    WHERE
        phystest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.chemtest, zd.examYear, jd.institutionId, zd.chemTestStatus,
        zd.chemBall100, zd.chemBall12, zd.chemBall, zd.chemlang, NULL,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.chemptregname = jd.regname
        AND zd.chemptareaname = jd.areaname
        AND zd.chempttername = jd.tername
    WHERE
        chemtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.biotest, zd.examYear, jd.institutionId, zd.bioTestStatus,
        zd.bioBall100, zd.bioBall12, zd.bioBall, zd.biolang, NULL,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.bioptregname = jd.regname
        AND zd.bioptareaname = jd.areaname
        AND zd.biopttername = jd.tername
    WHERE
        biotest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.geotest, zd.examYear, jd.institutionId, zd.geoTestStatus,
        zd.geoBall100, zd.geoBall12, zd.geoBall, zd.geolang, NULL,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.geoptregname = jd.regname
        AND zd.geoptareaname = jd.areaname
        AND zd.geopttername = jd.tername
    WHERE
        geotest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.engtest, zd.examYear, jd.institutionId, zd.engTestStatus,
        zd.engBall100, zd.engBall12, zd.engBall, NULL, zd.engdpalevel,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.engptregname = jd.regname
        AND zd.engptareaname = jd.areaname
        AND zd.engpttername = jd.tername
    WHERE
        engtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.fratest, zd.examYear, jd.institutionId, zd.fraTestStatus,
        zd.fraBall100, zd.fraBall12, zd.fraBall, NULL, zd.fradpalevel,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.fraptregname = jd.regname
        AND zd.fraptareaname = jd.areaname
        AND zd.frapttername = jd.tername
    WHERE
        fratest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.deutest, zd.examYear, jd.institutionId, zd.deuTestStatus,
        zd.deuBall100, zd.deuBall12, zd.deuBall, NULL, zd.deudpalevel,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.deuptregname = jd.regname
        AND zd.deuptareaname = jd.areaname
        AND zd.deupttername = jd.tername
    WHERE
        deutest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus,
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.spatest, zd.examYear, jd.institutionId, zd.spaTestStatus,
        zd.spaBall100, zd.spaBall12, zd.spaBall, NULL, zd.spadpalevel,
        NULL
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.spaptregname = jd.regname
        AND zd.spaptareaname = jd.areaname
        AND zd.spapttername = jd.tername
    WHERE
        spatest IS NOT NULL;
