CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "password" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE schools (
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY ("name")
);

CREATE TABLE companies (
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY ("name")
);

CREATE TABLE userschoolconnections (
    "user_id" INTEGER,
    "school_name" TEXT,
    "start_date" DATE,
    "end_date" DATE,
    "degree" TEXT,
    FOREIGN KEY ("user_id") REFERENCES users ("id"),
    FOREIGN KEY ("school_name") REFERENCES schools ("name"),
    PRIMARY KEY ("user_id", "school_name")
);

CREATE TABLE usercompanyconnections (
    "user_id" INTEGER,
    "company_name" TEXT,
    "start_date" DATE,
    "end_date" DATE,
    "title" TEXT,
    FOREIGN KEY ("user_id") REFERENCES users ("id"),
    FOREIGN KEY ("company_name") REFERENCES companies ("name"),
    PRIMARY KEY ("user_id", "company_name")
);

CREATE TABLE userconnections (
    "user_id_1" INTEGER,
    "user_id_2" INTEGER,
    FOREIGN KEY ("user_id_1") REFERENCES users ("id"),
    FOREIGN KEY ("user_id_2") REFERENCES users ("id"),
    PRIMARY KEY ("user_id_1", "user_id_2")
);

