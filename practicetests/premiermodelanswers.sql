/*   BCPR203 SQL Revision Joins and Views Handout Exercises   */


/*  q1   */

select * from customer
order by city;

/*   q2    */
select * from customer
where city not like '%Grove%'
order by city;

OR
select customername, city from customer
where city <> 'Grove';

/*   q3   */
select customername, balance from customer
where balance between 2000 and 4000;

/*   q4   */
select max(balance), min(balance), avg(balance)
from customer;

/*   q5   */
select city, max(balance) as maxBalance, min(balance) as minBalance, avg(balance) as avbalance
from customer
group by city;

/*   q6   */
select * from part
order by warehouse, price desc;

/*  q7  */

select * from customer
where (creditlimit - balance) < 1000 and Balance < creditlimit
order by creditlimit;

OR
select customername, creditlimit, balance from customer
where (creditlimit - balance) < 1000 and Balance < creditlimit;

/*  q8    */
select * from part 
where price <
(select avg(price) from part);

/*   q9    */  
select firstname,lastname, count(R.repnum) as NumberOfCustomers
from Rep R inner join Customer C
on R.repnum = C.repnum
group by firstname,lastname;

/*   q10    */
select P.partnum, description 
from part P inner join orderline OL
on P.partnum = OL.partnum 
where ordernum = "21617";

/* OR using a nested select */
select * from part 
where partnum in
(select partnum from orderline
where ordernum = "21617");

/*   q11   */
select O.ordernum, orderdate, customernum
from orders O 
inner join orderline OL
on O.ordernum = OL.ordernum 
inner join Part P
on OL.partnum = P.partnum
and description like "Gas Range";

/*      q12      */
select distinct customername, R.Repnum, firstname, lastname
from customer C
inner join Rep R
on C.repnum = R.repnum
inner join orders O
on C.customernum = O.customernum;

/*    q13      */
select O.Ordernum, O.OrderDate, Customername, Description, numordered, quotedPrice
from Customer C
inner join orders O
on  C.customernum = O.customernum 
inner join orderLine OL
on O.Ordernum = OL.Ordernum
inner join Part P
on OL.Partnum = P.Partnum
Order By CustomerName, O.Ordernum, OL.Partnum;

/*   q14       */
select firstname, lastname, Count(ordernum)
from Rep R
inner join Customer C
on R.repnum = C.repnum 
inner join orders O
on C.customernum = O.customernum
Group By firstname;

/* q15 */
Select firstname,lastname, SUM(rate * numordered * quotedPrice) as commissionValue
From Rep R
inner join Customer C
on R.repnum = C.repnum 
inner join orders O
on C.customernum = O.customernum
inner join OrderLine OL
on O.ordernum = OL.ordernum
Group By firstname;

/* 16 */
select customernum, C.customername, concat(firstname," ",lastname) as RepName
From Customer C
inner join Rep R
on C.repnum = R.repnum
where R.repnum <> 35;

/* 17 */
select P.Partnum, OnHand, Sum(numordered) as TotalOrdered
From Part P
inner join OrderLine OL
on P.Partnum = OL.Partnum
Group By P.Partnum, OnHand;

/* 18   */
Select customerName, Balance
FROM Customer 
WHERE Balance between 2001 and 2999
ORDER BY Balance;

/*   19    */
Select O.ordernum, OrderDate, Customername, firstname, lastname, Sum(numordered * QuotedPrice) as OrderTotal
From Rep R
inner join Customer C
on R.repnum = C.repnum 
inner join orders O
on C.customernum = O.customernum
inner join OrderLine OL
on O.ordernum = OL.ordernum
Group By O.ordernum, OrderDate, CustomerName, firstname,lastname;

/*   20   */ 
Create or replace View OrderTotals(ordernum, OrderTotal) as
 Select ordernum, Sum(numordered * QuotedPrice) 
from OrderLine
Group By ordernum;

Select * from ordertotals;

SELECT P.partnum, Description, ordernum, numordered
FROM OrderLine OL
inner join Part P
on P.partnum = OL.partnum and 
ordernum IN
	(SELECT ordernum
	FROM  OrderTotals 
	where OrderTotal > (Select AVG(OrderTotal)from OrderTotals));


/*    21   */
SELECT O.ordernum, CustomerName , City
FROM Customer C
inner join orders O
on C.customernum = O.customernum
where ( City = "Grove" AND Balance < creditlimit * 0.5);

/*  22  */
SELECT  P.partnum, Description, numordered, QuotedPrice
FROM Part P
inner join OrderLine OL
on P.partnum = OL.partnum
and numordered * QuotedPrice > 1500;

