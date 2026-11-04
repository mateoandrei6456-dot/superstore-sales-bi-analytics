SELECT
    dp.Category,
    dp.Sub_Category,
    count(*) as Total_comenzi,
    sum(case
            when fv.profit<0 then 1
            else 0
        end) as Numar_tranzactii_pe_pierdere
from dim_produse dp
join fact_vanzari fv on fv.Product_ID=dp.Product_ID
Group by dp.Category,dp.Sub_Category
order by     sum(case
            when fv.profit<0 then 1
            else 0
        end) DESC