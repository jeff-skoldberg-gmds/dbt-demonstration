with
users as
(
  select * rename (id as userid) from analytics.dbt_jeff.users_d
),
carts as
(
  select * from analytics.dbt_jeff.carts_f
),
joined as
(
  select *
  from
  carts join
  users using (userid)
)
select * from joined