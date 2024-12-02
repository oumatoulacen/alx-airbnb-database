-- find all properties where the average rating is greater than 4.0 using a subquery
SELECT 
    property_id, 
    name, 
    location 
FROM 
    Property 
WHERE 
    property_id
IN (
    SELECT 
        property_id 
    FROM 
        Review 
    GROUP BY 
        property_id 
    HAVING 
        AVG(rating) > 4.0
);

-- a correlated subquery to find users who have made more than 3 bookings.
SELECT 
    user_id, 
    first_name, 
    last_name, 
    email 
FROM
    User
WHERE 
    user_id
IN (
    SELECT 
        user_id 
    FROM 
        Booking 
    WHERE 
        user_id = User.user_id
    GROUP BY 
        user_id 
    HAVING 
        COUNT(*) > 3
);
