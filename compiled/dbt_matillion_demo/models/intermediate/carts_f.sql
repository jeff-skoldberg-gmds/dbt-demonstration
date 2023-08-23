

with carts as 
(
  select 
  carts_id,
  userid,
  totalproducts,
  totalquantity,
  total carts_total,
  discountedtotal
  from analytics.intermediate.carts_02
) ,
carts_products as 
(
  select 
  carts_id,
  carts_products_id,
  discountpercentage,
  discountedprice,
  price,
  quantity,
  title,
  total as line_total
  from analytics.intermediate.carts_products_01
),
joined as (
  select * 
  from 
  carts join
  carts_products using (carts_id)
)
select * from
joined

order by carts_id,
carts_products_id