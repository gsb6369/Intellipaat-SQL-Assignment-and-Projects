CREATE DATABASE Assignment_SQL;

CREATE TABLE STUDIES (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

SELECT * FROM STUDIES

INSERT INTO STUDIES values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);

CREATE TABLE SOFTWARE (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

SELECT * FROM SOFTWARE

INSERT INTO SOFTWARE values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

CREATE TABLE PROGRAMMER (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

SELECT * FROM PROGRAMMER

INSERT INTO PROGRAMMER values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

--1. Find out the selling cost AVG for packages developed in Pascal.
Select Avg(scost) as avg_of_scost from SOFTWARE where DEVELOPIN='pascal'

--2. Display Names, Ages of all Programmers.
Select Pname,DATEDIFF(yy,dob,GETDATE()) as age from programmer

--3. Display the Names of those who have done the DAP Course.
Select PNAME,COURSE from studies where course='dap'

--4. Display the Names and Date of Births of all Programmers Born in January
Select PNAME,DOB from programmer where month(dob)=1

-- 5.What is the Highest Number of copies sold by a Package
Select max(SOLD) as Max_Sold from software

--6. Display lowest course Fee.
Select Min(Course_Fee) as Low_Fee from studies

--7. How many programmers done the PGDCA Course
Select COUNT(Course)as PGDCA_Programers from Studies where COURSE='PGDCA'

--8.How much revenue has been earned thru sales of Packages Developed in C.
Select sum(scost*sold) as Revenue from software where DEVELOPIN='C'

--9. Display the Details of the Software Developed by Ramesh.
Select * from software where PNAME = 'Ramesh'

--10. How many Programmers Studied at Sabhari
Select Count(PNAME) from studies where INSTITUTE = 'Sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark.
Select title,sum(scost*sold)  from software group by title having sum(scost*sold)>2000

--12. Display the Details of Packages for which Development Cost have been recovered.
Select * from software where DCOST<SCOST

--13. What is the cost of the costliest software development in Basic?
Select Max(Dcost), Title from software where DEVELOPIN ='basic'group by Title

--14. How many Packages Developed in DBASE?
Select Count(Pname)as Packages from software where DEVELOPIN='DBASE'

--15. How many programmers studied in Pragathi?
Select Count(PNAME) from studies where INSTITUTE = 'Pragathi'

--16. How many Programmers Paid 5000 to 10000 for their course?
Select Count(*) from Studies where COURSE_FEE between 5000 and 10000

--17. What is AVG Course Fee
Select AVG(Course_Fee) from Studies

--18. Display the details of the Programmers Knowing C.
Select * from programmer where PROF1='C' or PROF2='C'

--19. How many Programmers know either COBOL or PASCAL.
Select COUNT(1) from programmer where Prof1='COBOL' or PROF1='PASCAL' or PROF2 = 'COBOL' or PROF2 = 'PASCAL'

--20. How many Programmers Don’t know PASCAL and C
Select Count(1) from programmer where Prof1<>'C' or PROF1<>'PASCAL' and PROF2 <> 'C' or PROF2 <> 'PASCAL'
Select COUNT(1) from programmer where not  (Prof1='C' and PROF1='PASCAL' or PROF2 = 'C' and PROF2 = 'PASCAL')

--21. How old is the Oldest Male Programmer.
Select MAX(DATEDIFF(YY,DOB,GetDate())) from programmer where GENDER='M'

--22. What is the AVG age of Female Programmers
Select Avg(Datediff(YY,DOB,Getdate())) from programmer where GENDER='F'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
select DATEDIFF(YY,DOJ,getdate()) as Experience ,PNAME from programmer order by  PNAME  desc

--24.Who are the Programmers who celebrate their Birthday’s During the Current Month?
select PNAME from programmer where DATEPART(month,current_timestamp)=DATEPART(month,DOB)

--25.How many Female Programmers are there?
Select COUNT(1) from programmer where GENDER='F'

--26. What are the Languages studied by Male Programmers.
Select Prof1 as Languages from programmer union 
Select Prof2 as Languages from programmer where GENDER='M'

--27. What is the AVG Salary?
Select AVG(Salary) as [Average Salary] from programmer

--28. How many people draw salary 2000 to 4000?
Select Count(1) as [Count] from programmer where 2000<Salary and Salary<4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
Select * from programmer where Prof1<>'CLIPPER' AND PROF1<>'COBOL' AND PROF1<>'PASCAL'
AND
Prof2<>'CLIPPER' AND PROF2<>'COBOL' AND PROF2<>'PASCAL'

--30. Display the Cost of Package Developed By each Programmer.
Select PNAME,sum(Dcost) as [Development Cost] from software group by Pname

--31.Display the sales values of the Packages Developed by the each Programmer.
Select PNAME,sum(scost*sold) as [Sales Value] from software group by Pname

--32.Display the Number of Packages sold by Each Programmer.
Select Pname,Sum(Sold) as [No. of Packages Sold ] from Software group by Pname

--33. Display the sales cost of the packages Developed by each Programmer Language wise.
Select PNAME, DEVELOPIN, sum(scost*sold) as SALES_COST FROM software group by Pname, DEVELOPIN order by PNAME

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
Select Developin, Avg(Dcost) as AVG_DCOST, Avg(Scost*Sold) as AVG_SCOST,Avg(SCOST) AS AVG_PRICE_PER_COPY 
from software group by DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
Select Pname, Max(Dcost) as COSTLIEST_PACKAGE, Min(Dcost) as CHEAPEST_PACKAGE from software group by PNAME

--36. Display each institute name with number of Courses, Average Cost per Course.
Select INSTITUTE, Count(Course) as NO_OF_COURSES, Avg(COURSE_FEE) AS AVERAGE_COST_PER_COURSE
from Studies group by INSTITUTE

--37. Display each institute Name with Number of Students.
Select Institute, Count(Pname) as NUMBER_OF_STUDENTS from studies group by Institute

--38. Display Names of Male and Female Programmers. Gender also.
Select Pname, GENDER from programmer

--39. Display the Name of Programmers and Their Packages.
Select Pname, Salary from programmer

--40.Display the Number of Packages in Each Language Except C and C++.
Select Prof1 as Languages,Count(Prof1) as NUMBER_OF_PACKAGES from programmer where prof1<>'C' and Prof1<>'CPP' group by PROF1
Union
Select Prof2 as Languages,Count(Prof2) as NUMBER_OF_PACKAGES from programmer where prof2<>'C' and Prof2<>'CPP' group by PROF2
Select COUNT(1) as [NUMBER OF PACKAGES], Prof1 as Languages from programmer where prof1<>'C' and PROF1<>'cpp' group by prof1
union 
Select COUNT(1)as [NUMBER OF PACKAGES], Prof2 as Languages from programmer where prof2<>'C' and PROF2<>'cpp' group by prof2
Select * from programmer

--41.Display the Number of Packages in Each Language for which Development Cost is less than 1000
Select DEVELOPIN, TITLE from SOFTWARE where DCOST<1000

--42.Display AVG Difference between SCOST, DCOST for Each Package
SELECT TITLE, AVG(SCOST - DCOST) AS AVG_DIFF FROM SOFTWARE GROUP BY TITLE

--43.Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered
SELECT PName, SUM(SCOST) as TOTAL_SCOST, SUM(DCOST) as TOTAL_DCOST, SUM(DCOST-(SOLD*SCOST)) as AMT_to_be_Recovered FROM SOFTWARE GROUP BY PNAME HAVING SUM(DCOST)>SUM(SOLD*SCOST)

--44.Display Highest, Lowest and Average Salaries for those earning more than 2000
Select MAX(SALARY) as MAX_SAL, MIN(SALARY) as MIN_SAL, AVG(SALARY) as AVG_SAL from PROGRAMMER where SALARY>2000

--45.Who is the Highest Paid C Programmers
SELECT PNAME FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C')

--46.Who is the Highest Paid Female COBOL Programmer
SELECT PNAME FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL'))AND GENDER LIKE 'F'

--47.Display the names of the highest paid programmers for each Language
SELECT PNAME, PROF1, PROF2, MAX(SALARY) as Highesh_Paid FROM PROGRAMMER GROUP BY PNAME, PROF1, PROF2

--50.Which Language is known by only one Programmer
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1
UNION SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER)
AND COUNT(PROF2)=1;

--53.Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE
SELECT * FROM PROGRAMMER WHERE GENDER LIKE 'F' AND SALARY >3000 AND (PROF1 NOT IN('C','C++','ORACLE','DBASE')
OR PROF2 NOT IN('C','C++','ORACLE','DBASE'))

--54.Which Institute has most number of Students
SELECT INSTITUTE FROM STUDIES GROUP BY INSTITUTE HAVING COUNT(INSTITUTE)= (SELECT MAX(COUNT(INSTITUTE))
FROM STUDIES GROUP BY INSTITUTE)

--55.What is the Costliest course
SELECT COURSE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES)

