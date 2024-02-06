-- write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.

-- Your query should return a table with two columns, one for the players’ first names and one of their last names.
-- You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
-- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
-- Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
-- Keep in mind the lessons you’ve learned in 10.sql and 11.sql!

-- SELECT p.first_name, p.last_name, s.salary/perf.RBI
-- FROM players p
-- JOIN performances perf ON perf.player_id = p.id
-- JOIN salaries s ON s.player_id = p.id AND perf.year = s.year
-- WHERE perf.year = 2001 AND perf.RBI > 0
-- ORDER BY s.salary/perf.RBI DESC
-- LIMIT 10


-- SELECT p.first_name, p.last_name, s.salary/perf.H
-- FROM players p
-- JOIN performances perf ON perf.player_id = p.id
-- JOIN salaries s ON s.player_id = p.id
-- WHERE perf.year = s.year = 2001 AND perf.H > 0
-- ORDER BY s.salary/perf.H DESC
-- LIMIT 10

-- ORDER BY p.id ASC, p.last_name ASC;

SELECT subquery1.first_name, subquery1.last_name
FROM (
    SELECT p.first_name, p.last_name, s.salary/perf.RBI, p.id
    FROM players p
    JOIN performances perf ON perf.player_id = p.id
    JOIN salaries s ON s.player_id = perf.player_id AND perf.year = s.year
    WHERE perf.year = 2001 AND perf.RBI > 0
    ORDER BY s.salary/perf.RBI ASC
    LIMIT 10
) AS subquery1
JOIN (
    SELECT p.first_name, p.last_name, s.salary/perf.H, p.id
    FROM players p
    JOIN performances perf ON perf.player_id = p.id
    JOIN salaries s ON s.player_id = perf.player_id AND perf.year = s.year
    WHERE perf.year = 2001 AND perf.H > 0
    ORDER BY s.salary/perf.H ASC
    LIMIT 10
) AS subquery2
ON subquery1.id = subquery2.id
ORDER BY subquery1.id ASC, subquery1.last_name ASC;
