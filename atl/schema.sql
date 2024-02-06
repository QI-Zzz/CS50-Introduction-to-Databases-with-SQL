CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY ("id")
);

CREATE TABLE check_ins (
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "checkin_time" TIMESTAMP,
    "flight" TEXT,
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE airlines (
    "id" INTEGER,
    "name" TEXT,
    "flight_id" INTEGER,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ("A", "B", "C", "D", "E", "F", "T")),
    PRIMARY KEY ("id")
);

CREATE TABLE flights(
    "id" INTEGER,
    "number" INTEGER,
    "airline_id" INTEGER,
    "airline" TEXT,
    "airport_de" TEXT NOT NULL CHECK ("airport_de" IN ("ATL", "BOS")),
    "airport_to" TEXT,
    "depart_time" TIMESTAMP,
    "arrive_time" TIMESTAMP,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
