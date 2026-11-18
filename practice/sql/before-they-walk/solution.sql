select u.user_id, u.username,
sum(t.total_amount) as lifetime_spend
from transactions t inner join users u on t.user_id = u.user_id
group by u.user_id
order by lifetime_spend desc
limit 10
