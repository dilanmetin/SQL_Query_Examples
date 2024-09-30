--Tablodaki tüm verileri sorgulamak
SELECT * FROM dbo.Products;

--Tablodaki belirli kolonlarý sorgulamak
SELECT ProductName, UnitPrice FROM dbo.Products;

--Where ile Tabloda istenilen filtreye göre veri çekmek 
SELECT * FROM dbo.Employees
WHERE title = 'Sales Representative' ;

--Where ile olumsuz sorgu
SELECT * FROM Categories
WHERE CategoryName NOT LIKE 'Beverages';


--And ve Or Kullanýmý( Ve / Veya)


SELECT * FROM dbo.Products
WHERE CategoryID='1' 
OR  CategoryID='2'  ;


SELECT * FROM dbo.Products
WHERE CategoryID='1' 
AND  SupplierID='1'  ;

--Verileri A'dan Z'ye, Z'den-A'ya, Büyükten küçüðe, Küçükten büyüðe sýralamak
SELECT ProductName, UnitPrice FROM dbo.Products
ORDER BY ProductName ASC;
SELECT ProductName, UnitPrice FROM dbo.Products
ORDER BY UnitPrice DESC;

--Count kullanýmý(Sayma)
SELECT ProductID,ProductName,UnitPrice
FROM Products
WHERE UnitPrice > 17;

--Gruplamak
SELECT COUNT(SupplierID), Country
FROM Suppliers
GROUP BY Country;

--DISTINCT
--Tablodaki kolonlarda tekrar eden verilerden yalnýzca birinin gösterilmesi için kullanýlýr.
SELECT COUNT (DISTINCT Country)
FROM Suppliers;

--Ýçeren kelimeye göre filtreleme
SELECT * FROM Products 
WHERE ProductName LIKE  '%Pa%';

--Sum kullanýmý(Toplam)
SELECT OrderId, SUM(UnitPrice) AS TotalPrice
FROM [Order Details] 
GROUP BY OrderID;

--Left join 
SELECT OrderId,[Order Details].UnitPrice * Quantity  as Total_Price, Products.ProductName 
FROM [Order Details]
LEFT JOIN Products ON [Order Details].ProductID= Products.ProductID;

--Right join
SELECT Customers.CustomerID,CompanyName, Orders.OrderID
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

--Inner join
SELECT Customers.CustomerID,CompanyName, Orders.OrderID
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
