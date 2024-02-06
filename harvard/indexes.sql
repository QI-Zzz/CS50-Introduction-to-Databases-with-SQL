CREATE INDEX "student_id" ON "enrollments" ("student_id");

CREATE INDEX "course_id" ON "enrollments" ("course_id");

CREATE INDEX "courses_department" ON "courses" ("department");

CREATE INDEX "courses_semester" ON "courses" ("semester");

CREATE INDEX "requirement_id" ON "requirements" ("id");

CREATE INDEX "course_enrollment" ON "enrollments" ("course_id", "student_id");

CREATE INDEX "student_id_name" ON "students" ("id");

CREATE INDEX "courses_desc" ON "courses" ("department", "number", "title");

CREATE INDEX "requirement_for_satisfie" ON "satisfies" ("requirement_id", "course_id");

CREATE INDEX "requirement_for_course" ON "satisfies" ("course_id");
