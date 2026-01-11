CREATE TABLE sales_data AS 
SELECT * FROM 'Aprendizaje Personal/data/sales_data.csv';

'''
Product_ID: Unique identifier for each product sold. Randomly generated for practice purposes.
Sale_Date: The date when the sale occurred. Randomly selected from the year 2023.
Sales_Rep: The sales representative responsible for the transaction. The dataset includes five random sales representatives (Alice, Bob, Charlie, David, Eve).
Region: The region where the sale took place. The possible regions are North, South, East, and West.
Sales_Amount: The total sales amount for the transaction, including discounts if any. Values range from 100 to 10,000 (in currency units).
Quantity_Sold: The number of units sold in that transaction, randomly generated between 1 and 50.
Product_Category: The category of the product sold. Categories include Electronics, Furniture, Clothing, and Food.
Unit_Cost: The cost per unit of the product sold, randomly generated between 50 and 5000 currency units.
Unit_Price: The selling price per unit of the product, calculated to be higher than the unit cost.
Customer_Type: Indicates whether the customer is a New or Returning customer.
Discount: The discount applied to the sale, randomly chosen between 0% and 30%.
Payment_Method: The method of payment used by the customer (e.g., Credit Card, Cash, Bank Transfer).
Sales_Channel: The channel through which the sale occurred. Either Online or Retail.
Region_and_Sales_Rep: A combined column that pairs the region and sales representative for easier tracking.
'''

SELECT * FROM sales_data ORDER BY Sale_Date;

-- 1. Filtrar o top 10 produtos mais caros
SELECT Product_ID, Unit_Price AS Price, Unit_Cost, Product_Category AS Category 
FROM sales_data
ORDER BY Unit_Price DESC LIMIT 10;

SELECT DISTINCT Sales_Rep FROM sales_data;

-- 2. Filtrar vendas com valor entre 2500 e 8000, exceto na região West,
-- para clientes que são Returning e com desconto maior que 10%
-- Ordenar pela data da venda em ordem decrescente e limitar a 10 resultados
SELECT * FROM sales_data
WHERE Sales_Amount BETWEEN 2500 AND 8000
AND Region != 'West'
AND Customer_Type = 'Returning'
AND Discount > 0.1
ORDER BY Sale_Date DESC LIMIT 10;

-- 3. Filtrar todas as vendas que não sejam da categoria Food,
-- onde o representante de vendas comece com a letra D ou comece com a letra C,
-- o método de pagamento não seja Cash, e o canal de vendas seja Online.
-- Ordenar pelo valor da venda em ordem crescente e limitar a 15 resultados
SELECT * FROM sales_data
WHERE Product_Category != 'Food'
AND (Sales_Rep LIKE 'D%' 
OR Sales_Rep LIKE 'C%')
AND Payment_Method != 'Cash'
AND Sales_Channel = 'Online'
ORDER BY Sales_Amount ASC LIMIT 15;

-- 4. Filtrar produtos onde o custo unitário seja maior que 70% do preço unitário,
-- o desconto não esteja entre 5% e 20%, e a região não seja North ou East.
-- Ordenar pelo preço unitário em ordem decrescente.
SELECT Product_ID, Product_Category AS Category, Unit_Price, Unit_Cost, Discount, Region FROM sales_data
WHERE Unit_cost > (Unit_Price * 0.7) 
AND Discount NOT BETWEEN 0.05 AND 0.2
AND Region NOT IN ('North', 'East')
ORDER BY Unit_Price DESC;

-- 5. Filtrar todas as vendas onde a quantidade vendida seja maior que 30,
-- o valor da venda seja menor que 4000, a categoria do produto seja Electronics ou Furniture,
-- e o representante de vendas não contenha a letra 'e' no nome.
-- Ordenar pela quantidade vendida em ordem decrescente e limitar a 20 resultados
SELECT * FROM sales_data
WHERE Quantity_Sold > 30
AND Sales_Amount < 4000
AND Product_Category IN ('Electronics', 'Furniture')
AND Sales_Rep NOT LIKE '%e%'
ORDER BY Quantity_Sold DESC LIMIT 20;

-- 6. Filtrar todas as vendas na região South,
-- onde o canal de vendas seja Retail,
-- o tipo de cliente seja New,
-- e o valor da venda não esteja entre 1000 e 3000.
-- Ordenar pelo valor da venda em ordem decrescente.
SELECT * FROM sales_data
WHERE Region_and_Sales_Rep LIKE '%South%'
AND Sales_Channel = 'Retail'
AND Customer_Type = 'New'
AND Sales_Amount NOT BETWEEN 1000 AND 3000
ORDER BY Sales_Amount DESC;


-- Trabalhando com datas
SELECT CURRENT_DATE;
SELECT CURRENT_TIMESTAMP;

SELECT * FROM sales_data
LIMIT 5;

SELECT Sale_Date, YEAR(Sale_Date) AS Sale_year FROM sales_data LIMIT 5;
SELECT Sale_Date, MONTH(Sale_Date) AS Sale_month FROM sales_data LIMIT 5;
SELECT Sale_Date, DAY(Sale_Date) AS Sale_day FROM sales_data LIMIT 5;
SELECT Sale_Date, YEAR(Sale_Date) AS Sale_year, MONTH(Sale_Date) AS Sale_month,
DAY(Sale_Date) AS Sale_day FROM sales_data LIMIT 5;

SELECT Sale_Date, (CURRENT_DATE - Sale_Date) AS Day_ago 
FROM sales_data 
WHERE (CURRENT_DATE - Sale_Date) > 1000
ORDER BY Sale_Date DESC LIMIT 5;

SELECT * FROM sales_data
WHERE (CURRENT_DATE - Sale_Date) > 1000
ORDER BY Sale_Date DESC LIMIT 5;