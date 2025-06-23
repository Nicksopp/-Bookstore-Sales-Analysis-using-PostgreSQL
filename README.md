# 📚 Bookstore Sales Analysis using PostgreSQL

This project analyzes a fictional bookstore's operations using structured SQL queries in PostgreSQL. It explores customer behavior, book inventory, orders, revenue, and genre-based trends.

## 🧠 Objective

To perform meaningful data analysis using SQL on real-world business data (Books, Orders, and Customers) and extract insights that could help make informed decisions.

---

## 📸 Screenshots
![Screenshot 2025-06-24 011340](https://github.com/user-attachments/assets/7fe6a40a-5037-4bad-98f1-ad0863a10f8f)
![Screenshot 2025-06-24 011500](https://github.com/user-attachments/assets/8c17afef-b616-4ca2-8aac-b5509455e858)



## 📂 Dataset Structure

Three CSV files were originally used and imported into PostgreSQL:

- **BOOKS**
  - `book_id`, `title`, `author`, `genre`, `published_year`, `price`, `stock`
- **CUSTOMERS**
  - `customer_id`, `name`, `email`, `phone`, `city`, `country`
- **ORDERS**
  - `order_id`, `customer_id`, `book_id`, `order_date`, `quantity`, `total_amount`

---

## 🔍 Key SQL Operations Performed

### 📌 Beginner-Level Queries:
- List all books in a genre (e.g. Fiction)
- Customers from a specific country
- Orders from a specific date range
- Find most/least expensive books
- Books with lowest stock
- Customers who ordered more than 1 quantity
- Total stock available
- Total revenue generated

### 📌 Advanced SQL Analysis:
- 📊 Total books sold by genre
- 🧮 Average book price by genre
- 🧑‍🤝‍🧑 Customers with at least 2 orders
- 🔝 Most frequently ordered book
- 🏆 Top 3 most expensive books in Fantasy
- ✍️ Total books sold by author
- 🏙️ Cities of high-spending customers
- 💰 Customer who spent the most
- 📦 Remaining stock after fulfilling orders

---

## 🛠️ Tools Used

- PostgreSQL (pgAdmin GUI)
- SQL DDL & DML
- Joins, Aggregations, Subqueries
- Excel (for data input & mock source files)

---

## 💡 Insights & Learnings

- Used real-life business logic to analyze data
- Built SQL fluency across `JOIN`, `GROUP BY`, `HAVING`, and `CASE`
- Practiced calculating KPIs like stock remaining, total revenue, best customers

---

## 🚀 How to Run

1. Clone this repo
2. Import the `.sql` file into pgAdmin (or any PostgreSQL DB)
3. Run the provided SQL queries in the file
4. Modify or extend queries as needed

---

## 📁 Files Included

- `NIKESH.sql` – All table creation + queries
- `README.md` – Project documentation
- *(Optional)*: Add your `books.csv`, `orders.csv`, `customers.csv` if you want

---

## 📢 Author

**Nikesh Purohit**  
YouTube: [Tech With Nicks](https://www.youtube.com/@TechWithNicks)  
Learning SQL, Data Analytics, and building real-world data projects.

---

## ⭐️ If you like this project
- Star it ⭐️
- Fork it 🔁
- Share your own queries in issues or pull requests
