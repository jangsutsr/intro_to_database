"""
Columbia W4111 Intro to databases
Homework 2
"""

import sys
from collections import *

def load_data(file_path):
  """
  This method reads the dataset, and returns a list of rows.
  Each row is a list containing the values in each column.
  """
  import csv
  with file(file_path) as f:
    dialect = csv.Sniffer().sniff(f.read(2048))
    f.seek(0)
    reader = csv.reader(f, dialect)
    return [l for l in reader]


def q1(data):
    """
    @param data the output of load_data()
    @return the number of  distinct types of items (by `description` attribute) in this dataset
    """
    # Try using set for this question (https://docs.python.org/2/tutorial/datastructures.html)
    description = data[0].index('DESCRIPTION')
    types = set()
    for i in range(1, len(data)):
        types.add(data[i][description])
    return len(types)

def q2(data):
    """
    @param data the output of load_data()
    @return the number of  distinct `vendor`s (by exact string comparison) in this dataset
    """
    # Try using set for this question (https://docs.python.org/2/tutorial/datastructures.html)
    description = data[0].index('VENDOR')
    types = set()
    for i in range(1, len(data)):
        types.add(data[i][description])
    return len(types)

def q3(data):
    """
    @param data the output of load_data()
    @return the value of the `store` attribute (the id) of the store that had the most sales (as defined by bottle qty)
    """
    # Try using dictionaries for this question, and make use of the sorted function available for list and dictionaries
    # https://docs.python.org/2/tutorial/datastructures.html
    stores = {}
    store_ind = data[0].index('STORE')
    sales_ind = data[0].index('BOTTLE QTY')
    for i in range(1, len(data)):
        sale_to_add = int(data[i][sales_ind])
        store_to_add = data[i][store_ind]
        if store_to_add in stores:
            stores[store_to_add] += sale_to_add
        else:
            stores[store_to_add] = sale_to_add
    max_ind = -float('Inf')
    max_store = None
    for name in stores:
        if stores[name] > max_ind:
            max_ind = stores[name]; max_store = name
    return max_store

def q4(data):
    """
    @param data the output of load_data()
    @return The value of the `description` attribute of the most sold item from the store from q3()
    """
    # Try using dictionaries for this question, and make use of the sorted function available for list and dictionaries
    # https://docs.python.org/2/tutorial/datastructures.html
    best_sale_stores = q3(data)
    store_ind = data[0].index('STORE')
    des_ind = data[0].index('DESCRIPTION')
    sales_ind = data[0].index('BOTTLE QTY')
    result = []
    for i in range(1, len(data)):
        if data[i][store_ind] == best_sale_stores:
            result.append([data[i][des_ind], int(data[i][sales_ind])])
    result.sort(key=lambda x: x[1], reverse=True)
    output = [result[0][0]]
    for i in range(1, len(result)):
        if result[i][1] == result[i-1][1]:
            output.append(result[i][0])
        else:
            break
    return output

def q5(data):
    """
    Finds the `zipcode` that has the greatest total `bottle_qty` for `category_name` "TEQUILA"
    @param data the output of load_data()
    @return The value of the `zipcode` attribute with the most sales in "TEQUILA" category
    """
    # Try using dictionaries for this question, and make use of the sorted function available for list and dictionaries
    # https://docs.python.org/2/tutorial/datastructures.html
    cat_ind = data[0].index('CATEGORY NAME')
    sales_ind = data[0].index('BOTTLE QTY')
    zip_ind = data[0].index('ZIPCODE')
    zips = {}; sales = []
    for i in range(1, len(data)):
        if data[i][cat_ind] == 'TEQUILA':
            sale_to_add = int(data[i][sales_ind])
            zip_to_add = data[i][zip_ind]
            if sale_to_add in zips:
                zips[sale_to_add].append(zip_to_add)
            else:
                zips[sale_to_add] = [zip_to_add]
                sales.append(sale_to_add)
    return zips[max(sales)]

if __name__ == '__main__':
  if len(sys.argv) != 2:
    sys.stderr.write("Usage: python hw2.py (path to input csv)\n")
    sys.exit(1)
  file_path = sys.argv[1]

  data = load_data(file_path)
  print q1(data)
  print q2(data)
  print q3(data)
  print q4(data)
  print q5(data)
