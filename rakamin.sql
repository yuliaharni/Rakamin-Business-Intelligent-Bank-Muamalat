use rakamin;
describe customers;
ALTER TABLE customers
ADD PRIMARY KEY (CustomerID);


describe orders;
select*from orders;

-- primary-key
ALTER TABLE orders
ADD PRIMARY KEY (OrderID);
-- Tambahkan foreign key ke tabel yang sudah ada
ALTER TABLE orders
ADD CONSTRAINT orders FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID);
ALTER TABLE orders
ADD CONSTRAINT orders FOREIGN KEY (ProdNumber) REFERENCES products(ProdNumber);

describe productcategory;
ALTER TABLE productcategory
ADD PRIMARY KEY (CategoryID);
select*from productcategory;

describe products;
ALTER TABLE products
ADD PRIMARY KEY (ProdNumber(255)); 
ALTER TABLE products
ADD CONSTRAINT products FOREIGN KEY (Category) REFERENCES productcategory(CategoryID);
select * from products;

-- membuat tabel master
CREATE TABLE penjualan AS
SELECT 
    o.OrderDate AS order_date,
    pc.CategoryName AS category_name,
    p.ProdName AS product_name,
    p.Price AS product_price,
    o.Quantity AS order_qty,
	o.Quantity * p.Price AS total_price,
	c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city
FROM 
    customers c
JOIN 
    orders o ON c.CustomerID = o.CustomerID
JOIN 
    products p ON o.ProdNumber = p.ProdNumber
JOIN 
    productcategory pc ON p.Category = pc.CategoryID;
    
 select*from penjualan order by order_date;
    
ALTER TABLE penjualan
MODIFY COLUMN order_date DATE;
describe penjualan;





