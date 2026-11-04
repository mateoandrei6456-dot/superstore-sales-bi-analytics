SELECT 
    dp.Category,
    ROUND(SUM(fv.Sales), 2) AS Performanta_vanzari_categorii,
    ROUND(SUM(fv.Profit), 2) AS Performata_profit_categorii
FROM fact_vanzari fv
JOIN dim_produse dp ON dp.Product_ID = fv.Product_ID
GROUP BY dp.Category;



