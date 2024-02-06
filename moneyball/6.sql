-- write a SQL query to return the top 5 teams, sorted by the total number of hits by players in 2001.
-- Call the column representing total hits by players in 2001 “total hits”.
-- Sort by total hits, highest to lowest.
-- Your query should return two columns, one for the teams’ names and one for their total hits in 2001.

SELECT "t"."name", "subquery"."total hits"
FROM "teams" AS "t"
INNER JOIN (
    SELECT "team_id", SUM("H") AS "total hits"
    FROM "performances"
    WHERE "year" = "2001"
    GROUP BY "team_id"
    ORDER BY SUM("H") DESC
    LIMIT 5
) AS "subquery"
ON "subquery"."team_id" = "t"."id";


