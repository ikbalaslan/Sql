create table salesman(
  id smallInt primary key,
  name varchar(20),
  city varchar(20),
  age numeric(2) check(age>0),
  commission numeric(3,2)
  )
Insert Into salesman values (202,'Freddie Mercury','Stone Town',45,0.25);
Insert Into salesman values (314,'Paul McCartney','Liverpool',56,0.18);
Insert Into salesman values (115,'Baris Manco','Istanbul', 34,0.20);
Insert Into salesman values (472,'Bon Jovi','New Jersey', 23,0.15);
Insert Into salesman values (267,'Brian Jones','Liverpool', 33,0.20);
Insert Into salesman values (254,'Bruno Mars','Barcelona',37,0.22);
Insert Into salesman values (376,'Beyonce','Nairobi',31,0.18);
Insert Into salesman values (192,'Adele','New Jersey', 41,0.20);
Insert Into salesman values (412,'Selena Gomez','Tahrain', 42,0.15);
Insert Into salesman values (257,'Black Pink','Seul', 21,null);
Create table zone(
  city varchar(20),
  zone varchar(20),
  giro smallint,
  number_of_salesman smallint
  )
Insert Into zone values ('Seul','Asia',110,12);
Insert Into zone values ('Barcelona','Europe',90,28);
Insert Into zone values ('Mexico City','America',180,47);
Insert Into zone values ('Nairobi','Africa',75,25);
Insert Into zone values ('Tahrain','Asia',165,18);
Insert Into zone values ('Istanbul','Asia',100,8);
Insert Into zone values ('Liverpool','Europe',80,25);
Insert Into zone values ('New Jersey','America',170,45);
Insert Into zone values ('Stone Town','Africa',65,15);
--Q8 HEr bölgenin toplam çalışan sayıları

SELECT zone , SUM(number_of_salesman)
FROM zone
GROUP by zone
--Q3 En yüksek komisyonla çalışan satıcı hangi bölgede
SELECT zone 
FROM zone,salesman
WHERE zone.city = (SELECT city FROM salesman WHERE commission = (SELECT MAX(commission) as com FROM salesman))
GROUP BY zone
--Q Asia bölgesindeki satıcıların en yüksek komisyon alanı kim
select name, commission
from salesman
where commission = (select max(commission) from salesman WHERE city IN(SELECT city FROM zone WHERE zone = 'Asia')) 


SELECT MAX(commission) FROM salesman 

   select city FROM zone 
   WHERE zone = 'Asia'



--Q1 America ve Avrupa bölgesine bağlı olmayan en yüksek komisyonla çalışan satıcı
--çözüm
SELECT name, commission
FROM salesman
WHERE commission = (SELECT MAX(commission) FROM salesman WHERE city IN
					(SELECT city FROM zone WHERE zone NOT IN ('America','Europe')))

--Q2 En yüksek geliri olan bölgenin en yüksek komisyon alan satıcısı

SELECT name from salesman WHERE commission = (
SELECT MAX(commission) FROM salesman WHERE city IN (
                                          SELECT city FROM zone WHERE zone = (SELECT zone FROM zone
                                                      WHERE giro = (SELECT MAX(giro) FROM zone))))





SELECT MAX(commission) FROM salesman WHERE city IN (
                                          SELECT city FROM zone WHERE zone = (SELECT zone FROM zone
                                                      WHERE giro = (SELECT MAX(giro) FROM zone)))


SELECT city FROM zone WHERE zone = (SELECT zone FROM zone
                                                      WHERE giro = (SELECT MAX(giro) FROM zone))




SELECT zone FROM zone
WHERE giro = (SELECT MAX(giro) FROM zone) 


SELECT zone




















