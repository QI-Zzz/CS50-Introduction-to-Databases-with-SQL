CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(18) NOT NULL,
    `last_name` VARCHAR(18) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(18) NOT NULL,
    `type` VARCHAR(18) NOT NULL,
    `location` VARCHAR(18) NOT NULL,
    `year` YEAR NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(18) NOT NULL,
    `industry` VARCHAR(18) NOT NULL,
    `location` VARCHAR(18) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `userschoolconnections` (
    `user_id` INT,
    `school_id` INT,
    `school_name` VARCHAR(18),
    `start_date` DATETIME,
    `end_date` DATETIME,
    `degree` VARCHAR(18),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
    PRIMARY KEY (`user_id`, `school_name`)
);

CREATE TABLE `usercompanyconnections` (
    `user_id` INT,
    `company_id` INT,
    `company_name` VARCHAR(18),
    `start_date` DATETIME,
    `end_date` DATETIME,
    `title` VARCHAR(32),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
    PRIMARY KEY ("user_id", "company_id")
);

CREATE TABLE   `userconnections` (
    `user_id_1` INT,
    `user_id_2` INT,
    FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
    FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`),
    PRIMARY KEY (`user_id_1`, `user_id_2`)
);

