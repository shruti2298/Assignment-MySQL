## ASSIGNMENT-4 – INVOICE DETAILS

mysql> select customers.customerName,orders.orderNumber,orders.shippedDate, payments.paymentDate,payments.amount, orderdetails.quantityOrdered,products.productName,productlines.image from customers
    ->     inner join orders on customers.customerNumber=orders.customerNumber
    ->     inner join payments on customers.customerNumber= payments.customerNumber
    ->    inner join orderdetails on orderdetails.orderNumber=orders.orderNumber 
    ->     inner join products on products.productCode=orderdetails.productCode
    ->     inner join productlines on products.productLine=productlines.productLine
    ->     where orders.orderNumber=10429;
+--------------------+-------------+-------------+-------------+----------+-----------------+--------------------------+-------+
| customerName       | orderNumber | shippedDate | paymentDate | amount   | quantityOrdered | productName              | image |
+--------------------+-------------+-------------+-------------+----------+-----------------+--------------------------+-------+
| Signal Gift Stores |       10429 | 2019-08-16  | 2004-12-17  | 14191.12 |               1 | 1960 BSA Gold Star DBD34 | NULL  |
| Signal Gift Stores |       10429 | 2019-08-16  | 2003-06-06  | 32641.98 |               1 | 1960 BSA Gold Star DBD34 | NULL  |
| Signal Gift Stores |       10429 | 2019-08-16  | 2004-08-20  | 33347.88 |               1 | 1960 BSA Gold Star DBD34 | NULL  |
| Signal Gift Stores |       10429 | 2019-08-16  | 2019-08-17  |  1150.00 |               1 | 1960 BSA Gold Star DBD34 | NULL  |
+--------------------+-------------+-------------+-------------+----------+-----------------+--------------------------+-------+
4 rows in set (0,01 sec)

mysql> explain select customers.customerName,orders.orderNumber,orders.shippedDate, payments.paymentDate,payments.amount, orderdetails.quantityOrdered,products.productName,productlines.image from customers
    ->     inner join orders on customers.customerNumber=orders.customerNumber
    ->     inner join payments on customers.customerNumber= payments.customerNumber
    ->    inner join orderdetails on orderdetails.orderNumber=orders.orderNumber
    ->     inner join products on products.productCode=orderdetails.productCode
    ->     inner join productlines on products.productLine=productlines.productLine
    ->     where orders.orderNumber=10429;
+----+-------------+--------------+------------+--------+------------------------+---------+---------+----------------------------------------+------+----------+-------+
| id | select_type | table        | partitions | type   | possible_keys          | key     | key_len | ref                                    | rows | filtered | Extra |
+----+-------------+--------------+------------+--------+------------------------+---------+---------+----------------------------------------+------+----------+-------+
|  1 | SIMPLE      | orders       | NULL       | const  | PRIMARY,customerNumber | PRIMARY | 4       | const                                  |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | customers    | NULL       | const  | PRIMARY                | PRIMARY | 4       | const                                  |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | orderdetails | NULL       | ref    | PRIMARY,productCode    | PRIMARY | 4       | const                                  |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | products     | NULL       | eq_ref | PRIMARY,productLine    | PRIMARY | 17      | classicmodels.orderdetails.productCode |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | productlines | NULL       | eq_ref | PRIMARY                | PRIMARY | 52      | classicmodels.products.productLine     |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | payments     | NULL       | ref    | PRIMARY                | PRIMARY | 4       | const                                  |    4 |   100.00 | NULL  |
+----+-------------+--------------+------------+--------+------------------------+---------+---------+----------------------------------------+------+----------+-------+
