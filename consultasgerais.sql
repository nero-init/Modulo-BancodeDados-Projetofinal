Select * 
FROM vendas 
Order BY "Date" ASC
LIMIT 3;

Select * 
FROM vendas 
Where "Qty" = 5;

SELECT *
FROM vendas
JOIN produtos ON vendas.Codigo = produtos.Codigo;

select * from produtos limit 5;
select * from vendas limit 5;

CREATE OR REPLACE VIEW ranking_products_of_country AS
WITH ranked_sales AS (
    SELECT 
        "ship-country" AS pais,
        SUM("Qty") AS quantidade_total,
        p."Produto" AS codigo_produtos,
        ROW_NUMBER() OVER (PARTITION BY "ship-country" ORDER BY SUM("Qty") DESC) AS rank
    FROM 
        vendas v
    INNER JOIN 
        produtos p ON v."Codigo" = p."Codigo"
    GROUP BY 
        "ship-country", p."Produto"
)
SELECT 
    pais,
    quantidade_total,
    codigo_produtos
FROM 
    ranked_sales
WHERE 
    rank = 1;


WITH ranked_sales AS (
    SELECT 
        "ship-country" as pais,
        SUM("Qty") as quantidade_total,
        p."Produto" as codigo_produtos,
        ROW_NUMBER() OVER (PARTITION BY "ship-country" ORDER BY SUM("Qty") DESC) AS rank
    FROM 
        vendas v
    INNER JOIN 
        produtos p ON v."Codigo" = p."Codigo"
    GROUP BY 
        "ship-country", p."Produto"
)
SELECT 
    pais,
    quantidade_total,
    codigo_produtos
FROM 
    ranked_sales
WHERE 
    rank = 1;



SELECT 
    "ship-country" as pais,
    SUM("Qty") as quantidade_total
FROM 
    vendas
WHERE 
    "ship-country" = 'BR'  --- seta o pais aqui
GROUP BY 
    "ship-country";
	
SELECT 
    "ship-country" as pais,
    SUM("Qty") as quantidade_total,
    p."Produto" as Codigo_produtos
FROM 
    vendas v
INNER JOIN 
    produtos p ON v."Codigo" = p."Codigo"
GROUP BY 
    "ship-country", p."Produto";

	
	
SELECT 
    "ship-country" as pais,
    SUM("Qty") as quantidade_total
FROM 
    vendas
GROUP BY 
    "ship-country";


SELECT
    "Order ID",
    "Date",
    "ship-service-level",
    "Style",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
LIMIT 10;


SELECT DISTINCT "Courier Status"
FROM vendas;

SELECT DISTINCT
    "Order ID",
    "Date",
    "ship-service-level",
    "Style",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
LIMIT 10;

SELECT
    "Order ID",
    "Date",
    "ship-service-level",
    "Style",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Shipped'
LIMIT 10;

SELECT
    "Order ID",
    "Date",
    "ship-service-level",
    "Style",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
    p."Produto" as Codigo_produtos,
    ROW_NUMBER() OVER (ORDER BY SUM(1) DESC) AS rank
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Shipped'
GROUP BY "Order ID", "Date", "ship-service-level", "Style", "Courier Status", "Qty", "ship-country", "Fulfillment", p."Produto"
LIMIT 10;


CREATE VIEW media_quantidade_por_pais AS
SELECT "ship-country", AVG("Qty") AS media_quantidade
FROM vendas
GROUP BY "ship-country";

SELECT * FROM media_quantidade_por_pais;

CREATE OR REPLACE VIEW mediana_por_produto AS
WITH QuantidadesPorProduto AS (
    SELECT
        p."Produto" AS Codigo_produtos,
        v."Qty",
        NTILE(2) OVER(PARTITION BY p."Produto" ORDER BY v."Qty") AS Quantile
    FROM vendas v
    INNER JOIN produtos p ON v."Codigo" = p."Codigo"
)
SELECT
    Codigo_produtos,
    AVG("Qty") AS Mediana
FROM QuantidadesPorProduto
WHERE Quantile = 2
GROUP BY Codigo_produtos;

select * from mediana_por_produto;

CREATE OR REPLACE VIEW ranking_totalproducts_of_country AS
WITH ranked_sales AS (
    SELECT 
        "ship-country" AS pais,
        SUM("Qty") AS quantidade_total,
        p."Produto" AS codigo_produtos,
        ROW_NUMBER() OVER (PARTITION BY p."Produto" ORDER BY SUM("Qty") DESC) AS rank
    FROM 
        vendas v
    INNER JOIN 
        produtos p ON v."Codigo" = p."Codigo"
    GROUP BY 
        "ship-country", p."Produto"
)
SELECT 
    pais,
    quantidade_total,
    codigo_produtos
FROM 
    ranked_sales
WHERE 
    rank = 1;
	

select * from ranking_totalproducts_of_country;
select * from produtos limit 5;
select * from vendas limit 5;

