# Homework 2

* Assigned: 2/18
* Due: 3/1 at 8:40am
* worth 3.75% of your grade


We want to emphasize that we have picked this dataset for educational purposes
and are not encouraging you to drink.


# 1. Analyze some data

**(2 points each, 10 points total)**

You will be using the same subset of the Iowa Liquor Dataset from [hw0](https://github.com/w4111/hw0/blob/master/README.md) and 
writing some Python programs to perform data analysis to understand transaction and inventory information.

You will write your code in [`hw2.py`](./hw2.py) found in this same directory.  
This file contains predefined methods such as [`def q1()`](./hw2.py#L22) with dummy method bodies that you
will fill in to answer the corresponding questions below.
We have also included a [`load_data()`](./hw2.py#L9) function so you can pass in the file path to the dataset 
and it will read the file and return a python `list`.  Try running it and printing the first couple of 
list elements to see what the method returns.

Run the program with:

        python hw2.py (path to iowa-liquor-sample.csv)


### Questions To Answer

* **Q1**: How many distinct types of items (by `description` attribute) are in this dataset?
  * `q1()` should return a single number.

* **Q2**: How many distinct `vendor`s (by exact string comparison) are in this dataset?
  * `q2()` should return a single number.

* **Q3**: Which `store` had the most sales (in terms of total `bottle_qty`)?
  * `q3()` should return a single number of the `store`'s id.

* **Q4**: At the `store` with the most sales (answer to Q3), what was the most sold item by `description` (the item that had the highest total `bottle_qty`)?
  * `q4()` should return a single string that corresponds to the `description` attribute's value.

* **Q5**:  Find the `zipcode`, with the greatest total `bottle_qty` for `category_name` TEQUILA.
  * `q5()` should return a single number that corresponds to the `zipcode` attribute’s value.



# 2. Relational Algebra

**(2 points each, 4 points total)**

        liquors(<u>lid</u>, name, price, manufacturer)
        sales(<u>month</u>, <u>seller</u>, <u>liquors</u>, county, quantity)

Given the simplified schema above (primary keys are surrounded by &lt;u> &lt;/u> tags), construct relational algebra for the following queries. Note: sales(liquors) references liquors(lid).

* **Q1**: Find the names of liquors that had at least one sale in both "Polk" and "Linn" counties for the month of December.

* **Q2**: Find the names of manufacturers that sold at least two different liquors during any January in "Polk" county.



# 3. More Relational Algebra

**(1 point each, 6 points total)**

Given the following tables


T1

|A | B | C |  
|---|---|---|
|1 | x | a |
|2 | y | b |
|3 | z | b | 

T2

A | B | D
---|---|---
1 | x | c
3 | y | a
3 | x | a


Express the results for the relational algebra expressions:


1. π<sub>B,D</sub>(T2)
1. T2 × π<sub>A</sub>(T2)
1. T1 ⨝<sub>T1.C=T2.D</sub> T2 
1. T1 − (T1 − T2)
1. (removed please ignore)
1. T1 ⨝ (σ<sub>D=x</sub>(T2))



# Submission

Submit through [courseworks](https://courseworks.columbia.edu/portal/site/COMSW4111_001_2015_3)

1. Submit `hw2.py` for part 1
1. Submit a text file/pdf for part 2 and part 3 

Include your name and UNI at the top of each page.


# Hints

* What does the `data` argument to the question functions contain? In `q1()`, try adding `print data[0]; print data[1]`
* Test your code on a small sample of data, so you can verify that it works before running it on the entire file.
* Importing the csv file into Google Sheets or Excel might help visually explore the data.
* Helper functions can make your code easier to understand. E.g to help refer to the columns by name instead of by position.
* Python dictionaries are very very useful.
