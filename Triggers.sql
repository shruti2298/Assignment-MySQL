
## TRIGGERS – ASSIGNMENT 5

mysql> select customers.customerNumber , count(*) as no_of_orders
->from customers,orders 
->where customers.customerNumber=orders.customerNumber 
->group by customers.customerNumber 
->order by customers.customerNumber;
+----------------+--------------+
| customerNumber | no_of_orders |
+----------------+--------------+
|            103 |            4 |
|            112 |            4 |
|            114 |            5 |
|            119 |            4 |
|            121 |            4 |
|            124 |           17 |
|            128 |            4 |
|            129 |            3 |
|            131 |            4 |
|            141 |           26 |
|            144 |            4 |
|            145 |            7 |
|            146 |            3 |
|            148 |            5 |
|            151 |            4 |
|            157 |            4 |
|            161 |            4 |
|            166 |            4 |
|            167 |            3 |
|            171 |            2 |
|            172 |            3 |
|            173 |            2 |
|            175 |            3 |
|            177 |            2 |
|            181 |            3 |
|            186 |            3 |
|            187 |            3 |
|            189 |            2 |
|            198 |            3 |
|            201 |            3 |
|            202 |            2 |
|            204 |            2 |
|            205 |            3 |
|            209 |            3 |
|            211 |            2 |
|            216 |            3 |
|            219 |            2 |
|            227 |            2 |
|            233 |            3 |
|            239 |            2 |
|            240 |            2 |
|            242 |            3 |
|            249 |            2 |
|            250 |            3 |
|            256 |            2 |
|            259 |            2 |
|            260 |            2 |
|            276 |            4 |
|            278 |            3 |
|            282 |            4 |
|            286 |            2 |
|            298 |            2 |
|            299 |            2 |
|            311 |            3 |
|            314 |            3 |
|            319 |            2 |
|            320 |            3 |
|            321 |            4 |
|            323 |            5 |
|            324 |            3 |
|            328 |            3 |
|            333 |            3 |
|            334 |            3 |
|            339 |            2 |
|            344 |            2 |
|            347 |            2 |
|            350 |            3 |
|            353 |            5 |
|            357 |            3 |
|            362 |            3 |
|            363 |            3 |
|            379 |            3 |
|            381 |            4 |
|            382 |            4 |
|            385 |            3 |
|            386 |            3 |
|            398 |            4 |
|            406 |            3 |
|            412 |            3 |
|            415 |            1 |
|            424 |            3 |
|            447 |            3 |
|            448 |            3 |
|            450 |            4 |
|            452 |            3 |
|            455 |            2 |
|            456 |            2 |
|            458 |            3 |
|            462 |            3 |
|            471 |            3 |
|            473 |            2 |
|            475 |            2 |
|            484 |            2 |
|            486 |            3 |
|            487 |            2 |
|            489 |            2 |
|            495 |            2 |
|            496 |            4 |
+----------------+--------------+
98 rows in set (0,03 sec)


mysql> create table ordercount as
->select customers.customerNumber , count(*) as no_of_orders 
->from customers,orders 
->where customers.customerNumber=orders.customerNumber 
->group by customers.customerNumber order by customers.customerNumber;

Query OK, 98 rows affected (1,07 sec)
Records: 98  Duplicates: 0  Warnings: 0

mysql> desc ordercount;
+----------------+------------+------+-----+---------+-------+
| Field          | Type       | Null | Key | Default | Extra |
+----------------+------------+------+-----+---------+-------+
| customerNumber | int(11)    | NO   |     | NULL    |       |
| no_of_orders   | bigint(21) | NO   |     | 0       |       |
+----------------+------------+------+-----+---------+-------+
2 rows in set (0,11 sec)

mysql> select * from ordercount;
+----------------+--------------+
| customerNumber | no_of_orders |
+----------------+--------------+
|            103 |            4 |
|            112 |            4 |
|            114 |            5 |
|            119 |            4 |
|            121 |            4 |
|            124 |           17 |
|            128 |            4 |
|            129 |            3 |
|            131 |            4 |
|            141 |           26 |
|            144 |            4 |
|            145 |            7 |
|            146 |            3 |
|            148 |            5 |
|            151 |            4 |
|            157 |            4 |
|            161 |            4 |
|            166 |            4 |
|            167 |            3 |
|            171 |            2 |
|            172 |            3 |
|            173 |            2 |
|            175 |            3 |
|            177 |            2 |
|            181 |            3 |
|            186 |            3 |
|            187 |            3 |
|            189 |            2 |
|            198 |            3 |
|            201 |            3 |
|            202 |            2 |
|            204 |            2 |
|            205 |            3 |
|            209 |            3 |
|            211 |            2 |
|            216 |            3 |
|            219 |            2 |
|            227 |            2 |
|            233 |            3 |
|            239 |            2 |
|            240 |            2 |
|            242 |            3 |
|            249 |            2 |
|            250 |            3 |
|            256 |            2 |
|            259 |            2 |
|            260 |            2 |
|            276 |            4 |
|            278 |            3 |
|            282 |            4 |
|            286 |            2 |
|            298 |            2 |
|            299 |            2 |
|            311 |            3 |
|            314 |            3 |
|            319 |            2 |
|            320 |            3 |
|            321 |            4 |
|            323 |            5 |
|            324 |            3 |
|            328 |            3 |
|            333 |            3 |
|            334 |            3 |
|            339 |            2 |
|            344 |            2 |
|            347 |            2 |
|            350 |            3 |
|            353 |            5 |
|            357 |            3 |
|            362 |            3 |
|            363 |            3 |
|            379 |            3 |
|            381 |            4 |
|            382 |            4 |
|            385 |            3 |
|            386 |            3 |
|            398 |            4 |
|            406 |            3 |
|            412 |            3 |
|            415 |            1 |
|            424 |            3 |
|            447 |            3 |
|            448 |            3 |
|            450 |            4 |
|            452 |            3 |
|            455 |            2 |
|            456 |            2 |
|            458 |            3 |
|            462 |            3 |
|            471 |            3 |
|            473 |            2 |
|            475 |            2 |
|            484 |            2 |
|            486 |            3 |
|            487 |            2 |
|            489 |            2 |
|            495 |            2 |
|            496 |            4 |
+----------------+--------------+
98 rows in set (0,00 sec)

mysql> create trigger neworder 
->after insert on orders 
->for each row 
->update ordercount 
->set ordercount.no_of_orders=ordercount.no_of_orders+1 
->where ordercount.customerNumber=new.customerNumber;

Query OK, 0 rows affected (0,00 sec)

mysql> select * from ordercount where customerNumber=112;
+----------------+--------------+
| customerNumber | no_of_orders |
+----------------+--------------+
|            112 |            4 |
+----------------+--------------+
1 row in set (0,00 sec)

mysql> insert into orders (orderNumber,orderDate,requiredDate,shippedDate,status,customerNumber) values(10431,'2020-05-31','2020-06-07','2020-06-02','In Process',112);

Query OK, 1 row affected (0,04 sec)

mysql> select * from ordercount where customerNumber=112;
+----------------+--------------+
| customerNumber | no_of_orders |
+----------------+--------------+
|            112 |            5 |
+----------------+--------------+
1 row in set (0,00 sec)
