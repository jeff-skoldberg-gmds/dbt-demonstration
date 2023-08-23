
    
    

select
    id as unique_field,
    count(*) as n_records

from analytics.intermediate.users_02
where id is not null
group by id
having count(*) > 1


