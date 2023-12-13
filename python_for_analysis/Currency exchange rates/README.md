# Data Gathering with Python - Currency Exchange Rate API:
## Overview
  This Python script allows you to gather currency exchange rate data from a public API. It uses the Currency Exchange Rate API to fetch real-time exchange rates for various currencies.

## What is API (Application Programming Interface):
  API, is a set of rules and tools that allows different software applications to communicate with each other. It defines the methods and data formats that applications can use to request and exchange information. APIs play a crucial 
  role in modern software development by enabling the integration of different services and systems.

### Uses of API in Daily Life Apps:
  1. **Financial Apps:** Banking and financial apps use APIs to access account information, perform transactions, and integrate with other financial services.
  2. **Maps and Navigation:** Apps like Google Maps use APIs to provide location-based services and directions.
  3. **E-commerce:** Online shopping apps frequently use APIs to connect with payment gateways and retrieve product information from inventory systems.

## Tables of Contents:
- Getting Started
  - Prerequisites
  - Installation
- Usage
- API Documentation
- Example
- Contributing
- License
- Contact

## Getting Started
### Prerequisites:
Before using this script, make sure you have the following
    
  - Python 3.x installed on your machine.
  - An internet connection to fetch data from the API.

## Installation
1. Clone the repository
   ```pyt
    git clone http://github.com/yourusername.....
    cd current-exchange-api
   ```

2. Installed the required packages:
   ``` pyt
   import request
   import json()
   ```

## Usage
   Run the Python script to fetch the latest currency exchange rates. You can integrate this script into your projects or use it as a standalone tool. ( Here I am using Public API (free one) so it is not showing many features of the API).

## API Documentation
   We will use an API containing currency exchange rates as published by the European Central Bank
   Documentation at https://exchangeratesapi.io

## Example
   Here is a simple example of how to use the data fetched by the script:

```python
# loading the packages
# requests provides us with the capabilities of sending an HTTP request to a server
import requests
# Define the base URL
base_url = "https://api.exchangeratesapi.io/latest"
# We can make a GET request to this API endpoint with requests.get
response = requests.get(base_url)
# Checking if the request went through ok
response.ok
response.json()
```
## Contributing
  If you'd like to contribute to this project, feel free to fork the repository and submit a pull request. Contributions are welcome!

## Author
  Shamreen Tabassum
  For any questions or issues, please contact https://www.linkedin.com/in/shamreen-tabassum-ab56a2247/.
  
   
