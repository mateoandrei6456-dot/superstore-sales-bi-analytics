with vanzari_subcategorii as (SELECT 
    dp.Category,
    dp.Sub_Category,
    round(sum(fv.Sales),2) as Vanzari_subcategorie
from dim_produse dp
join fact_vanzari fv on fv.Product_ID=dp.Product_ID
group by dp.Category,dp.Sub_Category)

   

select 
    Category,
    Sub_Category,
    Vanzari_subcategorie,
    round(Vanzari_subcategorie*100/(
        select
            sum(Sales)
        from fact_vanzari),2) as Procent_din_vanzariile_totale_al_subcategoriilor
from vanzari_subcategorii
order by Vanzari_subcategorie DESC
