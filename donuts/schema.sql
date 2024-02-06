CREATE TABLE Ingredients(
    "id" INTEGER,
    "name" TEXT,
    "price" FLOAT,
    PRIMARY KEY ("id")
);


CREATE TABLE Donuts(
    "id" INTEGER,
    "name" TEXT,
    "gluten_free" BINARY,
    "price" FLOAT,
    PRIMARY KEY ("id")
);

CREATE TABLE Orders(
    "order_number" NUMERIC,
    "donut_id" INTEGER,
    "donut_name" TEXT,
    "quality" INTEGER,
    "customer" TEXT,
    PRIMARY KEY ("order_number"),
    FOREIGN KEY("donut_id" ) REFERENCES "Donuts"("id")
);

CREATE TABLE Customers(
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "order_number" NUMERIC,
    FOREIGN KEY("order_number") REFERENCES "Orders"("order_number")
);

CREATE TABLE IngredientsforDonuts(
    "donut_id" INTEGER,
    "donut_name" TEXT,
    "ingre_id" INTEGER,
    "ingre_name" TEXT,
    FOREIGN KEY("donut_id" ) REFERENCES "Donuts"("id"),
    FOREIGN KEY("ingre_id" ) REFERENCES "Ingredients"("id")
);
