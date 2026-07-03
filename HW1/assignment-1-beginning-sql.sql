--
-- Name: Fanizza Tahir
--
-- Write your queries below each comment. Please use good style (one clause
-- per line, JOIN syntax, indentation) and make sure all queries end with a
-- semicolon. When necessary, limit the output to the first 200 results.
--
-- DO NOT MODIFY OR DELETE ANY OTHER LINES!
--

.headers on
.mode tabs

-- ------------------------------------------------------------------------------
-- Part 1: Employees Database
-- ------------------------------------------------------------------------------

--
.print "\nQuery #1"
--
-- Show the names and dates hired of all employees who were a manager
-- at some point.
--
-- Schema: dept_name, first_name, last_name, hire_date
--  Order: dept_name, last_name, first_name

-- SELECT: This tells the database what columns to pick and output.
SELECT dept.dept_name, emp.first_name, emp.last_name, emp.hire_date

-- FROM: This tells the database to start looking through the employees table.
FROM employees emp

-- JOIN: This connects the employees to the manager list using their ID numbers.
JOIN dept_manager mgr ON emp.emp_no = mgr.emp_no

-- JOIN: This connects the manager list to the Department names.
JOIN departments dept ON mgr.dept_no = dept.dept_no

-- ORDER BY: This sorts the final list in a way that the hw requested.
ORDER BY dept.dept_name, emp.last_name, emp.first_name;

--
.print "\nQuery #2"
--
-- For each department, list the total number of employees who have
-- worked at any time.
--
-- Schema: dept_name, emp_count
--  Order: dept_name

-- SELECT: This tells the database to pick the department name and then count the employees in that department.
SELECT dept.dept_name, COUNT(work.emp_no) AS emp_count

-- FROM: This tells the database to start looking through the departments table.
FROM departments dept

-- JOIN: This connects the department names to the employees table.
JOIN dept_emp work  ON dept.dept_no = work.dept_no

-- GROUP BY:  This tells the database to calculate the count for each department in the company.
GROUP BY dept.dept_name

-- ORDER BY: This sorts the final list in a way that the hw requested.
ORDER BY dept.dept_name;


--
.print "\nQuery #3"
--
-- List all employees who worked in the Research department on
-- November 20, 1985 (the day that Microsoft Windows launched)
-- and who were born before the year 1960.
--
-- Schema: emp_no, from_date, to_date, birth_date, first_name, last_name
--  Order: emp_no

-- SELECT: This tells the database what colums to pick and show.
SELECT emp.emp_no, work.from_date, work.to_date, emp.birth_date, emp.first_name, emp.last_name

-- FROM: This tells the database to start looking through the employees table.
FROM employees emp

-- JOIN: This connects the employees to the department history table in order to track their history working with their department(s).
JOIN dept_emp work ON emp.emp_no = work.emp_no

-- JOIN: This connects the history created by the previous query to the actual department names.
JOIN departments dept ON work.dept_no = dept.dept_no

-- WHERE: This filters the rows to only find the "Research" team from Nov 20, 1985 and show only employees that were born before 1960.
WHERE dept.dept_name = 'Research' AND work.from_date <= '1985-11-20' AND work.to_date >= '1985-11-20' AND emp.birth_date < '1960-01-01'

-- ORDER BY: This sorts the final list in a way that the hw requested.
ORDER BY emp.emp_no
LIMIT 200;

--
.print "\nQuery #4"
--
-- List all employees who ever worked for the Development department
-- as Engineers or Senior Engineers.
--
-- Schema: emp_no, first_name, last_name, gender, title
--  Order: emp_no

-- SELECT: This tells the database what colums to pick and show.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.gender, ti.title

-- FROM: This tells the database to start looking through the employees table.
FROM employees emp

-- JOIN: This connects the employees to their job titles.
JOIN titles ti ON emp.emp_no = ti.emp_no

-- JOIN: This connects the employees to the department history table in order to track their history working with their department(s).
JOIN dept_emp work ON emp.emp_no = work.emp_no

