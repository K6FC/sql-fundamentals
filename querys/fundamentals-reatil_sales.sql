'''About this file
Transaction ID: A unique identifier for each transaction, allowing tracking and reference.
Date: The date when the transaction occurred, providing insights into sales trends over time.
Customer ID: A unique identifier for each customer, enabling customer-centric analysis.
Gender: The gender of the customer (Male/Female), offering insights into gender-based purchasing patterns.
Age: The age of the customer, facilitating segmentation and exploration of age-related influences.
Product Category: The category of the purchased product (e.g., Electronics, 
Clothing, Beauty), helping understand product preferences.
Quantity: The number of units of the product purchased, contributing to insights on purchase volumes.
Price per Unit: The price of one unit of the product, aiding in calculations related to total spending.
Total Amount: The total monetary value of the transaction, showcasing the 
financial impact of each purchase.'''

-- VAMOS A FAZER USO PRINCIPALMENTE DO AND E DO OR, TAMBEM DO IS NULL E IS NOT NULL
-- UPLOAD do aquivo retail_sales_dataset.csv

CREATE TABLE retail_sales AS
SELECT * FROM read_csv('Aprendizaje Personal/data/retail_sales_dataset.csv');

SHOW TABLES;

SELECT * FROM retail_sales;

-- QUERYS de pratica
SELECT DISTINCT Gender, "Product Category" FROM retail_sales;
SELECT * FROM retail_sales ORDER BY "Price per Unit" DESC;
 
 --EXERCICIOS
-- 1. Selecione todas as colunas da tabela retail_sales onde a categoria do 
--produto seja 'Electronics' e o preço por unidade esteja entre 50 e 100.
SELECT * FROM retail_sales
WHERE "Product Category" ='Electronics'
  AND "Price per Unit" BETWEEN 50 AND 100;

-- 2. Selecione todas as colunas da tabela retail_sales onde o valor total seja 
--maior ou igual a 1500 e a data da transação esteja no segundo trimestre do ano.
SELECT * FROM retail_sales
WHERE "Total Amount" >= 1500 
AND QUARTER(Date) = 2
ORDER BY Date, "Total Amount" DESC;

-- 3. Selecione a categoria do produto, o gênero e a quantidade de produtos
-- vendidos onde a categoria do produto não seja 'Electronics' e o gênero seja 'Female'.
SELECT "Product Category", Gender, Quantity FROM retail_sales
WHERE "Product Category" != 'Electronics'
AND Gender = 'Female' ORDER BY "Product Category" ASC;

--UPDATE: 
--Arquivo não tem valores nulos, então, vou a fazer uma nova pratica
--Com um arquivo que não esteja limpo.