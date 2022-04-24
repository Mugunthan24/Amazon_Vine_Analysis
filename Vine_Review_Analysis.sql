CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);


-- Vine Table filtered for total_votes greater than 20
CREATE TABLE vine_table_filtered1
	AS (SELECT * FROM vine_table
			WHERE total_votes > 20)


-- Vine Table filtered for total_votes greater than 20 and helpful_votes/total_votes is greater than 50%
CREATE TABLE vine_table_filtered2
	AS (SELECT * FROM vine_table_filtered1
			WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5)


-- Vine Table filtered for total_votes greater than 20, helpful_votes/total_votes is greater than 50%, and a review was written as part of the Vine program (paid) 
CREATE TABLE vine_table_filtered3
	AS (SELECT * FROM vine_table_filtered2
			WHERE vine = 'Y')


-- Vine Table filtered for total_votes greater than 20, helpful_votes/total_votes is greater than 50%, and a review was not written as part of the Vine program (paid) 
CREATE TABLE vine_table_filtered4
	AS (SELECT * FROM vine_table_filtered2
			WHERE vine = 'N')


-- Total Number of Reviews (Paid)
CREATE TABLE vine_table_number_of_reviews_paid
    AS (SELECT COUNT(vine) AS "Total Number of Paid Reviews" FROM vine_table_filtered2
	   		WHERE vine = 'Y')


-- Total Number of Reviews (Unpaid)
CREATE TABLE vine_table_number_of_reviews_unpaid
    AS (SELECT COUNT(vine) AS "Total Number of Paid Reviews" FROM vine_table_filtered2
	   		WHERE vine = 'N')


-- Number of 5-star Reviews (Paid)
CREATE TABLE vine_table_number_of_5Stars_paid
    AS (SELECT COUNT(vine) AS "Total Number of 5-Star Paid Reviews" FROM vine_table_filtered2
	   		WHERE star_rating = 5 AND vine = 'Y')


-- Number of 5-star Reviews (Unpaid)
CREATE TABLE vine_table_number_of_5Stars_unpaid
    AS (SELECT COUNT(vine) AS "Total Number of 5-Star Unpaid Reviews" FROM vine_table_filtered2
	   		WHERE star_rating = 5 AND vine = 'N')


-- Percentage of 5-star Reviews (Paid)
SELECT 
Round(((SELECT COUNT(vine) AS "Total Number of 5-Star Paid Reviews" FROM vine_table_filtered2
	   		WHERE star_rating = 5 AND vine = 'Y')::DECIMAL /
(SELECT COUNT(vine) AS "Total Number of Paid Reviews" FROM vine_table_filtered2
	   		WHERE vine = 'Y')::DECIMAL), 2) * 100 AS "Percentage of 5 Star Reviews (Paid)"


-- Percentage of 5-star Reviews (Unpaid)
SELECT 
((SELECT COUNT(vine) AS "Total Number of 5-Star Paid Reviews" FROM vine_table_filtered2
	   		WHERE star_rating = 5 AND vine = 'N')::DECIMAL /
(SELECT COUNT(vine) AS "Total Number of Paid Reviews" FROM vine_table_filtered2
	   		WHERE vine = 'N')::DECIMAL) AS "Percentage of 5 Star Reviews (Unpaid)"