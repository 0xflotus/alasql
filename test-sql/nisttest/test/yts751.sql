-- MODULE  YTS751  

-- SQL Test Suite, V6.0, Interactive SQL, yts751.sql
-- 59-byte ID
-- TEd Version #

-- AUTHORIZATION CTS1              

   SELECT USER FROM HU.ECCO;
-- RERUN if USER value does not match preceding AUTHORIZATION comment
   ROLLBACK WORK;

-- date_time print

-- TEST:7501 CREATE DOMAIN as SQL proc statement with default!

   CREATE DOMAIN chardomain
          AS CHAR(10) DEFAULT 'MANCHESTER';
-- PASS:7501 If domain created successfully?

   COMMIT WORK;

   SELECT COUNT(*) 
      FROM INFORMATION_SCHEMA.DOMAINS
      WHERE DOMAIN_NAME = 'CHARDOMAIN'
      AND DOMAIN_SCHEMA = 'CTS1';
-- PASS:7501 If COUNT = 1?

   SELECT DOMAIN_CATALOG,
         DATA_TYPE, CHARACTER_MAXIMUM_LENGTH,
         CHARACTER_OCTET_LENGTH, COLLATION_CATALOG,
         COLLATION_SCHEMA, COLLATION_NAME,
         CHARACTER_SET_CATALOG, CHARACTER_SET_SCHEMA,
         CHARACTER_SET_NAME, NUMERIC_PRECISION,
         NUMERIC_PRECISION_RADIX, NUMERIC_SCALE,
         DATETIME_PRECISION, DOMAIN_DEFAULT
         FROM INFORMATION_SCHEMA.DOMAINS
         WHERE DOMAIN_NAME = 'CHARDOMAIN'
         AND DOMAIN_SCHEMA = 'CTS1';
-- PASS:7501 If DOMAIN_CATALOG = not NULL?
-- PASS:7501 If DATA_TYPE = CHARACTER?
-- PASS:7501 If CHARACTER_MAXIMUM_LENGTH = 10?
-- PASS:7501 If CHARACTER_OCTET_LENGTH = not NULL?
-- PASS:7501 If COLLATION_CATALOG = not NULL?
-- PASS:7501 If COLLATION_SCHEMA = not NULL?
-- PASS:7501 If COLLATION_NAME = not NULL?
-- PASS:7501 If CHARACTER_SET_CATALOG = not NULL?
-- PASS:7501 If CHARACTER_SET_SCHEMA = not NULL?
-- PASS:7501 If CHARACTER_SET_NAME = not NULL?
-- PASS:7501 If NUMERIC_PRECISION = NULL?
-- PASS:7501 If NUMERIC_PRECISION_RADIX = NULL?
-- PASS:7501 If NUMERIC_SCALE = NULL?
-- PASS:7501 If DATETIME_PRECISION = NULL?
-- PASS:7501 If DOMAIN_DEFAULT = MANCHESTER?

   ROLLBACK WORK;

   DROP DOMAIN chardomain CASCADE;
-- PASS:7501 If domain dropped successfully?

   COMMIT WORK;

-- END TEST >>> 7501 <<< END TEST
-- *********************************************
-- *************************************************////END-OF-MODULE