--56.Which course has been done by the most of the Students
SELECT COURSE FROM STUDIES GROUP BY COURSE HAVING COUNT(COURSE)=(SELECT MAX(COUNT(COURSE)) FROM STUDIES
GROUP BY COURSE)

--57. Which Institute conducts costliest course
SELECT INSTITUTE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES) GROUP BY INSTITUTE

--58.Display the name of the Institute and Course, which has below AVG course fee
SELECT INSTITUTE,COURSE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES)

--59.Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
SELECT COURSE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) AND COURSE_FEE > (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES)

--60.Which package has the Highest Development cost
SELECT TITLE, DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)

--61.Which course has below AVG number of Students
SELECT COURSE FROM STUDIES HAVING COUNT(PNAME)<(SELECT AVG(COUNT(PNAME)) FROM STUDIES GROUP BY COURSE)

--62.Which Package has the lowest selling cost
SELECT TITLE, SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE)

--63.Who Developed the Package that has sold the least number of copies
SELECT PNAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE)

--64.Which language has used to develop the package, which has the highest sales amount
SELECT DEVELOPIN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)

--65.How many copies of package that has the least difference between development and selling cost where sold
SELECT SOLD,TITLE FROM SOFTWARE WHERE TITLE = (SELECT TITLE FROM SOFTWARE WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE))

