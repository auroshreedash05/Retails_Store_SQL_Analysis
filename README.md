# Retails_Store_SQL_Analysis
## 🔎 Overview
A basic END-TO-End Analyze a retail store 2023 data sales analysis in SQL to extract insights about sales in gender, age and category, etc.
### 📊 Dataset
##### Table :- 
- Retail_Store
- [Dataset](https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)
##### Columns :-
- Transaction Id
- Date
- Customer ID
- Gender
- Age
- Product Category
- Quantity
- Price Per Unit
- Total Amount 
### 🛠️ Tools Used
- PostgreSQL 18
- PG Admin4
### ❓Questions Solved
- List of customer who buy the beauty product.
- List of male customer who order electronic product and the revenue generated.
- Which Gender buy the product most?
- What are the minimum, maximum and average age buy the products?
- Which Product category sales most?
- How much revenue generate from Clothing product?
- What is the Average revenue generate in each category?
- Rank of each customer by their total spends.
- From January to March of 2023 Which product category sales most?
- Which gender buy the Which product most?
- Rank of each product category sales.

### 📝SQL Concept Used
##### Clause keywords
- SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY
##### Aggregate Functions
- SUM, MIN, MAX, AVG, ROUND
##### Conditional Keywords
- CASE, WHEN, ELSE, END
##### Filter & Range Keywords
- AND, BETWEEN, LIMIT
##### Alias Keyword
- AS
##### Sort keyword
- DESC, ASC

### 💡Key Insights
- Analyse a 1k rows of dataset from Kaggle.
- Female buy the product almost 500+ and generate the revneue of 2,30,000+ than male.
- On an average 42 year old prople buy the products most.
- Electronics are the best selling product in the store almost 342 quanity sales and 1.5lkh+ revenue generates.
- Almost 150+ customer spends 1k+ rs in single orders, and almost 600+ customers are spends less than 500rs per order.
- Analyze that females are buying beauty product almost 400+ orders and males are buying clothing almost 450+ orders.
- In the store clothing are best selling product over time almost 850+ quantities and generate 1.5lkh+ revenue, While
  electronics product are sell less amount of quantity but generate 1.6lkh+ revenue which is better than clothing product.
### ✍️Sample Queries
``` SQL
SELECT * FROM Retail_store WHERE Date BETWEEN '2023-10-01' AND '2023-12-31';
