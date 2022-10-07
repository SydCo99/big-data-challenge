CREATE TABLE vine_trust AS 
SELECT review_id_table.product_id, vine_table.review_id, vine_table.star_rating, vine_table.helpful_votes, vine_table.total_votes,vine_table.vine 
FROM review_id_table 
INNER JOIN vine_table ON review_id_table.review_id=vine_table.review_id;

SELECT product_id, AVG(star_rating) AS avg_star_rating
FROM vine_trust
GROUP BY product_id;

SELECT vine, AVG(star_rating) AS avg_star_rating, product_id
FROM vine_trust
WHERE vine='Y'
GROUP BY vine, product_id;

SELECT vine, AVG(star_rating) AS avg_star_rating, product_id
FROM vine_trust
WHERE vine='N'
GROUP BY vine, product_id;


SELECT sum(helpful_votes) AS sum_helpful_votes, review_id, AVG(star_rating) AS avg_star_rating, vine
FROM vine_trust 
WHERE vine='Y'
GROUP BY review_id, vine
ORDER BY sum_helpful_votes DESC;

SELECT sum(helpful_votes) AS sum_helpful_votes, review_id, AVG(star_rating) AS avg_star_rating, vine
FROM vine_trust 
WHERE vine='N'
GROUP BY review_id, vine
ORDER BY sum_helpful_votes DESC;