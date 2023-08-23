
    
    

select
    json_data as unique_field,
    count(*) as n_records

from RAW.sample_data.web_traffic
where json_data is not null
group by json_data
having count(*) > 1


