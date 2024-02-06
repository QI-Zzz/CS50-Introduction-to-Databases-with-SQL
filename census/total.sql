CREATE VIEW "total" AS
SELECT "district", SUM("families") AS "families", SUM("households") AS "households", SUM("population") AS "population", SUM("male") AS "male", SUM("female") AS "female"
FROM "census";
