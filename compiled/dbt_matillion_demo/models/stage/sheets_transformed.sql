




with
include_meta as(
select

rowdata[0]::text as ID,

rowdata[1]::text as USER_UID,

rowdata[2]::text as START_DATE,

rowdata[3]::text as USER_ACCESS_EXPIRATION_DATE,

rowdata[4]::text as OVERLAPPING,


       
ID AS _PORTABLE_ID,  -- must rename incase data has a column called ID 
_PORTABLE_EXTRACTED

from
raw.public.google_sheets_spreadsheet_values_8589937133
WHERE _PORTABLE_ID != 0 -- header row
order by _PORTABLE_ID),

exclude_meta as (
        select *  exclude (_portable_id, _portable_extracted) from include_meta
)


select * from include_meta

 


