
    
    

select
    users_json as unique_field,
    count(*) as n_records

from analytics.intermediate.users_01
where users_json is not null
group by users_json
having count(*) > 1


