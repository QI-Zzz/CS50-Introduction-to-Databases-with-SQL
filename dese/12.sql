
SELECT "districts"."name", "subquery"."exemplary", "subquery"."per_pupil_expenditure"
FROM "districts"
INNER JOIN (
    SELECT "staff_evaluations"."district_id", "staff_evaluations"."exemplary", "expenditures"."per_pupil_expenditure"
    FROM "staff_evaluations"
    INNER JOIN "expenditures"
    ON "staff_evaluations"."district_id" = "expenditures"."district_id"
    WHERE "staff_evaluations"."exemplary" >= (SELECT AVG("staff_evaluations"."exemplary") FROM "staff_evaluations")
    AND "expenditures"."per_pupil_expenditure" >= (SELECT AVG("expenditures"."per_pupil_expenditure") FROM "expenditures")
) AS "subquery" ON "districts"."id" = "subquery"."district_id"
WHERE "districts"."type" = "Public School District"
ORDER BY "subquery"."exemplary" DESC, "subquery"."per_pupil_expenditure" DESC;


