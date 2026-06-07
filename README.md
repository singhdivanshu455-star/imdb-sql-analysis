# 🎬 IMDb Top 1000 Movies — SQL Analysis

**Author:** Divanshu Singh  
**Tool:** MySQL Workbench  
**Dataset:** IMDb Top 1000 Movies (Kaggle)  
**Skills:** SQL, Aggregations, Window Functions, CTEs

---

## 📌 Project Overview

This project analyzes the IMDb Top 1000 Movies dataset using SQL.  
The objective is to identify trends in movie ratings, genres, directors, votes, and audience preferences through structured data analysis.

---

## 🗂️ Dataset Info

| Column | Description |
|---|---|
| Series_Title | Movie name |
| Released_Year | Year of release |
| Genre | Movie genre |
| IMDB_Rating | IMDb rating (out of 10) |
| Director | Director name |
| No_of_Votes | Total audience votes |
| Gross | Box office revenue |
| Meta_score | Metacritic score |

---

## 📊 Analysis Structure

### 🔹 Basic Analysis
| # | Question |
|---|---|
| 1 | How many movies are in the dataset? |
| 2 | What are the Top 10 highest-rated movies? |
| 3 | What are the Top 10 movies with the most votes? |
| 4 | What is the average IMDb rating? |

### 🔸 Intermediate Analysis
| # | Question |
|---|---|
| 5 | Which genres have the highest average IMDb ratings? |
| 6 | Which directors directed the most movies? |
| 7 | Which release year produced the most movies? |
| 8 | What are the highest grossing movies? |

### 🔺 Advanced Analysis
| # | Question |
|---|---|
| 9 | Which directors consistently produce highly-rated movies? |
| 10 | Rank movies within each genre based on IMDb Rating |
| 11 | Find Hidden Gems (High Rating but Low Votes) |
| 12 | Which decade produced the highest-rated movies? |

---

## 💡 Key Insights

- 🏆 **1970s** produced the highest-rated movies with an average IMDb rating of **8.54**
- 🎬 **Francis Ford Coppola** consistently delivers the highest-rated movies among directors with 3+ films
- 🎥 **Christopher Nolan** and **Martin Scorsese** directed the most movies in the Top 1000 (7 each)
- 💎 **9 Hidden Gems** found — high ratings (8.0+) but under 100K votes (e.g. Capernaum 8.4, Children of Heaven 8.3)
- 🌍 Hidden gems are mostly international/foreign language films — underrated but critically acclaimed

---

## 🛠️ How to Run

1. Clone this repository
2. Import `imdb_analysis.sql` in MySQL Workbench
3. Run queries section by section

---

## 📁 Files

| File | Description |
|---|---|
| `imdb_analysis.sql` | All 12 SQL queries with comments |
| `imdb_cleaned.csv` | Cleaned dataset (commas removed from Gross, Runtime fixed) |
| `README.md` | Project documentation |
