select 
    dp.Category,
    dp.Sub_Category,
    round(sum(sales),2) as Vanzari_Totale,
    round(sum(Profit),2) as Profit_total,
    round(avg(Discount),2) as Discount_Mediu

from dim_produse dp
join fact_vanzari fv on fv.Product_ID=dp.Product_ID
Group by dp.Category,dp.Sub_Category
order by round(sum(Profit),2) DESC