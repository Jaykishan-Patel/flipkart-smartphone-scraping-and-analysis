CREATE DATABASE smart_phone;
USE smart_phone;

-- create a  table that contains unique_model bcz existing table contains same model with different color,ram,rom. 
CREATE TABLE unique_model AS
SELECT brand,model_name,MAX(price) AS "price",5G_flag,MAX(avg_rating) AS "avg_rating",MAX(reviews) AS "reviews",
processor,MAX(RAM) AS "ram",MAX(ROM) as"rom",MAX(display_size) ,display_type
FROM phones
GROUP BY brand,model_name,5G_flag,processor,display_type;


-- Question 1: Retrieve All Apple Phones
SELECT *
FROM unique_model
WHERE brand = 'APPLE';

-- Q2: Find all phones with a price between ?10,000 and ?20,000.
SELECT model_name, brand, price
FROM unique_model
WHERE price BETWEEN 10000 AND 20000;

-- Q3: List the top 10 most expensive phones.
SELECT model_name, brand, price
FROM unique_model
ORDER BY price DESC LIMIT 10;

-- Q4: Count the number of phone models for each brand and show the brands with more than 10 models.
SELECT brand, COUNT(model_name) AS model_count
FROM unique_model
GROUP BY brand
HAVING COUNT(model_name) > 10;

-- Q5: Find all 5G enabled phones that have an average rating of 4.5 or higher.
SELECT model_name, brand, avg_rating
FROM unique_model
WHERE 5G_flag = 'Yes' AND avg_rating >= 4.5;

-- Q6: Calculate the average price of phones for each brand.
SELECT brand, AVG(price) AS average_price
FROM unique_model
GROUP BY brand;

-- Q7: List all phones that have a 'Snapdragon' processor.
SELECT model_name, brand, processor
FROM unique_model
WHERE processor LIKE '%Snapdragon%';

-- Q8: Find the phone with the largest display size.
ALTER TABLE unique_model CHANGE COLUMN `MAX(display_size)` display_size FLOAT;
SELECT model_name, brand, display_size
FROM unique_model
ORDER BY display_size DESC LIMIT 1;

-- Q9: Show all phones with 8GB of RAM and 128GB of ROM, sorted by price.
SELECT model_name, brand, price
FROM unique_model
WHERE ram = 8 AND rom = 128
ORDER BY price ASC;

-- Q10: Find the average number of reviews for 5G vs non-5G phones.
SELECT 5G_flag, AVG(reviews) as average_reviews
FROM unique_model
GROUP BY 5G_flag;

-- Q11: Retrieve all distinct processor types present in the dataset.
SELECT DISTINCT processor
FROM unique_model;

-- Q12: List phones that have a 'Full HD+' display type and more than 5000 reviews.
SELECT model_name, display_type, reviews
FROM unique_model
WHERE display_type = 'Full HD+ Display' AND reviews > 5000;

-- Q13: Find the top 5 brands with the highest average number of reviews.
SELECT brand, AVG(reviews) AS avg_review_count
FROM unique_model
GROUP BY brand
ORDER BY avg_review_count DESC
LIMIT 5;

-- Q14: Classify phones into 'Budget' (< 15000), 'Mid-Range' (15000-40000), and 'Premium' (> 40000) tiers.
SELECT
  model_name,
  price,
  CASE
    WHEN price < 15000 THEN 'Budget'
    WHEN price >= 15000 AND price < 40000 THEN 'Mid-Range'
    ELSE 'Premium'
  END AS price_tier
FROM unique_model;

-- Q15: Find all phones that have a higher than average price for their respective brand.
SELECT
  t1.model_name,
  t1.brand,
  t1.price
FROM
  unique_model t1
INNER JOIN (
  SELECT brand, AVG(price) as avg_price
  FROM unique_model
  GROUP BY brand
) t2 ON t1.brand = t2.brand
WHERE
  t1.price > t2.avg_price;