
    
    

select
    id as unique_field,
    count(*) as n_records

from analytics.dbt_jeff.users_02
where id is not null
group by id
having count(*) > 1


