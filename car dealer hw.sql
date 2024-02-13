CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "invoice" (
  "invoice_id" SERIAL,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "price" NUMERIC(6,2),
  "sale_date" date default current_date,
  "customer_id" INTEGER,
  PRIMARY KEY ("invoice_id"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id")
);

CREATE TABLE "service" (
  "service_id" SERIAL,
  "part_description" VARCHAR(100),
  "part_amount" NUMERIC(6,2),
  "total_cost" NUMERIC(6,2),
  "mechanic_name" VARCHAR(100),
  "service_date" date default current_date,
  "customer_id" INTEGER,
  "invoice_id" INTEGER,
  PRIMARY KEY ("service_id"),
  CONSTRAINT "FK_service.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_service.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoice"("invoice_id")
);

CREATE TABLE "sales" (
  "sales_id" SERIAL,
  "sales_first" VARCHAR(100),
  "sales_last" VARCHAR(100),
  "invoice_id" INTEGER,
  PRIMARY KEY ("sales_id"),
  CONSTRAINT "FK_sales.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoice"("invoice_id")
);



insert into customer(
customer_id,
first_name,
last_name 
)values(
1,
'bob',
'smith'
);

insert into customer(
customer_id,
first_name,
last_name 
)values(
2,
'martha',
'stewart'
)



insert into invoice(
invoice_id,
make,
model,
price,
customer_id 
)values(
1,
'hyundai',
'accent',
'7000.00',
1
)

insert into invoice(
invoice_id,
make,
model,
price,
customer_id 
)values(
2,
'toyota',
'camry',
'9000.00',
2
)


insert into service(
service_id,
part_description,
part_amount,
total_cost,
mechanic_name,
customer_id,
invoice_id
)values(
1,
'radiator',
'400.00',
'600.00',
'jeff',
1,
1
)


insert into service(
service_id,
part_description,
part_amount,
total_cost,
mechanic_name,
customer_id,
invoice_id
)values(
2,
'new tire',
'200.00',
'300.00',
'matt',
2,
2
)

insert into sales(
sales_id,
sales_first,
sales_last,
invoice_id 
)values(
1,
'betty',
'washington',
1
)

insert into sales(
sales_id,
sales_first,
sales_last,
invoice_id 
)values(
2,
'bill',
'cosby',
2
)


create or replace function add_customer(customer_id INTEGER,_firstName VARCHAR, _lastName VARCHAR)
returns void
as $$
begin 
	insert into customer(first_name,last_name)
	values(_firstName,_lastName);
end;
$$
language plpgsql;


select add_customer(3,'joey','fatone');
select add_customer(4,'abe','lincoln');






create or replace function add_invoice(_invoice_id INTEGER,_make VARCHAR, _model VARCHAR,_price numeric,_sale_date TIMESTAMP without TIME zone,_customer_id INTEGER)
returns void
as $$
begin 
	insert into invoice(invoice_id,make,model,price,sale_date,customer_id)
	values(_invoice_id,_make,_model,_price,_sale_date,_customer_id);
end;
$$
language plpgsql;




select add_invoice(3,'geo','metro',5000,NOW()::timestamp,3); 
select add_invoice(4,'ford','pinto',8000,NOW()::timestamp,4); 







