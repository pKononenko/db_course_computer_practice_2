# Простий скрипт для невеличкої автоматизації створення запиту

test_list = ['ukr', 'hist', 'math', 'phys', 'chem', 'bio', 'geo', 'eng', 'fra', 'deu', 'spa']

print("SUBJECT TABLE QUERY:\n")
for t in test_list:
    str_pattern = """INSERT INTO SUBJECT(subjName)
    SELECT DISTINCT {}test
    FROM ZNODATA
    WHERE {t}test IS NOT NULL;"""

    print(str_pattern.format(t, t), end = "\n\n")

print("ZNOEXAM TABLE QUERY:\n")
for t in test_list:
    str_pattern = """INSERT INTO ZNOEXAM(outid, subjName, examYear, PTName, TestStatus, 
        Ball100, Ball12, Ball, examLanguage, DPALevel, AdaptScale)
    SELECT
        outid, {}test, examYear, EOName, {}TestStatus, 
        {}Ball100, {}Ball12, {}Ball, {}, {}, 
        {}
    FROM ZNODATA
    WHERE {}test IS NOT NULL;"""

    dpalevel = f"{t}dpalevel" if t in test_list[7:] else "NULL"
    lang = f"{t}lang" if t in test_list[1:7] else "NULL"
    adaptscale = "ukradaptscale" if t == "ukr" else "NULL"

    print(str_pattern.format(t, t, t, t, t, lang, dpalevel, adaptscale, t), end = "\n\n")
