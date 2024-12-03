SELECT   manufacturer , concat('$', round(sum(total_sales)/1000000),' ' ,'million') 

FROM pharmacy_sales

group by manufacturer 

order by  sum(total_sales) desc , manufacturer desc