-- Aqui é o Script Q1
CREATE OR REPLACE VIEW ranking_products_of_country AS
WITH ranked_sales AS (
    SELECT 
        "ship-country" AS pais,
        SUM("Qty") AS quantidade_total,
        p."Produto" AS codigo_produtos,
        ROW_NUMBER() OVER (PARTITION BY "ship-country" ORDER BY SUM("Qty") DESC) AS rank
    FROM 
        vendas v
    INNER JOIN 
        produtos p ON v."Codigo" = p."Codigo"
    GROUP BY 
        "ship-country", p."Produto"
)
SELECT 
    pais,
    quantidade_total,
    codigo_produtos
FROM 
    ranked_sales
WHERE 
    rank = 1;
--

WITH ranked_sales AS (
    SELECT 
        "ship-country" as pais,
        SUM("Qty") as quantidade_total,
        p."Produto" as codigo_produtos,
        ROW_NUMBER() OVER (PARTITION BY "ship-country" ORDER BY SUM("Qty") DESC) AS rank
    FROM 
        vendas v
    INNER JOIN 
        produtos p ON v."Codigo" = p."Codigo"
    GROUP BY 
        "ship-country", p."Produto"
)
SELECT 
    pais,
    quantidade_total,
    codigo_produtos
FROM 
    ranked_sales
WHERE 
    rank = 1;



SELECT 
    "ship-country" as pais,
    SUM("Qty") as quantidade_total
FROM 
    vendas
WHERE 
    "ship-country" = 'BR'  -- Substitua 'Nome do País Específico' pelo país desejado
GROUP BY 
    "ship-country";
	
SELECT 
    "ship-country" as pais,
    SUM("Qty") as quantidade_total,
    p."Produto" as Codigo_produtos
FROM 
    vendas v
INNER JOIN 
    produtos p ON v."Codigo" = p."Codigo"
GROUP BY 
    "ship-country", p."Produto";

SELECT 
    v."ship-country" as pais,
    p."Produto" as Codigo_produtos,
    AVG(v."Preco") as media_mensal
FROM 
    vendas v
INNER JOIN 
    produtos p ON v."Codigo" = p."Codigo"
GROUP BY 
    v."ship-country", p."Produto";


	
CREATE OR REPLACE VIEW ranking_country_sells AS
SELECT 
    "ship-country" AS pais,
    SUM("Qty") AS quantidade_total
FROM 
    vendas
GROUP BY 
    "ship-country";



SELECT
    "Order ID",
    "Date",
    "ship-service-level",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
	"Preco",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
LIMIT 10;

SELECT
    "Order ID",
    "Date",
    "ship-service-level",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment"
FROM vendas v
LIMIT 10;

WITH orders_ranked AS (
    SELECT
        "ship-country",
        "Date",
        COUNT("Order ID") AS total_orders,
        RANK() OVER(PARTITION BY "ship-country" ORDER BY COUNT("Order ID") DESC) AS rank
    FROM
        vendas
    GROUP BY
        "ship-country",
        "Date"
)
SELECT
    "ship-country",
    "Date",
    total_orders
FROM
    orders_ranked
WHERE
    rank = 1;


SELECT DISTINCT ON ("ship-country")
    "ship-country",
    "Date",
    COUNT("Order ID") AS total_orders
FROM
    vendas
GROUP BY
    "ship-country",
    "Date"
ORDER BY
    "ship-country",
    COUNT("Order ID") DESC;
	
CREATE VIEW rank_dia_pais AS
SELECT DISTINCT ON ("ship-country")
    "ship-country",
    "Date",
    COUNT("Order ID") AS total_orders
FROM
    vendas
GROUP BY
    "ship-country",
    "Date"
ORDER BY
    "ship-country",
    COUNT("Order ID") DESC;
	
select * from rank_dia_pais

SELECT
    "Courier Status",
    "Qty",
    "ship-country",
	"Preco",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Cancelled'
LIMIT 10;


SELECT
    "Courier Status",
    "Qty",
    "ship-country",
	"Preco",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Cancelled'
LIMIT 10;

SELECT
    p."Produto" as Codigo_produtos,
    COUNT(*) AS total_cancelamentos,
    SUM(v."Qty" * CAST(REPLACE(p."Preco", '$', '') AS FLOAT)) AS prejuizo_total
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE v."Courier Status" = 'Cancelled'
GROUP BY p."Produto"
ORDER BY total_cancelamentos DESC
LIMIT 1;

CREATE VIEW cancelamentos_prejuizo AS
SELECT
    p."Produto" AS Codigo_produtos,
    COUNT(*) AS total_cancelamentos,
    SUM(v."Qty" * CAST(REPLACE(p."Preco", '$', '') AS FLOAT)) AS prejuizo_total
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE v."Courier Status" = 'Cancelled'
GROUP BY p."Produto"
ORDER BY total_cancelamentos DESC;



SELECT DISTINCT "Courier Status"
FROM vendas;

SELECT DISTINCT
    "Order ID",
    "Date",
    "ship-service-level",
    "Style",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"

LIMIT 10;

SELECT
    "Order ID",
    "Date",
    "ship-service-level",
    "Style",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Shipped'
LIMIT 10;

SELECT
    "Order ID",
    "Date",
    "ship-service-level",
    "Style",
    "Courier Status",
    "Qty",
    "ship-country",
    "Fulfillment",
    p."Produto" as Codigo_produtos,
    ROW_NUMBER() OVER (ORDER BY SUM(1) DESC) AS rank
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Shipped'
GROUP BY "Order ID", "Date", "ship-service-level", "Style", "Courier Status", "Qty", "ship-country", "Fulfillment", p."Produto"
LIMIT 10;

SELECT DISTINCT "ship-service-level"
FROM vendas;

SELECT 
    MIN("Date") AS primeira_data,
    MAX("Date") AS ultima_data
FROM 
    vendas;


SELECT
    v."Order ID",
    v."Date",
    v."ship-service-level",
    v."Courier Status",
    v."Qty",
    v."ship-country",
    v."Fulfillment",
    CAST(REPLACE(p."Preco", '$', '') AS FLOAT) as Preco,
    p."Produto" as Codigo_produtos
FROM 
    vendas v
INNER JOIN 
    produtos p ON v."Codigo" = p."Codigo"
WHERE 
    v."Courier Status" = 'Shipped' AND v."ship-country" = 'BR'
LIMIT 10;

SELECT 
    TO_CHAR(TO_DATE(v."Date", 'MM/DD/YYYY'), 'YYYY-MM') AS mes,
    SUM(CAST(REPLACE(p."Preco", '$', '') AS FLOAT), 2) as faturamento_total
FROM 
    vendas v
INNER JOIN 
    produtos p ON v."Codigo" = p."Codigo"
WHERE 
    v."Courier Status" = 'Shipped' AND v."ship-country" = 'BR'
GROUP BY 
    TO_CHAR(TO_DATE(v."Date", 'MM/DD/YYYY'), 'YYYY-MM');


SELECT 
    TO_CHAR(TO_DATE(v."Date", 'MM/DD/YYYY'), 'YYYY-MM') AS mes,
    ROUND(SUM(CAST(REPLACE(p."Preco", '$', '') AS FLOAT))::numeric, 2) as faturamento_total
FROM 
    vendas v
INNER JOIN 
    produtos p ON v."Codigo" = p."Codigo"
WHERE 
    v."Courier Status" = 'Shipped' AND v."ship-country" = 'BR'
GROUP BY 
    TO_CHAR(TO_DATE(v."Date", 'MM/DD/YYYY'), 'YYYY-MM');

CREATE OR REPLACE VIEW fat_mbr AS
SELECT 
    TO_CHAR(TO_DATE(v."Date", 'MM/DD/YYYY'), 'MM-YYYY') AS mes,
    ROUND(SUM(CAST(REPLACE(p."Preco", '$', '') AS FLOAT))::numeric, 2) as faturamento_total
FROM 
    vendas v
INNER JOIN 
    produtos p ON v."Codigo" = p."Codigo"
WHERE 
    v."Courier Status" = 'Shipped' AND v."ship-country" = 'BR'
GROUP BY 
    TO_CHAR(TO_DATE(v."Date", 'MM/DD/YYYY'), 'MM-YYYY');



SELECT * FROM fat_mbr

SELECT 
    "Produto",
    CAST(REPLACE("Preco", '$', '') AS FLOAT) AS "Preco"
FROM 
    produtos;
	
CREATE VIEW dvp_preco AS
SELECT 
    "Produto",
    CAST(REPLACE("Preco", '$', '') AS FLOAT) AS "Preco"
FROM 
    produtos;

SELECT
    "Courier Status",
    "ship-country"
FROM vendas v
WHERE "Courier Status" = 'Cancelled'
LIMIT 10;

SELECT
    "Courier Status",
    "ship-country",
    p."Produto" as Codigo_produtos
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Cancelled'
LIMIT 10;

SELECT 
    "ship-country" AS Pais,
    p."Produto" AS Codigo_produtos,
    COUNT(*) AS Total_Cancelled
FROM vendas v
INNER JOIN produtos p ON v."Codigo" = p."Codigo"
WHERE "Courier Status" = 'Cancelled'
GROUP BY "ship-country", p."Produto"
ORDER BY Pais, Total_Cancelled DESC;

CREATE VIEW cancel_country AS
WITH CancelamentosPorPais AS (
    SELECT 
        "ship-country" AS Pais,
        p."Produto" AS Codigo_produtos,
        COUNT(*) AS Total_Cancelled,
        ROW_NUMBER() OVER (PARTITION BY "ship-country" ORDER BY COUNT(*) DESC) AS Rank
    FROM vendas v
    INNER JOIN produtos p ON v."Codigo" = p."Codigo"
    WHERE "Courier Status" = 'Cancelled'
    GROUP BY "ship-country", p."Produto"
)
SELECT Pais, Codigo_produtos, Total_Cancelled
FROM CancelamentosPorPais
WHERE Rank = 1;

