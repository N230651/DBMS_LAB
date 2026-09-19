USE DB;
SHOW tables;

-- =========================
-- LEVEL 0
-- ==========================
SELECT COUNT(*) 
FROM Apps;

select avg(rating)
from apps;


select max(rating)
from apps;


select min(rating)
from apps;

select sum(downloads)
from apps;

select *
from apps
order by rating desc;

-- =========================
-- level 01
-- ========================

select categoryid, count(*) as applications
from apps
group by categoryid;


select categoryid, avg(rating) as rating
from apps
group by categoryid;


select min(price) as min,
max(price) as max
from apps;

select *
from apps
order by downloads desc;

select developerid ,count(*) as application
from apps
group by developerid;

select categoryid , count(*) as application
from apps
group by categoryid
having count(*)>1;

-- ===========================
-- level 02
-- ===========================

select developerid,sum(downloads) as downloads
from apps
group by developerid;

select publisherid,avg(rating) as average_rating
from apps
group by publisherid;


select developerid,count(*) as application
from apps
group by developerid
having count(*) > 1;


select categoryid,avg(rating) as application
from apps
group by categoryid
having avg(rating)>4.3;

select categoryid,count(*) as application
from apps
group by categoryid
order by application desc;


select appid , appname,rating
from apps
where rating=(select max(rating)
              from apps
);


select developerid,sum(price) as total
from apps
group by developerid;
