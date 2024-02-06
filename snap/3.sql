-- CREATE INDEX "search_messages_by_from_user_id"
-- ON "messages"("from_user_id");


SELECT "to_user_id" FROM "messages"
WHERE "from_user_id" = (SELECT "id" FROM "users" WHERE "username" = 'creativewisdom377')
GROUP BY "to_user_id"
ORDER BY COUNT("to_user_id") DESC
LIMIT 3;