-- JOIN: This connects the history created by the previous query to the actual department names.
JOIN departments dept ON work.dept_no = dept.dept_no

-- WHERE: This filters the rows to only find the "Development" team and their work titles.
WHERE dept.dept_name = 'Development' AND ti.title IN ('Engineer', 'Senior Engineer')

-- ORDER BY: This sorts the final list in a way that the hw requested.
ORDER BY emp.emp_no
LIMIT 200;

-- ------------------------------------------------------------------------------
-- Part 2: World Database
-- ------------------------------------------------------------------------------

--
.print "\nQuery #5"
--
-- What cities in the database have a population over 3 million?
--
-- Schema: Population, CityName, District, CountryName, Continent
--  Order: Population

-- SELECT: This tells the database what colums to pick and show.
SELECT c.Population, c.Name AS CityName, c.District, con.Name AS CountryName, con.Continent

-- FROM: This tells the database to start looking through the city table.
FROM city c

-- JOIN: This connects the city to the country table to get the country's name and continent.
JOIN country con ON c.CountryCode = con.Code

-- WHERE: This filters the rows to find only the cities that have more than 3 million people.
WHERE c.Population > 3000000

-- ORDER BY: This sorts the final list in a way that the hw requested.
ORDER BY c.Population;

--
.print "\nQuery #6"
--
-- Which countries have the majority (over half) of their population
-- living in the capital city?
--
-- Schema: CityName, CityPopulation, CountryName, CountryPopulation
--  Order: CountryName, CityName

-- SELECT: This tells the database what columns to pick and show.
SELECT c.Name AS CityName, c.Population AS CityPopulation, con.Name AS CountryName, con.Population AS CountryPopulation

-- FROM: This tells the database to start looking through the country table.
FROM country con 

-- JOIN: This connects each country to its capital city.
JOIN city c ON con.Capital = c.ID

-- WHERE: This filters for the countries that have a city population over half the country population.
WHERE c.Population > (con.Population / 2)

-- ORDER BY: This sorts the final list by Country Name and City Name.
ORDER BY con.Name, c.Name;

--
.print "\nQuery #7"
--
-- Which countries have Spanish as an official language? Also calculate
-- the number of Spanish speakers by multiplying the population and the
-- percentage, rounded to the nearest integer.
--
-- Schema: Name, LocalName, Region, Population, Percentage, Speakers
--  Order: Speakers

-- SELECT: This picks the country details and calculates the Spanish speakers (rounded).
SELECT con.Name, con.LocalName, con.Region, con.Population, lang.Percentage, ROUND(con.Population * (lang.Percentage / 100)) AS Speakers

-- FROM: This tells the database to start looking through the country table.
FROM country con 

-- JOIN: This connects the countries to their respective languages.
JOIN countrylanguage lang ON con.Code = lang.CountryCode

-- WHERE: This filters for countries that have Spanish as their official language
WHERE lang.Language = 'Spanish' AND lang.IsOfficial = 'T'

-- ORDER BY: This sorts the final list by the number of speakers.
ORDER BY Speakers;

--
.print "\nQuery #8"
--
-- How many languages are spoken in each country? The count should
-- include both official and unofficial languages.
--
-- Schema: Name, Region, Languages
--  Order: Languages (descending), Name (ascending)

-- SELECT: This tells the database what colums to pick and show.
SELECT con.Name, con.Region, COUNT(lang.Language) AS Languages

-- FROM: This tells the database to start looking through the country table.
FROM country con 

-- JOIN: This connects countries to the countrylanguage table.
JOIN countrylanguage lang ON con.Code = lang.CountryCode

-- GROUP BY: This tells the database to calculate the language count for each country.
GROUP BY con.Name, con.Region

-- ORDER BY: This sorts the Languages from highest to lowest. Same for country name.
ORDER BY Languages DESC, con.Name ASC
LIMIT 200;
