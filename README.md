# Robot Framework Automation Project

## 📌 Overview

This project combines Web Automation and API Automation using Robot Framework. 
The repository structure consists of `tests`, `keywords`, and `resources` that support flexible automation testing.

## 🛠️ Prerequisites

Before running this project, make sure you have installed:

- Python 3.12 or the latest version
- Poetry for dependency management
- Allure Report for test result reporting (on development)

## 📦 Installation

Clone this repository:

```sh
git clone https://github.com/teukuarinal/robot-gherkin-style.git
cd robot-gherkin-style
```

Install dependencies using Poetry:

```sh
poetry install
```

## 🚀 Running Tests

### Test Format

To run tests, use the following format:

```sh
poetry run test [tags]
```

### API Automation

Run all API tests:

```sh
poetry run test api
```

Run a specific API test with a tag (e.g: get_user):

```sh
poetry run test get_user
```

### Web Automation

Run all Web tests:

```sh
poetry run test web
```

Run a specific Web test with a tag (e.g: checkout):

```sh
poetry run test checkout
```

## 📊 Viewing Test Reports (on development)

After running the tests, you can view the report with:

```sh
poetry run allure serve output
```

## 📂 Project Structure

```sh
robot-project/
│-- output/                 # Test execution results
│-- reports/                # Test result reports
│-- robot_project/
│   ├── drivers/            # ChromeDriver management
│   ├── resources/
│   │   ├── keywords/       # Collection of keywords for API & Web
│   │   ├── payloads/       # JSON for API request bodies
│   │   ├── schemas/        # JSON Schema for response validation
│   │   ├── variables/      # Global variables for tests
│-- tests/
│   ├── api/                
│   │   ├── api.robot       # API test cases
│   ├── web/                
│   │   ├── checkout.robot  # Checkout flow test cases
│   │   ├── login.robot     # Login flow test cases
│-- run_tests.py            # Script to run tests
│-- pyproject.toml          # Poetry configuration
```
