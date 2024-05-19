DROP TABLE IF EXISTS "accounts" CASCADE;
CREATE TABLE "accounts" (
  "account" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "admin" integer,
  "uuid" integer NOT NULL AUTO_INCREMENT,
  "username" varchar(255) NOT NULL,
  PRIMARY KEY ("uuid"),
  UNIQUE ("account" ASC)
);

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS "rooms" CASCADE;
CREATE TABLE "rooms" (
  "rid" integer NOT NULL AUTO_INCREMENT,
  "rtime" integer NOT NULL,
  "rname" varchar(255) NOT NULL,
  "rbuilding" varchar(255) NOT NULL,
  PRIMARY KEY ("rid")
);

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS "departments" CASCADE;
CREATE TABLE "departments" (
  "did" integer NOT NULL AUTO_INCREMENT,
  "dname" varchar(255) NOT NULL,
  "dmajor" varchar(255) NOT NULL,
  PRIMARY KEY ("did")
);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS "students" CASCADE;
CREATE TABLE "students" (
  "suid" integer NOT NULL AUTO_INCREMENT,
  "sgrade" integer NOT NULL,
  "sdid_id" integer NOT NULL,
  "suuid_id" integer NOT NULL,
  PRIMARY KEY ("suid"),
  FOREIGN KEY ("sdid_id") REFERENCES "departments" ("did") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("suuid_id") REFERENCES "accounts" ("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);


-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS "teachers" CASCADE;
CREATE TABLE "teachers" (
  "tuid" integer NOT NULL AUTO_INCREMENT,
  "tdid_id" integer NOT NULL,
  "tuuid_id" integer NOT NULL,
  PRIMARY KEY ("tuid"),
  FOREIGN KEY ("tdid_id") REFERENCES "departments" ("did") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("tuuid_id") REFERENCES "accounts" ("uuid") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);
-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS "courses" CASCADE;
CREATE TABLE "courses" (
  "cid" integer NOT NULL AUTO_INCREMENT,
  "cname" varchar(255) NOT NULL,
  "crid_id" integer NOT NULL,
  "ctuid_id" integer NOT NULL,
  PRIMARY KEY ("cid"),
  FOREIGN KEY ("crid_id") REFERENCES "rooms" ("rid") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("ctuid_id") REFERENCES "teachers" ("tuid") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS "plan" CASCADE;
CREATE TABLE "plan" (
  "pid" integer NOT NULL AUTO_INCREMENT,
  "pcid_id" integer NOT NULL,
  "pdid_id" integer NOT NULL,
  "psgrade" integer,
  PRIMARY KEY ("pid"),
  FOREIGN KEY ("pcid_id") REFERENCES "courses" ("cid") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("pdid_id") REFERENCES "departments" ("did") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);
-- ----------------------------
-- Table structure for scores
-- ----------------------------
DROP TABLE IF EXISTS "scores" CASCADE;
CREATE TABLE "scores" (
  "sid" integer NOT NULL AUTO_INCREMENT,
  "scid_id" integer NOT NULL,
  "suid_id" integer NOT NULL,
  "score" real,
  PRIMARY KEY ("sid"),
  FOREIGN KEY ("scid_id") REFERENCES "courses" ("cid") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  FOREIGN KEY ("suid_id") REFERENCES "students" ("suid") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED
);



-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO "accounts" VALUES (1, 1, 1, 1, '小1');
INSERT INTO "accounts" VALUES (5, 5, 0, 2, '小5');
INSERT INTO "accounts" VALUES (4, 4, 0, 3, '小4');
INSERT INTO "accounts" VALUES (2, 2, 0, 4, '小2');
INSERT INTO "accounts" VALUES (3, 3, 0, 5, '小3');
INSERT INTO "accounts" VALUES (1213, 1, NULL, 6, 1);
INSERT INTO "accounts" VALUES (12, 12, NULL, 7, 12);
-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO "departments" VALUES (1, '电气学院', '电子信息');
INSERT INTO "departments" VALUES (2, '航天学院', '飞行器设计');
INSERT INTO "departments" VALUES (3, '计算学部', '计算机科学与技术');
INSERT INTO "departments" VALUES (4, '计算学部', '人工智能');
INSERT INTO "departments" VALUES (5, '航天学院', '自动化');
INSERT INTO "departments" VALUES (6, '计算学部', '信息安全');
INSERT INTO "departments" VALUES (7, '电气学院', '通信工程');
-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO "rooms" VALUES (1, 1, 101, '格物');
INSERT INTO "rooms" VALUES (2, 1, 102, '格物');
INSERT INTO "rooms" VALUES (3, 2, 101, '正心');
INSERT INTO "rooms" VALUES (4, 2, 102, '正心');
INSERT INTO "rooms" VALUES (5, 2, 101, '格物');
INSERT INTO "rooms" VALUES (6, 2, 102, '格物');
INSERT INTO "rooms" VALUES (7, 3, 101, '正心');
INSERT INTO "rooms" VALUES (8, 3, 102, '正心');
INSERT INTO "rooms" VALUES (9, 3, 101, '格物');
INSERT INTO "rooms" VALUES (10, 3, 102, '格物');
INSERT INTO "rooms" VALUES (11, 4, 102, '正心');
INSERT INTO "rooms" VALUES (12, 4, 101, '格物');
INSERT INTO "rooms" VALUES (13, 1, 102, '正心');
INSERT INTO "rooms" VALUES (14, 4, 102, '格物');
INSERT INTO "rooms" VALUES (15, 4, 101, '正心');
INSERT INTO "rooms" VALUES (16, 1, 101, '正心');
INSERT INTO "rooms" VALUES (17, 1, 103, '诚意');
INSERT INTO "rooms" VALUES (18, 2, 104, '诚意');
-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO "students" VALUES (1, 2023, 2, 3);
INSERT INTO "students" VALUES (2, 2022, 1, 2);
INSERT INTO "students" VALUES (3, 2022, 1, 1);
-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO "teachers" VALUES (1, 1, 4);
INSERT INTO "teachers" VALUES (2, 2, 5);
INSERT INTO "teachers" VALUES (3, 1, 1);
-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO "courses" VALUES (1, '大学计算机基础', 2, 2);
INSERT INTO "courses" VALUES (2, '高级程序设计', 3, 1);
INSERT INTO "courses" VALUES (3, '数据结构与算法', 4, 2);
INSERT INTO "courses" VALUES (4, '微积分', 1, 1);
INSERT INTO "courses" VALUES (5, '物理学', 5, 1);
INSERT INTO "courses" VALUES (6, '心理学', 6, 1);
INSERT INTO "courses" VALUES (7, '哲学', 7, 2);
INSERT INTO "courses" VALUES (8, '课程11', 16, 1);
INSERT INTO "courses" VALUES (9, '课程12', 13, 1);
INSERT INTO "courses" VALUES (10, '课程102', 8, 1);
INSERT INTO "courses" VALUES (11, 'kecheng11213', 10, 3);
INSERT INTO "courses" VALUES (12, '课程123', 11, 3);
-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO "plan" VALUES (1, 2, 1, NULL);
INSERT INTO "plan" VALUES (2, 3, 2, NULL);
INSERT INTO "plan" VALUES (3, 4, 2, NULL);
INSERT INTO "plan" VALUES (4, 1, 2, NULL);
INSERT INTO "plan" VALUES (5, 2, 3, NULL);
INSERT INTO "plan" VALUES (6, 3, 3, NULL);
INSERT INTO "plan" VALUES (7, 4, 3, NULL);
INSERT INTO "plan" VALUES (8, 1, 4, NULL);
INSERT INTO "plan" VALUES (9, 2, 4, NULL);
INSERT INTO "plan" VALUES (10, 3, 4, NULL);
INSERT INTO "plan" VALUES (11, 4, 4, NULL);
INSERT INTO "plan" VALUES (12, 2, 2, NULL);
INSERT INTO "plan" VALUES (13, 2, 5, NULL);
INSERT INTO "plan" VALUES (14, 3, 5, NULL);
INSERT INTO "plan" VALUES (15, 1, 1, NULL);
INSERT INTO "plan" VALUES (16, 1, 6, NULL);
INSERT INTO "plan" VALUES (17, 2, 6, NULL);
INSERT INTO "plan" VALUES (18, 3, 1, NULL);
INSERT INTO "plan" VALUES (19, 4, 6, NULL);
INSERT INTO "plan" VALUES (20, 1, 7, NULL);
INSERT INTO "plan" VALUES (21, 1, 5, NULL);
INSERT INTO "plan" VALUES (22, 3, 7, NULL);
INSERT INTO "plan" VALUES (23, 4, 7, NULL);
INSERT INTO "plan" VALUES (24, 1, 3, NULL);
INSERT INTO "plan" VALUES (25, 3, 6, NULL);
INSERT INTO "plan" VALUES (26, 4, 5, NULL);
INSERT INTO "plan" VALUES (27, 4, 1, NULL);
INSERT INTO "plan" VALUES (28, 2, 7, NULL);
INSERT INTO "plan" VALUES (29, 5, 2, NULL);
INSERT INTO "plan" VALUES (30, 7, 4, NULL);
INSERT INTO "plan" VALUES (31, 6, 3, NULL);
-- ----------------------------
-- Records of scores
-- ----------------------------
INSERT INTO "scores" VALUES (4, 5, 1, 66.0);
INSERT INTO "scores" VALUES (5, 6, 1, 99.0);
INSERT INTO "scores" VALUES (7, 1, 1, NULL);
INSERT INTO "scores" VALUES (8, 4, 1, 99.0);
INSERT INTO "scores" VALUES (9, 7, 1, NULL);
INSERT INTO "scores" VALUES (10, 3, 1, NULL);
INSERT INTO "scores" VALUES (11, 1, 2, NULL);
INSERT INTO "scores" VALUES (12, 2, 2, 99.0);
INSERT INTO "scores" VALUES (13, 3, 2, NULL);
INSERT INTO "scores" VALUES (14, 7, 2, NULL);
INSERT INTO "scores" VALUES (15, 10, 3, NULL);
INSERT INTO "scores" VALUES (16, 9, 3, NULL);
INSERT INTO "scores" VALUES (17, 2, 3, NULL);
INSERT INTO "scores" VALUES (19, 1, 3, NULL);
INSERT INTO "scores" VALUES (20, 7, 3, NULL);
INSERT INTO "scores" VALUES (21, 11, 3, 11.0);
INSERT INTO "scores" VALUES (22, 3, 3, NULL);
