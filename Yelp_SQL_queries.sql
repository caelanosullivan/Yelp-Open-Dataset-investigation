USE yelp_db;

-- Aggregated table with friend counts
CREATE TABLE user_copy as SELECT
    user.*,
    COALESCE(friend.friend_count,
    0) friend_count,
    IF(elite.user_id is null,
    0,
    1) elite_status 
FROM
    user as user 
LEFT JOIN
    (
        SELECT
            user_id,
            count(*) friend_count   
        FROM
            friend   
        GROUP BY
            1
    ) friend 
        ON friend.user_id = user.id 
LEFT JOIN
    (
        SELECT
            DISTINCT    user_id   
        FROM
            elite_years
    ) elite 
        ON friend.user_id = elite.user_id;


-- Per-day review roll-up table

CREATE TABLE review_daily_rollup SELECT
    user_id,
    date,
    AVG(stars) AS avg_stars,
    COUNT(*) AS review_count 
FROM
    review 
GROUP BY
    date,
    user_id 
ORDER BY
    date DESC;


-- Alternative review rollup table
CREATE TABLE review_rollups SELECT
    review_rollup.user_id,
    review_rollup.review_date,
    review_rollup.reviews,
    review_rollup.useful_reviews,
    review_rollup.funny_reviews,
    Review_rollup.cool_reviews,
    One_star_reviews,
    two_star_reviews,
    three_star_reviews,
    four_star_reviews,
    five_star_reviews,
    IF(elite.user_id is not null,
    1,
    0) elite_status,
    user.yelping_since 
FROM
    ( SELECT
        Date as review_date,
        User_id,
        count(*) reviews,
        SUM(IF(useful=1,
        1,
        0)) useful_reviews,
        SUM(IF(funny=1,
        1,
        0)) funny_reviews,
        SUM(IF(cool=1,
        1,
        0)) cool_reviews,
        MAX(stars) max_star_review,
        MIN(stars) min_star_review,
        SUM(IF(stars=1,
        1,
        0)) one_star_reviews,
        SUM(IF(stars=2,
        1,
        0)) two_star_reviews,
        SUM(IF(stars=3,
        1,
        0)) three_star_reviews,
        SUM(IF(stars=4,
        1,
        0)) four_star_reviews,
        SUM(IF(stars=5,
        1,
        0)) five_star_reviews 
    FROM
        review 
    GROUP BY
        1,
        2) review_rollup 
LEFT JOIN
    (
        SELECT
            id,
            Yelping_since  
        FROM
            user
    ) user 
        ON user.id = review_rollup.user_id 
LEFT JOIN
    (
        SELECT
            distinct user_id  
        FROM
            elite_years
    ) elite 
        ON elite.user_id = review_rollup.user_id;

-- Find businesses in restaurant/food categories

CREATE TABLE category_restaurant AS SELECT
    a.* 
FROM
    category a 
INNER JOIN
    (
        SELECT
            business_id  
        FROM
            category  
        WHERE
            category IN (
                'restaurants', 'food'
            )  
        GROUP BY
            1
    ) b 
        ON a.business_id = b.business_id;