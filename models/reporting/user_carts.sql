with
users as
(
  select * rename (id as userid) from {{ ref('users_d') }}
),
carts as
(
  select * from {{ ref('carts_f') }}
),
joined as
(
  select *
  from
  carts join
  users using (userid)
)
select * from joined