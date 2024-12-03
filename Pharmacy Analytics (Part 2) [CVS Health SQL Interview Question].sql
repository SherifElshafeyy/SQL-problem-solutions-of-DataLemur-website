SELECT manufacturer , count(drug) , ABS(sum(cogs - total_sales)) as Total_loss

from pharmacy_sales

where total_sales - cogs <=0

group by manufacturer 

order by Total_loss desc
