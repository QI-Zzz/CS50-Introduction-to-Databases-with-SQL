-- in 5.sql, write a SQL query to find all teams that Satchel Paige played for.
SELECT "name"
FROM "teams"
WHERE "id" IN (
    SELECT "team_id"
    FROM "performances"
    WHERE "player_id" = (
        SELECT "id"
        FROM "players"
        WHERE "first_name" = "Satchel" AND "last_name" = "Paige"
    )
);
