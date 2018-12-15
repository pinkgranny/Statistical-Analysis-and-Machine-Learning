create database ecommerce;

use ecommerce;

create table customer(
customer_id text,
customer_unique_id text,
customer_zip_code_prefix text,
customer_city text,
customer_state text);

load data local infile '/home/soumya/Documents/brazilian-ecommerce/olist_customers_dataset.csv' 
into table customer COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

select * from customer;



create table geolocation(
geolocation_zip_code_prefix text,
geolocation_lat text,
geolocation_lng text,
geolocation_city text,
geolocation_state text);


load data local infile '/home/soumya/Documents/brazilian-ecommerce/olist_geolocation_dataset.csv' 
into table geolocation COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;


create table order_items(
order_id text,
order_item_id text,
product_id text,
seller_id text,
price text,
freight_value text
);

load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/olist_order_items_dataset.csv' 
into table order_items COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;


create table order_payments(
order_id text,
payment_sequential text,
payment_type text,
payment_installments text,
payment_value text
);


load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/olist_order_payments_dataset.csv' 
into table order_payments COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

create table order_reviews(
review_id text,
order_id text,
review_score text,
review_comment_title text,
review_comment_message text,
review_creation_date text,
review_answer_timestamp text
);


load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/olist_order_reviews_dataset.csv' 
into table order_reviews COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

create table orders(
order_id text,
customer_id text,
order_status text,
order_purchase_timestamp text,
order_approved_at text,
order_delivered_carrier_date text,
order_delivered_customer_date text,
order_estimated_delivery_date text
);

load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/olist_orders_dataset.csv' 
into table orders COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

create table products(
product_id text ,
product_category_name text,
product_name_lenght text,
product_description_lenght text,
product_photos_qty text,
product_weight_g text,
product_length_cm text,
product_height_cm text,
product_width_cm text
);

load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/olist_products_dataset.csv' 
into table products COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;


create table sellers(
seller_id text,
seller_zip_code_prefix text,
seller_city text,
seller_state text
);

load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/olist_sellers_dataset.csv' 
into table sellers COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;


create table product_category(
﻿product_category_name text,
product_category_name_english text
);

load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/product_category_name_translation.csv' 
into table product_category COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;


/*--------------------------marketing funnel------------------*/

create database marketing;

use marketing;

create table closed_deals(
mql_id text,
seller_id text,
sdr_id text,
sr_id text,
won_date text,
business_segment text,
lead_type text,
lead_behaviour_profile text,
has_company text,
has_gtin text,
average_stock text,
business_type text,
declared_product_catalog_size text,
declared_monthly_revenue text
);

load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/marketing-funnel-olist/olist_closed_deals_dataset.csv' 
into table closed_deals COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;


create table marketing_qualified_leads(
mql_id text,
first_contact_date text,
landing_page_id text,
origin text
);

load data local infile 
'/home/soumya/Documents/brazilian-ecommerce/marketing-funnel-olist/olist_marketing_qualified_leads_dataset.csv' 
into table marketing_qualified_leads COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;
