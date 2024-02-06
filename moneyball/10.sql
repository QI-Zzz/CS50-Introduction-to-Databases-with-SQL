

SELECT "players"."first_name", "players"."last_name","salaries"."salary","performances"."HR","performances"."year"
FROM "players"
JOIN "performances" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" WHERE "salaries"."year" = "performances"."year"
ORDER BY "players"."id" ASC, "performances"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC



