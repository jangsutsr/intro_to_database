/*
SELECT q_1.store, q_1.bq
FROM (SELECT SUM(i.bottle_qty) AS bq, i.store AS store
      FROM iowa AS i
      GROUP BY i.store
      ORDER BY bq DESC) AS q_1
LIMIT 1;

SELECT i.description
FROM iowa AS i
WHERE i.store=2633
GROUP BY i.item, i.description
ORDER BY i.bottle_qty DESC
LIMIT 1;

*/

SELECT i1.zipcode, i1.category_name, SUM(i1.bottle_qty)
FROM iowasmall AS i1
GROUP BY i1.zipcode, i1.category_name;
