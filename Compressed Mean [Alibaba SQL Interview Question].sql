SELECT ROUND((Total_items::Decimal / Total_orders), 1) AS Mean


from

(
SELECT sum(order_occurrences) as Total_orders ,sum(item_count * order_occurrences) as Total_items

from items_per_order
) cte
