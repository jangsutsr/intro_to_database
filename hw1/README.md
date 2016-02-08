# Homework 1

* Assigned: 2/4
* Due: 2/11 8:40 AM in class
* Value: 3.75% of your grade


# 1. (10 points) Database Design: UniDB


You will design a database for an ivy league university (of some sort). 
This database will include information about departments, professors, and courses (and their offerings):

* Information about **professors** includes their SSN and name. The SSN of a professor
is assumed to be unique, not shared by any other professor. Each professor
is either a **junior professor** or a **tenured professor**. 

  * Each professor must be in one category or the other, and cannot be in both categories simultaneously.
  * For junior professors, we record the number of years since they were hired. 
  * For tenured professors, we record the year in which they earned tenure.

* Information about **departments** includes their name. The name of a department
  is assumed to be unique, not shared by any other department.

* We need to be able to associate professors with the departments with which they
  are affiliated. Each professor has to be affiliated with at least one department.

* Each department has exactly one **chairperson**, which has to be a tenured professor.
  You do not need to model the fact that the chairperson of a department
  has to be affiliated with the department.

* Information about a course includes its number (e.g., "4111"), name (e.g.,
  "Introduction to Databases"), and capacity (e.g., 140). 
  We also need to be able to know the unique department that owns each course: 
  no cross-listing of courses across departments is allowed, and every course is 
  owned by exactly one department. 

  * **Note/hint**: you cannot assume that course number uniquely identifies a course; in fact, you
    cannot assume even that course number together with course name uniquely
    identify a course. However, course number uniquely identifies courses within a
    department.

* Finally, we need to record all **terms** -- identified as semester (e.g., "spring") and
  year (e.g., "2015") -- in which each course has been offered in the history of the
  university, and what professor(s) taught each course offering. Assume that a
  course offering might be associated with zero or more professors: a course might
  be taught in some term by a grad student, which we will not model in our
  design; it’s also OK for a course offering to be co-taught by multiple professors.
  Assume that a course is offered at most once during each term. In other words,
  a course cannot have multiple sections during one term. Finally, assume that a
  professor can teach courses “owned” by departments with which the professor is
  not affiliated.

Your Task: Render the university database in the version of the
E/R model that we studied in class, with exactly the constraints and requirements
specified above. 

* Please state any assumptions that you make, but make sure that
  you don’t introduce new constraints that are not listed in the problem definition.
* Show the SQL CREATE TABLE statements needed to convert your E/R diagram into a relational schema. If your translation cannot capture any of the
  constraints in the E/R diagram, explain why.
* **Note/hint**: a weak entity set is a “regular” entity set in that it can
  participate in relationship sets other than the identifying relationship set, just as any
  other entity set.


# 2. (5 points) More Database Design


Go to [reddit.com](http://www.reddit.com) and analyze the front page and comments (each line has an `XXX comments` link)
pages to understand its data requirements.  Then, 

* design an E-R diagram for the website that captures its main functionality of posts, and comments.
* Include at least 4 entities, 4 relationships, and 3 constraints, in the same format as part 1 of this homework.
  * 2 of the entities should be **posts** and **comments**.  You are free to choose the other two.
* For each entity, relationship and constraint, include a 1-2 sentence description that justifies your decision to
  include it and design it in the matter that you did.
