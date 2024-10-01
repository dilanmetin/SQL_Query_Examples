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
--Productid=31 olan ürün toplam kaç adet satılmıştır
SELECT  SUM(Quantity) as Total_Quantity
FROM [Order Details] WHERE ProductID='1'

--Hangi orderdan toplam ne kadar tutarda sipariş yapılmıştır
select OrderID, SUM(UnitPrice*Quantity) as Total_Price from [Order Details]
GROUP BY OrderID

--Left join 
--Her çalışan tarafından yapılan siparişleri listeleyelim
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Orders.OrderID
FROM  Employees
LEFT JOIN  Orders ON Employees.EmployeeID = Orders.EmployeeID
ORDER BY  Employees.EmployeeID;

--Çalışanların toplam kaç adet satış yaptığına bakalım
SELECT Employees.FirstName, Employees.LastName, Count(OrderID) AS Order_Count
FROM Employees
LEFT JOIN  Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY Order_Count DESC

--Right join
SELECT Customers.CustomerID,CompanyName, Orders.OrderID
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

--Inner join
SELECT Customers.CustomerID,CompanyName, Orders.OrderID
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
