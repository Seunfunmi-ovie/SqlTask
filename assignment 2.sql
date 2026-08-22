SELECT SKU, SKU_Description FROM INVENTORY;
SELECT SKU_Description, SKU FROM INVENTORY;
SELECT WarehouseID FROM INVENTORY;
SELECT distinct WarehouseID FROM INVENTORY;
SELECT WarehouseID, SKU, SKU_Description,QuantityOnHand,QuantityOnOrder FROM INVENTORY;
SELECT * FROM INVENTORY;
SELECT * FROM INVENTORY WHERE QuantityOnHand > 0;
SELECT SKU, SKU_Description FROM INVENTORY WHERE QuantityOnHand = 0;
SELECT SKU, SKU_Description FROM INVENTORY WHERE QuantityOnHand = 0 order by WarehouseID;
SELECT SKU,  SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0   AND QuantityOnOrder > 0 ORDER BY WarehouseID DESC, SKU ASC;
SELECT SKU , SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0 ORDER BY WarehouseID DESC, SKU ASC;
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand > 2 < 9;
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand BETWEEN  2 AND  9;
SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE 'Half-Dome%';
SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE '%Climb%';
SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE '__d%';
SELECT 
    SUM(QuantityOnHand) AS Total_Quantity_On_Hand,
    AVG(QuantityOnHand) AS Average_Quantity_On_Hand,
    MIN(QuantityOnHand) AS Minimum_Quantity_On_Hand,
    MAX(QuantityOnHand) AS Maximum_Quantity_On_Hand,
    COUNT(QuantityOnHand) AS Total_Product_Rows
FROM INVENTORY;










