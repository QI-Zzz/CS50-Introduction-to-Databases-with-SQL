CREATE VIEW "frequently_reviewed" AS
SELECT "l"."id", "l"."property_type", "l"."host_name", COUNT("r"."reviewer_name") AS "reviews"
FROM "listings" AS "l"
JOIN "reviews" AS "r"
ON "r"."listing_id" = "l"."id"
GROUP BY "l"."id"
ORDER BY "reviews" DESC, "l"."property_type" ASC, "l"."host_name" ASC
LIMIT 100;

