-- write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate.
-- Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.
-- SELECT "schools"."name", "graduation_rates"."graduated", "schools"."district_id"
-- FROM "schools"
-- INNER JOIN "graduation_rates"
-- ON "graduation_rates"."school_id" = "schools"."id"

SELECT "expenditures"."per_pupil_expenditure", "subquery"."name", "subquery"."graduated"
FROM "expenditures"
INNER join (
    SELECT "schools"."name", "graduation_rates"."graduated", "schools"."district_id"
    FROM "schools"
    INNER JOIN "graduation_rates"
    ON "graduation_rates"."school_id" = "schools"."id"
) AS "subquery"
ON "expenditures"."district_id" = "subquery"."district_id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "subquery"."name" ASC;
