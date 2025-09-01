# Flipkart Smartphone Market Analysis

### An End-to-End Data Analytics Project: From Web Scraping to Interactive Dashboard

[![Python](https://img.shields.io/badge/Python-3.9%2B-blue.svg)](https://www.python.org/downloads/)
[![Libraries](https://img.shields.io/badge/Libraries-Pandas%20%7C%20Selenium%20%7C%20Seaborn-brightgreen.svg)](https://pypi.org/)
[![Visualization](https://img.shields.io/badge/Dashboard-Power%20BI-yellow.svg)](https://powerbi.microsoft.com/)
[![Database](https://img.shields.io/badge/Database-SQL-lightgrey.svg)]()

---

## 🎯 Project Goal

The Indian smartphone market is one of the most dynamic and competitive in the world. This project aims to perform a comprehensive analysis of this market by scraping data from Flipkart, a leading e-commerce platform. The primary goal is to uncover key trends, understand the factors that drive smartphone prices, and visualize these insights through an interactive business intelligence dashboard.

---

## 📊 Interactive Power BI Dashboard

The final output is a dynamic Power BI dashboard that consolidates all findings. It allows users to filter by brand, price range, and features to explore the dataset and gain a holistic view of the market landscape.

![Power BI Dashboard Snapshot](<img width="967" height="546" alt="Image" src="https://github.com/user-attachments/assets/39743069-fff0-40d3-a379-7e6a200ff80b" />)

---

## 🛠️ Tech Stack

| Domain                  | Technologies & Libraries                                     |
| ----------------------- | ------------------------------------------------------------ |
| **Web Scraping** | `Python`, `Selenium`, `BeautifulSoup`                        |
| **Data Processing** | `Pandas`, `NumPy`                                            |
| **Data Visualization** | `Matplotlib`, `Seaborn`, `Power BI`                          |
| **Database Querying** | `SQL` (within a database management system like MySQL/PostgreSQL) |
| **Development Tools** | `Jupyter Notebook`, `PyCharm`                                |

---

## 📂 Project Workflow & Architecture

The project follows a structured data pipeline, starting from raw data collection and ending with actionable insights.

`Web Scraping (Selenium)` **->** `Data Extraction (BeautifulSoup)` **->** `Data Cleaning & Transformation (Pandas)` **->** `Exploratory Data Analysis (Jupyter)` **->** `Data Querying (SQL)` **->** `Dashboarding (Power BI)`

### 1. Data Acquisition (Web Scraping)

* **Tool:** A Python script (`webScreening.py`) using the **Selenium** library.
* **Process:**
    * Automated a Chrome browser to navigate to Flipkart's smartphone search results.
    * Systematically iterated through 42 unique pages of listings, handling dynamic page loading.
    * The complete HTML source code of each page was saved into a single `all_pages.html` file for offline processing.

### 2. Data Cleaning & Feature Engineering

* **Tools:** **Jupyter Notebook** (`cleanMobileData.ipynb`), **BeautifulSoup**, and **Pandas**.
* **Process:**
    * The raw HTML file was parsed with BeautifulSoup to extract structured data for each phone (model name, price, ratings, specifications).
    * The extracted data was loaded into a Pandas DataFrame, where extensive cleaning and feature engineering were performed:
        * **Price Cleaning:** Converted price from string (e.g., `"₹22,999"`) to a numeric format (`22999`).
        * **Feature Extraction:** Split complex strings into distinct, usable columns. For example:
            * `'4 GB RAM | 64 GB ROM'` -> `RAM` (4) and `ROM` (64).
            * `'50MP Rear Camera | 8MP Front'` -> `Rear_Camera` (50) and `Front_Camera` (8).
        * **Brand Extraction:** Created a `brand` column by parsing the `model_name` (e.g., `'MOTOROLA g05'` -> `'MOTOROLA'`).
        * **Feature Creation:** Engineered a binary `5G_flag` column (`Yes`/`No`) based on whether "5G" was mentioned in the model name.
    * The final, cleaned dataset was saved as `cleaned_smartphone_dataset.csv`.

### 3. Exploratory Data Analysis (EDA) & Key Insights

* **Tools:** **Jupyter Notebook** (`EDA_on_smartPhone.ipynb`), **Matplotlib**, and **Seaborn**.
* **Key Questions Answered:**
    * What is the distribution of smartphone prices?
    * Which brands have the highest market presence on Flipkart?
    * What is the relationship between features (RAM, ROM, Battery) and price?
    * How does 5G capability affect the price of a smartphone?
* **Major Findings:**
    1.  **Price is Driven by Specs:** A correlation heatmap revealed that **RAM** and **ROM** have the strongest positive correlation with price.
    2.  **Brand Power:** Premium brands like Apple and Samsung maintain high average prices, while brands like POCO, realme, and Motorola dominate the budget-to-mid-range segments.
    3.  **The 5G Premium:** Phones with 5G capability are significantly more expensive than their 4G counterparts, indicating that 5G is a major price driver.
    4.  **Market Skew:** The majority of smartphones listed fall within the ₹7,000 to ₹25,000 price bracket, highlighting the focus on the budget-conscious consumer.

### 4. SQL Analysis

* The cleaned dataset was loaded into a SQL database to perform complex queries and aggregations.
* **15 business-centric questions** were answered, including:
    * *What is the average price of a 5G phone for each brand?*
    * *Which top 5 phones have the highest number of reviews?*
    * *How many phones does each brand offer in the sub-₹15,000 category?*

### 5. Dashboard Visualization in Power BI

* The final dataset was imported into Power BI to create a rich, interactive dashboard.
* **Features of the Dashboard:**
    * **KPI Cards:** Average Price, Average Rating, Total Models.
    * **Filters (Slicers):** Users can dynamically filter the entire dashboard by Brand, RAM, ROM, and 5G availability.
    * **Visualizations:**
        * **Bar Chart:** Number of phones by brand.
        * **Scatter Plot:** Price vs. Average Rating to identify high-value models.
        * **Donut Chart:** 5G vs. 4G phone distribution.

---

## 🧗 Challenges & Learning Outcomes

This project presented several real-world challenges, leading to valuable learnings:

1.  **Challenge: Dynamic Web Content**
    * **Problem:** The XPath for the "Next" button on Flipkart was different for the first page compared to subsequent pages, breaking the pagination logic.
    * **Solution:** Implemented a conditional `if-else` statement to handle the two different XPaths, creating a robust scraper.
    .
2.  **Challenge: Data Redundancy**
    * **Problem:** The scraper was saving duplicate pages because the website displayed more page numbers than actual content pages (showed 100+, but only 43 were unique).
    * **Solution:** Manually identified the correct number of unique pages and hardcoded the loop limit to prevent scraping redundant data.
    .
3.  **Learning:** This project reinforced the importance of a structured workflow. By separating scraping, cleaning, and analysis into different scripts/notebooks, the project remained organized and easy to debug. It also provided deep practical experience in data transformation and feature engineering, which are crucial skills for any data analyst.

---

## 🚀 Future Scope

* **Price Prediction Model:** Build a machine learning regression model (e.g., XGBoost, Random Forest) to predict smartphone prices based on their features. The engineered features like `brand`, `RAM`, `ROM`, and `5G_flag` would be critical inputs.
* **Automated Scraping Pipeline:** Deploy the scraper on a cloud service (like AWS EC2) and schedule it to run daily to collect real-time data and track price fluctuations.
* **Sentiment Analysis:** Scrape user reviews for each phone and perform sentiment analysis to quantify public opinion about different models and brands.

---

## ⚙️ How to Run This Project Locally

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
    cd your-repository-name
    ```

2.  **Set Up a Virtual Environment (Recommended)**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
    ```

3.  **Install Dependencies**
    A `requirements.txt` file is included for easy setup.
    ```bash
    pip install -r requirements.txt
    ```

4.  **Download ChromeDriver**
    * Check your Google Chrome version.
    * Download the corresponding [ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/) and place it in your project directory or a known path.
    * Update the path to `chromedriver.exe` in the `webScreening.py` script.

5.  **Run the Scripts in Order**
    * **Scraping:** `python Scripts/webScreening.py`
    * **Notebooks:** Open and run the Jupyter Notebooks in the `Notebooks/` directory in numerical order (`1_...`, `2_...`, `3_...`).
    * **Dashboard:** Open the `.pbix` file in the `Dashboard/` folder using the Power BI Desktop application.

---

## 📫 Connect with Me

* **Author:** [Your Name]
* **LinkedIn:** [linkedin.com/in/your-profile](https://linkedin.com/in/your-profile)
* **GitHub:** [github.com/your-username](https://github.com/your-username)
