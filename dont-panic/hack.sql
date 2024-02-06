-- In hack.sql, write a sequence of SQL statements to achieve the following:

-- Alter the password of the website’s administrative account, admin, to instead be “oops!”.
-- Erase any logs of the above password change recorded by the database.
-- Add false data to throw others off your trail. In particular, to frame emily33, make it only
-- appear—in the user_logs table—as if the admin account has had its password changed to emily33’s password.

UPDATE "users"
SET "password" = "982c0381c279d139fd221fce974916e7"
WHERE "username" = "admin";

-- DELETE FROM "user_logs"
-- WHERE "id" = (
--     SELECT "id"
--     FROM "user_logs"
--     WHERE "old_password" != "new_password"
-- );

DELETE FROM "user_logs"
WHERE "new_username" = 'admin' AND "new_password" = '982c0381c279d139fd221fce974916e7';

INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES ('update', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '44bf025d27eea66336e5c1133c3827f7');
