--
-- Name: TYPE YOUR NAME HERE
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


--
.print "\nQuery #2"
--
-- For each department, list the total number of employees who have
-- worked at any time.
--
-- Schema: dept_name, emp_count
--  Order: dept_name


--
.print "\nQuery #3"
--
-- List all employees who worked in the Research department on
-- November 20, 1985 (the day that Microsoft Windows launched)
-- and who were born before the year 1960.
--
-- Schema: emp_no, from_date, to_date, birth_date, first_name, last_name
--  Order: emp_no


--
.print "\nQuery #4"
--
-- List all employees who ever worked for the Development department
-- as Engineers or Senior Engineers.
--
-- Schema: emp_no, first_name, last_name, gender, title
--  Order: emp_no


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


--
.print "\nQuery #6"
--
-- Which countries have the majority (over half) of their population
-- living in the capital city?
--
-- Schema: CityName, CityPopulation, CountryName, CountryPopulation
--  Order: CountryName, CityName


--
.print "\nQuery #7"
--
-- Which countries have Spanish as an official language? Also calculate
-- the number of Spanish speakers by multiplying the population and the
-- percentage, rounded to the nearest integer.
--
-- Schema: Name, LocalName, Region, Population, Percentage, Speakers
--  Order: Speakers


--
.print "\nQuery #8"
--
-- How many languages are spoken in each country? The count should
-- include both official and unofficial languages.
--
-- Schema: Name, Region, Languages
--  Order: Languages (descending), Name (ascending)
