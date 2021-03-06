## TRANSACTION
mysql> start transaction;
Query OK, 0 rows affected (0,00 sec)

mysql> select @orderNumber:=MAX(orderNumber) +1 from orders;
+-----------------------------------+
| @orderNumber:=MAX(orderNumber) +1 |
+-----------------------------------+
|                             10429 |
+-----------------------------------+
1 row in set (0,02 sec)

mysql> insert into orders (orderNumber,orderDate,requiredDate,shippedDate,status,customerNumber) values(@orderNumber,'2019-08-10','2019-08-29','2019-08-16','In Process',112);
Query OK, 1 row affected (0,04 sec)

mysql> insert into orderdetails (orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber) values (@orderNumber,'S24_2000',1,'1150',1);
Query OK, 1 row affected (0,00 sec)

mysql> INSERT into payments (customerNumber,checkNumber,paymentDate,amount) values(112,'SP22039','2019-08-17',1150);
Query OK, 1 row affected (0,00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0,03 sec)


## Session 1:

shruti@shruti-VirtualBox:~$ mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6
Server version: 5.7.30-0ubuntu0.16.04.1 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use classicmodels;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> start transaction;
Query OK, 0 rows affected (0,00 sec)

mysql> delete from payments;
Query OK, 273 rows affected (0,00 sec)

##Session -2 

shruti@shruti-VirtualBox:~$ mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.7.30-0ubuntu0.16.04.1 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use classicmodels;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select count(*) from payments;
+----------+
| count(*) |
+----------+
|      273 |
+----------+
1 row in set (0,00 sec)

##Session -1

mysql> rollback;
Query OK, 0 rows affected (0,08 sec)

mysql> select count(*) from payments;
+----------+
| count(*) |
+----------+
|      273 |
+----------+
1 row in set (0,00 sec)

