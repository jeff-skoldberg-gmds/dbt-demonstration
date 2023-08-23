
    
    

select
    carts_json as unique_field,
    count(*) as n_records

from analytics.dbt_jeff.carts_01
where carts_json is not null
group by carts_json
having count(*) > 1


