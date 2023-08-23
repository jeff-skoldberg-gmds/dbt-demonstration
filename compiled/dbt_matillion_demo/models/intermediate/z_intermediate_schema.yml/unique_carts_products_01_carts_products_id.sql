
    
    

select
    carts_products_id as unique_field,
    count(*) as n_records

from analytics.intermediate.carts_products_01
where carts_products_id is not null
group by carts_products_id
having count(*) > 1


