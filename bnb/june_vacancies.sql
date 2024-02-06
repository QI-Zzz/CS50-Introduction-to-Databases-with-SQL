CREATE VIEW "june_vacancies" AS
SELECT "l"."id", "l"."property_type", "l"."host_name", COUNT("l"."id") AS "days_vacant"
FROM "listings" AS "l"
JOIN "availabilities" AS "a"
ON "a"."listing_id" = "l"."id"
WHERE "a"."available" = 'TRUE' AND "a"."date">="2023-06-01" AND "a"."date" < "2023-07-01"
GROUP BY "l"."id";
