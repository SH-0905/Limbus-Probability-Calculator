# Limbus Company Clash Probability Calculator

A desktop application built with Python, SQL, and a 3-tier layered architecture that calculates and simulates skill clash probabilities for Limbus Company characters.

## Getting Started

### Prerequisites
* Python 3.x installed
* MySQL Server installed and running locally

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/SH-0905/Limbus-Probability-Calculator.git
   cd limbus-calculator
   
2. **Install Dependencies:**
   ```bash
   pip install -r requirements.txt
   
3. **Initialize Database:**  
   1. Open MySQL Workbench and connect to your server.
   2. Select File > Open SQL Script... and choose limbus.sql.
   3. Click the Execute (Lightning Bolt) icon to run the script.

4. **Run the Application:**
   ```bash
   python GUI.py
   ```
   *Enter your local MySQL username and password to establish connection.*

