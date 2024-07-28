-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
-- Calculate daily average users before and after the feature change on 2018-06-02
WITH daily_logins AS (
    SELECT 
        date(login_timestamp, 'unixepoch') AS login_date,
        COUNT(DISTINCT user_id) AS daily_users
    FROM login_history
    GROUP BY login_date
),
before_feature AS (
    SELECT 
        AVG(daily_users) AS avg_daily_users_before
    FROM daily_logins
    WHERE login_date < '2018-06-02'
),
after_feature AS (
    SELECT 
        AVG(daily_users) AS avg_daily_users_after
    FROM daily_logins
    WHERE login_date >= '2018-06-02'
)
SELECT
    before_feature.avg_daily_users_before,
    after_feature.avg_daily_users_after
FROM
    before_feature,
    after_feature;





-- PART 2: Create a SQL query that indicates the number of status changes by card

-- Calculate the number of status changes by card
SELECT
    cardID,
    COUNT(*) AS number_of_status_changes
FROM
    card_change_history
GROUP BY
    cardID;




