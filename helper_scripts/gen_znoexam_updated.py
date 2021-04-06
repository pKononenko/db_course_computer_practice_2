# Простий скрипт для невеличкої автоматизації створення запиту

test_list = ['ukr', 'hist', 'math', 'phys', 'chem', 'bio', 'geo', 'eng', 'fra', 'deu', 'spa']

print("SUBJECT TABLE QUERY:\n")
for t in test_list:
    str_pattern = """INSERT INTO SUBJECT(subjName)
    SELECT DISTINCT {}test
    FROM ZNODATA
    WHERE {}test IS NOT NULL;"""

    print(str_pattern.format(t, t), end = "\n\n\n")

print("PART OF GEOLOCATION TABLE QUERY:\n")
for t in test_list:
    str_pattern = """INSERT INTO GEOLOCATION(RegName, AreaName, TerName)
        SELECT DISTINCT {}ptregname, {}ptareaname, {}pttername
        FROM ZNODATA
        WHERE NOT EXISTS
        (
            SELECT 1 FROM GEOLOCATION
            WHERE
                regname = {}ptregname
                AND areaname = {}ptareaname
                AND tername = {}pttername
        )
        AND {}ptregname IS NOT NULL
        AND {}ptareaname IS NOT NULL
        AND {}pttername IS NOT NULL;"""

    print(str_pattern.format(t, t, t, t, t, t, t, t, t), end = "\n\n\n")

print("PART OF EDUINSTITUTION TABLE QUERY:\n")
for t in test_list:
    str_pattern = """INSERT INTO EDUINSTITUTION(terId, EOParent, EOName, EOTypeName)
        SELECT DISTINCT gl.terId, NULL, zd.{}ptname, NULL
        FROM ZNODATA zd
        LEFT JOIN GEOLOCATION gl
        ON zd.{}ptregname = gl.regname AND zd.{}pttername = gl.tername AND zd.{}ptareaname = gl.areaname
        WHERE 
            zd.{}ptname IS NOT NULL
        AND 
            gl.terId IS NOT NULL
        AND
        NOT EXISTS(
            SELECT 1
            FROM EDUINSTITUTION ei
            WHERE ei.terId = gl.terid
            AND ei.eoname = zd.{}ptname)"""

    print(str_pattern.format(t, t, t, t, t, t), end = "\n\n\n")

print("ZNOEXAM TABLE QUERY:\n")
for t in test_list:
    str_pattern = """INSERT INTO ZNOEXAM(outid, subjName, examYear, institutionId, TestStatus, 
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        zd.outid, zd.{}test, zd.examYear, jd.institutionId, zd.{}TestStatus, 
        zd.{}Ball100, zd.{}Ball12, zd.{}Ball, {}, {}, 
        {}
    FROM ZNODATA zd
    LEFT JOIN
        (SELECT DISTINCT ei.institutionId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EDUINSTITUTION ei
        LEFT JOIN GEOLOCATION gl
        ON ei.terId = gl.terId) jd
        ON zd.{}ptregname = jd.regname
        AND zd.{}ptareaname = jd.areaname
        AND zd.{}pttername = jd.tername
    WHERE 
        {}test IS NOT NULL;"""

    dpalevel = f"zd.{t}dpalevel" if t in test_list[7:] else "NULL"
    lang = f"zd.{t}lang" if t in test_list[1:7] else "NULL"
    adaptscale = "zd.ukradaptscale" if t == "ukr" else "NULL"

    print(str_pattern.format(t, t, t, t, t, lang, dpalevel, adaptscale, t, t, t, t, t), end = "\n\n")
