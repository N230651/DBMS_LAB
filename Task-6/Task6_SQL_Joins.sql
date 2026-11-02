create database playstoredb;
use playstoredb;
select * from apps;

-- ====================
-- LEVEL 0
-- ====================

select A.AppName , D.DeveloperName
from Apps A
INNER JOIN developers d
on a.developerid=d.developerid;


select A.AppName , p.publisherName
from Apps A
INNER JOIN publishers p
on a.publisherid=p.publisherid;


select a.appname,c.categoryname
from apps a
inner join categories c
on a.categoryid=c.categoryid;


select a.appname,d.developername,p.publishername
from apps a
inner join developers d
on a.developerid=d.developerid
inner join publishers p
on a.publisherid=p.publisherid;


select a.appname,d.developername,c.categoryname
from apps a
inner join developers d
on a.developerid=d.developerid
inner join categories c
on c.categoryid=c.categoryid;


select p.publishername, a.appname
from publishers p
left join apps a
on p.publisherid=a.publisherid;


select c.categoryname, a.appname
from categories c
left join apps a
on c.categoryid=a.categoryid;

-- ================================
-- level 01
-- ===============================
select p.publishername,a.appname
from publishers p
left join apps a
on p.publisherid=a.publisherid;

select a.appname,p.publishername
from publishers p
right join apps a
on p.publisherid=a.publisherid;



select c.categoryname,a.appname
from categories c
left join apps a
on c.categoryid=a.categoryid;


select a.appname,d.developername,d.country
from apps a
inner join developers d
on a.developerid=d.developerid;


select a.appname,d.developername,p.publishername,c.categoryname
from apps a
inner join developers d
on a.developerid=d.developerid
inner join publishers p
on a.publisherid=p.publisherid
inner join categories c
on a.categoryid=c.categoryid;



select a.appname,d.developername,d.country
from apps a
inner join developers d
on a.developerid=d.developerid
where d.country='USA';

select a.appname,p.publishername
from apps a
inner join publishers p
on a.publisherid=p.publisherid
inner join categories c
on a.categoryid=c.categoryid
where c.categoryname='gaming';



select a.appname,d.developername,a.rating
from apps a
inner join developers d
on a.developerid=d.developerid
where a.rating>4.5;


-- =======================================
--  level 02
-- ======================================

select p.publishername,a.appname
from publishers p
left join apps a
on p.publisherid=a.publisherid;


select a.appname , p.publishername
from publishers p
left join apps a
on p.publisherid=a.publisherid
where a.appid is null;


 select a.appname,c.categoryname
from apps a
inner join categories c
on a.categoryid=c.categoryid
order by c.categoryname asc;


select a.appname, d.developername,p.publishername,c.categoryname,a.rating
from apps a
inner join developers d
on a.developerid=d.developerid
inner join publishers p
on a.publisherid=p.publisherid
inner join categories c
on a.categoryid=c.categoryid;


select a.appname, d.developername,d.country,p.publishername
from apps a
inner join developers d
on a.developerid=d.developerid
inner join publishers p
on a.publisherid=p.publisherid
where d.country='USA' and p.publishername='Google Play';



select d.developername , a.appname
from developers d
inner join apps a
on a.developerid=d.developerid;


select d1.developername as developer1,d2.developername as developer2,d1.country
from developers d1
inner join developers d2
on d1.country=d2.country
and d1.developerid<d2.developerid;

select p.publishername,c.categoryname
from publishers p
cross join categories c;


select p.publisherid,p.publishername,a.appname
from publishers p
left join apps a
on p.publisherid=a.publisherid
union
select p.publisherid,p.publishername,a.appname
from publishers p
right join apps a
on p.publisherid=a.publisherid;



select a.appname,c.categoryname,d.developername,p.publishername
from apps a
inner join categories c
on c.categoryid=c.categoryid
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers P
ON A.PublisherID = P.PublisherID
WHERE C.CategoryName IN ('Gaming', 'Social');


SELECT A.AppName, D.DeveloperName, C.CategoryName
FROM Apps A
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID
INNER JOIN Categories C
ON A.CategoryID = C.CategoryID
WHERE A.Rating BETWEEN 4.3 AND 4.7;


SELECT D.DeveloperName, D.Country, A.AppName
FROM Developers D
INNER JOIN Apps A
ON D.DeveloperID = A.DeveloperID
WHERE D.Country <> 'India';
