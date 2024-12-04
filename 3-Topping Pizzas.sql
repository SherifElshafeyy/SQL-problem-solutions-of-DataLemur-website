--use cross join to get combination of each three ingredients with condition that the first ingrdient is less than the next ingredient alphapitically
with cte as (
SELECT 
    p.topping_name AS topping1, 
    p.ingredient_cost as ingredient1_cost,
    z.topping_name AS topping2,
    z.ingredient_cost as ingredient2_cost,
    w.topping_name AS topping3,
    w.ingredient_cost as ingredient3_cost
FROM 
    pizza_toppings p
CROSS JOIN 
    pizza_toppings z
CROSS JOIN 
    pizza_toppings w
WHERE 
    p.topping_name < z.topping_name 
    AND z.topping_name < w.topping_name 
    
)

--after cross join we get the sum of three ingredient and concat the 
    
select concat(topping1,',',topping2,',',topping3),
(ingredient1_cost+ingredient2_cost+ingredient3_cost) as total_cost
from cte
order by total_cost desc , topping1,topping2,topping3

