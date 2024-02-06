-- write a SQL query to find the 5 lowest paying teams (by average salary) in 2001.

-- Round the average salary column to two decimal places and call it “average salary”.
-- Sort the teams by average salary, least to greatest.
-- Your query should return a table with two columns, one for the teams’ names and one for their average salary.

-- SELECT "team_id", ROUND(AVG("salary"),2) AS "average salary"
-- FROM "salaries"
-- WHERE "year" = "2001"
-- GROUP BY "team_id"
-- ORDER BY "average salary" ASC
-- LIMIT 5

SELECT "teams"."name", "subquery"."average salary"
FROM "teams"
INNER JOIN (
    SELECT "team_id", ROUND(AVG("salary"),2) AS "average salary"
    FROM "salaries"
    WHERE "year" = "2001"
    GROUP BY "team_id"
    ORDER BY "average salary" ASC
    LIMIT 5
) AS "subquery"
ON "teams"."id" = "subquery"."team_id";

