-- write a SQL query to find the 50 players paid the least in 2001.

SELECT "p"."first_name", "p"."last_name", "s"."salary"
FROM "players" AS "p"
JOIN "salaries" AS "s"
ON "p"."id" = "s"."player_id"
WHERE "s"."year" = 2001
ORDER BY "s"."salary" ASC, "p"."first_name" ASC, "p"."last_name" ASC, "p"."id" DESC
LIMIT 50;

