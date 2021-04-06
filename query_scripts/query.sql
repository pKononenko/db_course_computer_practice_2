SELECT 
    gl.regname,
    MIN(ze.BALL100),
    ze.examYear
FROM ZNOEXAM ze
LEFT JOIN EDUINSTITUTION ei
    ON ze.institutionId = ei.institutionId
LEFT JOIN GEOLOCATION gl
    ON ei.terId = gl.terId
WHERE 
    ze.TestStatus = 'Зараховано'
GROUP BY
    gl.regname, ze.EXAMYEAR;