--66.Which is the costliest package developed in PASCAL
SELECT TITLE FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL')

--67.Which language was used to develop the most number of Packages
SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN HAVING MAX(DEVELOPIN) = (SELECT MAX(DEVELOPIN) FROM SOFTWARE)

--68.Which programmer has developed the highest number of Packages
SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING MAX(PNAME) = (SELECT MAX(PNAME) FROM SOFTWARE)

--69.Who is the Author of the Costliest Package
SELECT PNAME,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)

--70.Display the names of the packages, which have sold less than the AVG number of copies
SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE)

--71.Who are the authors of the Packages, which have recovered more than double the Development cost
SELECT Distinct PNAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST

--72.Display the programmer Name and the cheapest packages developed by them in each language
SELECT PNAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN)

--73.Display the language used by each programmer to develop the Highest Selling and Lowest-selling package
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME) 
UNION SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME)

--74.Who is the youngest male Programmer born in 1965
SELECT PNAME FROM PROGRAMMER WHERE DOB=(SELECT (MAX(DOB)) FROM PROGRAMMER)

--75.Who is the oldest Female Programmer who joined in 1992
SELECT PNAME FROM PROGRAMMER WHERE DOJ=(SELECT (MIN(DOJ)) FROM PROGRAMMER)

--79.Who are the male programmers earning below the AVG salary of Female Programmers
SELECT PNAME FROM PROGRAMMER WHERE GENDER LIKE 'M' AND SALARY < (SELECT(AVG(SALARY)) FROM PROGRAMMER 
WHERE GENDER LIKE 'F')

--80.Who are the Female Programmers earning more than the Highest Paid
SELECT PNAME FROM PROGRAMMER WHERE GENDER LIKE 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER
WHERE GENDER LIKE 'M')

--81.Which language has been stated as the proficiency by most of the Programmers
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)

--82.Display the details of those who are drawing the same salary
Select * from programmer where salary = any(select salary from programmer p group by salary 
having salary=p.salary and count(*)>1)

--85.Display the details of the Programmers who joined before 1990
SELECT * FROM PROGRAMMER WHERE DOJ = SELECT(DOJ<YEAR('1990') FROM PROGRAMMER)

--92.Display the names of the programmers who have not developed any packages
select Pname from programmer where Pname not in(select Pname from software)

--105.List the programmers (form the software table) and the institutes they studied
Select PNAME,INSTITUTE from studies where PNAME not in(select PNAME from software)

--106.List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF
select count(*),sum(scost*sold-dcost) "PROFIT" from software where DEVELOPIN in (select prof1 from programmer) group by DEVELOPIN

--END OF THIS ASSIGNMENT--