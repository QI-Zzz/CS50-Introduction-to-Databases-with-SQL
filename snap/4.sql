-- CREATE INDEX "search_messages_by_to_user_id" ON "messages"("to_user_id");


SELECT "username"
FROM "users"
WHERE "id" IN (
    SELECT "to_user_id" FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY COUNT("to_user_id") DESC, "to_user_id" ASC
    LIMIT 1
);

