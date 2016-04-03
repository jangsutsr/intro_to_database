/*
SELECT q_1.store, q_1.bq
FROM (SELECT SUM(i.bottle_qty) AS bq, i.store AS store
      FROM iowa AS i
      GROUP BY i.store
      ORDER BY bq DESC) AS q_1
LIMIT 1;
-- 2633

SELECT i.description
FROM iowa AS i
WHERE i.store=2633
GROUP BY i.item
ORDER BY SUM(i.bottle_qty) DESC
LIMIT 1;
-- Juarez Tequila Gold

SELECT i1.zipcode, i1.category_name, max(i1.bottle_qty)
FROM (
    SELECT zipcode, category_name, SUM(bottle_qty) AS bottle_qty
    FROM iowa
    GROUP BY zipcode, category_name) AS i1
GROUP BY i1.zipcode
ORDER BY i1.bottle_qty DESC
LIMIT 5;
-- 52402|80 PROOF VODKA|235585
-- 52240|80 PROOF VODKA|224621
-- 50314|80 PROOF VODKA|181022
-- 50320|80 PROOF VODKA|163730
-- 51501|80 PROOF VODKA|160206

pragma case_sensitive_like=ON;
SELECT i1.city
FROM iowasmall AS i1
GROUP BY i1.store
HAVING NOT EXISTS (
    SELECT DISTINCT i2.item
    FROM iowasmall AS i2
    WHERE i2.description LIKE '%scotch%'
    EXCEPT
    SELECT i3.item
    FROM iowasmall AS i3
    WHERE i3.store=i1.store);
SELECT i1.item, AVG(i1.value)
-- Empty output

FROM (
    SELECT i2.item AS item, i2.store AS store, AVG(i2.btl_price/i2.liter_size) AS value
    FROM iowa AS i2
    GROUP BY i2.item, i2.store
) AS i1
GROUP BY i1.item
ORDER BY AVG(i1.value)
LIMIT 10;
-- 86390|0.00319487272268173
*/
SELECT COUNT(DISTINCT name)
FROM iowa
WHERE store=2508;
