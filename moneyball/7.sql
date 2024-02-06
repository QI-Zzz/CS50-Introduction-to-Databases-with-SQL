-- In 7.sql, write a SQL query to find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.
-- Your query should return a table with two columns, one for the player’s first name and one for their last name.


SELECT "p"."first_name", "p"."last_name"
FROM "players" AS "p"
INNER JOIN (
    SELECT "player_id", MAX("salary") AS "total_salary"
    FROM "salaries"
    GROUP BY "player_id"
    ORDER BY "total_salary" DESC
    LIMIT 1
) AS "subquery"
ON "subquery"."player_id" = "p"."id";
