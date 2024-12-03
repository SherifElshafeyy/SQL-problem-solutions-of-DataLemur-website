SELECT drug , (total_sales - cogs) as Total_profit

from pharmacy_sales

order by Total_profit desc

limit 3