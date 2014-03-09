-- Prompt

/* In a SQL db, you have two tables, an employee table and a department table. 
Employees belong to only one department. Given a department name, find all the
employees underneath it with a SQL query. */

-- Polaris's solution

-- Pretty straightforward.

SELECT
  employees.*
FROM
  employees employee
JOIN
  departments department ON employee.department_id
WHERE
  department.name = ?