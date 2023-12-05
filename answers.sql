/*1. Which restaurant received the most orders?*/

SELECT R.RestaurantName, COUNT(O.orderID) AS cnt_orders 
FROM restaurant R
JOIN orders O ON O.restaurantid = R.restaurantid
GROUP BY R.RestaurantName
ORDER BY cnt_orders DESC 
LIMIT 1;

/*2. Top 5 restaurants which saw the most sales? */

SELECT R.RestaurantName, SUM(O.orderamount) AS sales 
FROM restaurant R
JOIN orders O ON O.restaurantid = R.restaurantid
GROUP BY R.RestaurantName
ORDER BY sales DESC 
LIMIT 5;

/* 3. Top 5 customer order details? */

SELECT CustomerName, SUM(O.Quantity_of_Items) AS TotalOrders, SUM(O.OrderAmount) AS TotalAmount, AVG(O.Rating) AS AverageRating
FROM orders O
GROUP BY CustomerName
ORDER BY TotalOrders DESC 
LIMIT 5;


/*  4. When do customers order more in a day? */

SELECT DATE_FORMAT(order_datetime, '%H:%i:%s') AS order_time, COUNT(*) AS order_count
FROM orders
GROUP BY order_time
ORDER BY order_count DESC
LIMIT 1;

/* 5. Which is the most liked cuisine? */

SELECT Cuisine, COUNT(Cuisine) AS liked_cuisine
FROM restaurant
GROUP BY Cuisine
ORDER BY liked_cuisine DESC
LIMIT 1;

/* 6. Zone-Wise sales details by category? */

SELECT R.Zone, R.category, SUM(O.orderamount) AS sales
FROM restaurant R
JOIN orders O ON O.restaurantid = R.restaurantid
GROUP BY R.Zone, R.category
ORDER BY R.Zone ASC;



