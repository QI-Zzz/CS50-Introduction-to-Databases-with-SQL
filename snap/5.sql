-- CREATE INDEX "sqlite_autoindex_friends_1" ON "friends" ("user_id")


SELECT f1."friend_id"
FROM "friends" f1
INNER JOIN "friends" f2 ON f1."friend_id" = f2."friend_id"
WHERE f1."user_id" = (SELECT "id" FROM "users" WHERE "username" = 'lovelytrust487')
AND f2."user_id" = (SELECT "id" FROM "users" WHERE "username" = 'exceptionalinspiration482');