/*  23 */
insert into customer values (623, 'Joe Bloggs', '55 Marshlands', 'Christchurch','CA','8005', 0, 5000,20);

/*  24 */

select * from part;

update part 
set price = price * 1.1;

select * from part;

/*  25   */

insert into orders values (21627, now(), 623);

insert into orderline values(21627, 'DR93', 1, 495.00);
insert into orderline values(21627, 'KL62', 2, 340.00);
insert into orderline values(21627, 'KT03', 1, 590.00);

select * from orderline;



/*   26a   */
Create or replace View Brookings as 
	SELECT P.partnum, Description, C.customername 
	from Customer C
	inner join orders O
	on  C.customernum = O.customernum 
	inner join orderLine OL
	on O.Ordernum = OL.Ordernum
	inner join Part P
	on OL.Partnum = P.Partnum
	WHERE CustomerName Like 'Brookings Direct';

select * from Brookings;


/*  26b  */
Create or replace View Diff as 
	SELECT CustomerName , firstName, lastname, P.partnum, Description, 
	(numordered * price - numordered * QuotedPrice) as Difference
	from Customer C
	inner join orders O
	on  C.customernum = O.customernum 
	inner join orderLine OL
	on O.Ordernum = OL.Ordernum
	inner join Part P
	on OL.Partnum = P.Partnum
	inner join Rep R
 	on C.RepNum = R.RepNum
	WHERE price <> QuotedPrice;

Select * from diff;

create or replace view totalDiff as 
	select partnum, description, sum(difference) as totalDifference
	from Diff
	group by partnum, description;

Select * from totaldiff;


/*   View 27a    */
CREATE or replace VIEW NotGroveItemisedOrder AS
	SELECT OL.Ordernum, Orderdate, P.partnum, Description, numordered, 
	QuotedPrice, numordered*QuotedPrice
	from Customer C
	inner join orders O
	on  C.customernum = O.customernum 
	inner join orderLine OL
	on O.Ordernum = OL.Ordernum
	inner join Part P
	on OL.Partnum = P.Partnum
	WHERE City <> 'Grove';

select * from NotGroveItemisedOrder;


/*   View  27b     */
CREATE or replace VIEW OneLineOrders(OneLineordernum)  AS
	SELECT   ordernum
	FROM  OrderLine
	GROUP BY ordernum
	HAVING  COUNT(ordernum) = 1;

Select * from oneLineorders;

CREATE or replace VIEW CustOneLineOrders AS
	SELECT customername, ordernum, OrderDate
	FROM Customer C inner join orders O
	ON C.customernum = O.customernum
	INNER JOIN OneLineOrders OLO
	ON OLO.OneLineordernum = O.ordernum;

select * from CustOneLineOrders;


/*   View  27c       */
CREATE or replace VIEW Totalnumordered(customernum, Totnumordered)  AS
	SELECT customernum, SUM(numordered)
	FROM OrderLine OL INNER JOIN orders O
	ON OL.ordernum = O.ordernum
	GROUP BY customernum;

Select * from Totalnumordered;

CREATE or replace VIEW RepCustParts(RCRepName, RCcustomername,RCTotal)  AS
	SELECT concat(firstname," ",lastname), CustomerName, Totnumordered
	FROM  Rep R INNER JOIN Customer C
	ON R.repnum = C.repnum
	INNER JOIN Totalnumordered T
	ON T.customernum = C.customernum;

Select * from RepCustParts;


/*   View   27d     */
CREATE or replace VIEW  OrderTotals(ordernum, Total, customernum) AS
	SELECT OL.ordernum, SUM(numordered * QuotedPrice), customernum
	FROM OrderLine OL INNER JOIN orders CO
	ON OL.ordernum = CO.ordernum
	GROUP BY OL.ordernum, customernum;

Select * from ordertotals;

CREATE or replace VIEW Brookings2(customernum,customerName, NoOFOrders, AverageOrder) AS
	SELECT C.customernum, CustomerName, COUNT(OT.ordernum), AVG(Total)
	FROM Customer C INNER JOIN OrderTotals OT
	ON C.customernum = OT.customernum
	WHERE CustomerName = 'Brookings Direct'
	GROUP BY C.customernum, Customername;

Select * from Brookings2;


/*   View   27e    */
CREATE or replace VIEW RepMaxMin(repnum,MaxOrder, MinOrder)  AS
	SELECT R.repnum, MAX(Total), MIN(Total)
	FROM  Rep R INNER JOIN Customer C
	ON R.repnum = C.repnum
	INNER JOIN orders O
	ON C.customernum = O.customernum
	INNER JOIN OrderTotals OT
	ON OT.ordernum = O.ordernum
	GROUP BY R.repnum;

Select * from RepMaxMin;

