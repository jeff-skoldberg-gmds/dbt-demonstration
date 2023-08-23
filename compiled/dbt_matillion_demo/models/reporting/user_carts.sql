with
users as
(
  select * rename (id as userid) from analytics.intermediate.users_d
),
carts as
(
  select * from analytics.intermediate.carts_f
),
joined as
(
  select *
  from
  carts join
  users using (userid)
)
select * from joined