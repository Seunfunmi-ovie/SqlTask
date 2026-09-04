USe quickride_plus;

SELECT
    t.trip_id,
    r.rider_name,
    d.driver_name,
    t.city,
    t.fare
FROM trips t
JOIN riders r
    ON t.rider_id = r.rider_id
JOIN drivers d
    ON t.driver_id = d.driver_id
WHERE t.status = 'Completed';



SELECT
    r.rider_name,
    d.driver_name,
    d.vehicle_type,
    t.fare
FROM trips t
JOIN riders r
    ON t.rider_id = r.rider_id
JOIN drivers d
    ON t.driver_id = d.driver_id
WHERE t.city = 'Lagos';



SELECT
    r.rider_id,
    r.rider_name,
    SUM(t.fare) AS total_spend
FROM riders r
JOIN trips t
    ON r.rider_id = t.rider_id
WHERE t.status = 'Completed'
GROUP BY
    r.rider_id,
    r.rider_name
ORDER BY total_spend DESC;


SELECT
    d.driver_id,
    d.driver_name,
    COUNT(t.trip_id) AS completed_trips,
    AVG(t.rating) AS average_rating
FROM drivers d
LEFT JOIN trips t
    ON d.driver_id = t.driver_id
    AND t.status = 'Completed'
GROUP BY
    d.driver_id,
    d.driver_name;



SELECT *
FROM trips
WHERE status = 'Completed'
  AND fare > (
      SELECT AVG(fare)
      FROM trips
      WHERE status = 'Completed'
  );



SELECT
    d.driver_id,
    d.driver_name
FROM drivers d
WHERE NOT EXISTS (
    SELECT 1
    FROM trips t
    WHERE t.driver_id = d.driver_id
      AND t.status = 'Cancelled'
);



SELECT
    r.rider_name,
    t.trip_id,
    t.fare
FROM trips t
JOIN riders r
    ON t.rider_id = r.rider_id
WHERE t.fare = (
    SELECT MAX(fare)
    FROM trips
);



SELECT
    r.rider_name,
    COUNT(t.trip_id) AS trip_count
FROM riders r
JOIN trips t
    ON r.rider_id = t.rider_id
GROUP BY
    r.rider_id,
    r.rider_name
HAVING COUNT(t.trip_id) > (
    SELECT COUNT(t2.trip_id)
    FROM trips t2
    JOIN riders r2
        ON t2.rider_id = r2.rider_id
    WHERE r2.rider_name = 'Chioma Bello'
);



SELECT DISTINCT
    r.rider_id,
    r.rider_name
FROM riders r
JOIN trips t
    ON r.rider_id = t.rider_id
WHERE t.rating = 5.0;



SELECT
    rider_name AS name,
    city,
    'Rider' AS role
FROM riders

UNION ALL

SELECT
    driver_name AS name,
    home_city AS city,
    'Driver' AS role
FROM drivers;



SELECT city
FROM trips

UNION

SELECT home_city
FROM drivers;



SELECT
    d.driver_name,
    SUM(t.fare) AS total_earnings
FROM drivers d
JOIN trips t
    ON d.driver_id = t.driver_id
WHERE t.status = 'Completed'
GROUP BY
    d.driver_id,
    d.driver_name
ORDER BY total_earnings DESC
LIMIT 1;

