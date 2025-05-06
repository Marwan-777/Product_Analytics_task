<code>
# Product Analytics Task

## Overview
Welcome to the **Product Analytics Task** repository! This project contains a complete solution to a product analytics challenge provided by Instabug. The goal is to analyze user behavior and product usage by leveraging CSV data, SQL queries, and a simple Python script.

## Repository Structure
```
├── Companies.csv              # Company-level metadata
├── Companies_members.csv      # Mapping of companies to their members
├── Members_visits.csv         # Detailed visit logs for each member
├── Product Analytics Task.pdf # Statement and requirements of the analytics challenge
├── README.md                  # This file
├── my MySQL query.sql         # SQL solution for data querying and aggregation
└── my_script.py               # Sample Python script illustrating basic setup
```

## Datasets
- **Companies.csv**  
  Contains one row per company, including company identifiers and relevant attributes.
- **Companies_members.csv**  
  Maps each company to its list of members (user IDs).
- **Members_visits.csv**  
  Holds detailed logs of member activity and visits, including timestamps and event types.

## Solution Components
1. **Product Analytics Task.pdf**  
   The challenge description, detailing the business questions and metrics to compute.
2. **my MySQL query.sql**  
   A set of SQL statements that:
   - Join the three CSV-based tables.
   - Compute key product analytics metrics (e.g., active users, churn rate, session counts).
   - Produce aggregated summaries at both member and company levels.
3. **my_script.py**  
   A minimal Python script demonstrating environment setup:
   ```python
   import pandas as pd

   # Entry point
   if __name__ == "__main__":
       print("hello")
   ```
   *Dependencies*: pandas

## Installation & Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Product_Analytics_task.git
   cd Product_Analytics_task
   ```
2. (Optional) Create and activate a Python virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate   # macOS/Linux
   venv\Scripts\activate      # Windows
   ```
3. Install Python dependencies:
   ```bash
   pip install pandas
   ```
4. Ensure you have MySQL (or compatible) installed and configured with access to load CSV files.

## Usage

### Running the Python Script
The provided `my_script.py` is a template for further analysis.
```bash
python my_script.py
```
This will print `hello` to the console. You can extend this script to load CSVs with pandas and perform data exploration or modeling.

### Executing the SQL Queries
1. Open your MySQL client or GUI tool.
2. Create a database (if not already existing):
   ```sql
   CREATE DATABASE product_analytics;
   USE product_analytics;
   ```
3. Load the CSV files into tables named `companies`, `company_members`, and `member_visits`.
4. Run:
   ```sql
   SOURCE my\ MySQL\ query.sql;
   ```
   This will execute the full analytics pipeline and output the required metrics.

## Key Metrics Computed
- **Daily/Monthly Active Users (DAU/MAU)**
- **Retention & Churn Rates**
- **Average Sessions per User**
- **Company-level adoption & usage trends**

## Contributing
Contributions are welcome! Feel free to open issues or submit pull requests for:
- Enhanced data visualizations
- Additional analytics insights
- Integration with BI tools

## License
This repository is provided under the MIT License. See `LICENSE` for details.

## Contact
For questions or clarifications, please reach out to the Instabug analytics team or file an issue in this repository.
</code>

<requirements>
</requirements>