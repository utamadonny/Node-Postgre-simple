/*
 Navicat Premium Data Transfer

 Source Server         : Perpustakaan
 Source Server Type    : PostgreSQL
 Source Server Version : 110005
 Source Host           : localhost:5432
 Source Catalog        : Perpustakaan
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110005
 File Encoding         : 65001

 Date: 26/08/2019 00:01:01
*/


-- ----------------------------
-- Sequence structure for books_book_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."books_book_id_seq";
CREATE SEQUENCE "public"."books_book_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS "public"."books";
CREATE TABLE "public"."books" (
  "book_id" int4 NOT NULL DEFAULT nextval('books_book_id_seq'::regclass),
  "title" varchar(100) COLLATE "pg_catalog"."default",
  "author" varchar(100) COLLATE "pg_catalog"."default",
  "comments" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO "public"."books" VALUES (2, 'Hancur Lebur', 'Metalurgist', 'Tentang Baja');
INSERT INTO "public"."books" VALUES (4, 'Teknik Menghilang', 'Koeharto', 'Kisah seorang pemimpin');
INSERT INTO "public"."books" VALUES (5, 'Buku Hijau', 'Pramoesa', 'Catatan Hutang Pramusa');
INSERT INTO "public"."books" VALUES (6, 'Meracik Obat Terlarang', 'Dr. Update', 'Buku ini haram');
INSERT INTO "public"."books" VALUES (8, 'Sampah Masyarakat', 'Derry Simatupang', 'Buku ini buku bacaan');
INSERT INTO "public"."books" VALUES (1, 'Anda Bertanya?', 'Ust. Saiful', 'Buku Relikhiyes');
INSERT INTO "public"."books" VALUES (10, 'Pasti Salah Zorrowi', 'Denny Marhamah', 'Buku politik!!');
INSERT INTO "public"."books" VALUES (11, 'Node.Js', 'Raja Guntur', 'Serem.. cerita hororr');
INSERT INTO "public"."books" VALUES (12, 'Kumpulan Humor Gus Dor!!', 'Gerry Coklat', 'Resep Masakan');
INSERT INTO "public"."books" VALUES (7, 'Kisah Gagal Tugas Sensor', 'Dea Anjoya', 'Kisah Depresi Seorang Mahasiswa');
INSERT INTO "public"."books" VALUES (13, 'Desember Gugur', 'Selly Serotonin', 'Buku Demotivasi');
INSERT INTO "public"."books" VALUES (14, 'Blast Furnace', 'Karya Mansyur', 'Aku Cinta Pabrik!');
INSERT INTO "public"."books" VALUES (15, 'Haram Tourism di Aceh', 'Al-Choki Pardede', 'Buku Penista!!');
INSERT INTO "public"."books" VALUES (16, 'Indra Kesepuluh', 'Mbah Dukun', 'Merakit Laptop Anda Sendiri');
INSERT INTO "public"."books" VALUES (3, 'Hantu Buah Naga', 'Colette', 'Buku ini tidak lucu');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."books_book_id_seq"
OWNED BY "public"."books"."book_id";
SELECT setval('"public"."books_book_id_seq"', 17, true);

-- ----------------------------
-- Primary Key structure for table books
-- ----------------------------
ALTER TABLE "public"."books" ADD CONSTRAINT "books_pkey" PRIMARY KEY ("book_id");
