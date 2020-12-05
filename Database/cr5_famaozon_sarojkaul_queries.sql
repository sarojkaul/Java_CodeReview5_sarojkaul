
/*1.how many products were bought from a specific company*/

SELECT orders.quantity,company.company_name FROM orders INNER JOIN company ON company.company_Id = orders.fk_company_Id WHERE orders.fk_company_Id = 3;


/*2.who purchased products on this date*/

SELECT cutomers.coustmer_Id,cutomers.first_name,cutomers.last_name,orders.order_date FROM cutomers INNER JOIN orders ON orders.fk_customer_Id = cutomers.coustmer_Id WHERE orders.order_date = '2020-07-12 20:34:49';

/*3.what order were sent between this and that date, */
SELECT orders.fk_product_Id,orders.quantity,shipment_status.sent_date_Time FROM orders INNER JOIN shipment_status ON shipment_status.fk_order_Id = orders.order_Id WHERE shipment_status.sent_date_Time BETWEEN '2020-03-12 00:00:00' AND '2020-11-12 00:00:00';

/*4.how many products were sent to a specific city*/

SELECT orders.quantity,orders.fk_product_Id,shipment_status.fk_location FROM orders INNER JOIN shipment_status ON shipment_status.fk_order_Id = orders.order_Id WHERE shipment_status.fk_location = 1;

/*5. show stock of one specific company*/


SELECT company.company_name,products.stock FROM products INNER JOIN company ON products.fk_company_Id=company.company_Id WHERE products.fk_company_Id=2;

/*6. shows Name of all users who register in 2001*/

SELECT cutomers.coustmer_Id,cutomers.first_name,cutomers.last_name FROM cutomers WHERE cutomers.dateof_registration BETWEEN '2001-01-01' AND '2001-12-31';













