-- Total Transactions
SELECT
  COUNT(*) AS "count"
FROM
  "public"."orders"


-- Total Profit
SELECT
  SUM("public"."orders"."profit") AS "sum"
FROM
  "public"."orders"


-- Number of Orders grouped by Ship Mode
SELECT
  "public"."orders"."ship_mode" AS "ship_mode",
  COUNT(*) AS "count"
FROM
  "public"."orders"
GROUP BY
  "public"."orders"."ship_mode"
ORDER BY
  "public"."orders"."ship_mode" ASC


-- Pareto Sum of Sales, Grouped by SubCategory
SELECT
  "public"."orders"."sub_category" AS "sub_category",
  "public"."orders"."category" AS "category",
  SUM("public"."orders"."sales") AS "sum"
FROM
  "public"."orders"
GROUP BY
  "public"."orders"."sub_category",
  "public"."orders"."category"
ORDER BY
  "sum" DESC,
  "public"."orders"."sub_category" ASC,
  "public"."orders"."category" ASC


-- Pareto Sum of Profit, Grouped by SubCategory
SELECT
  "public"."orders"."sub_category" AS "sub_category",
  "public"."orders"."category" AS "category",
  SUM("public"."orders"."profit") AS "sum"
FROM
  "public"."orders"
GROUP BY
  "public"."orders"."sub_category",
  "public"."orders"."category"
ORDER BY
  "sum" DESC,
  "public"."orders"."sub_category" ASC,
  "public"."orders"."category" ASC


-- Linechart of Profits
SELECT
  "public"."orders"."profit" AS "profit",
  "public"."orders"."order_date" AS "order_date",
  "public"."orders"."order_id" AS "order_id"
FROM
  "public"."orders"


-- Average quantity per month
SELECT
  DATE_TRUNC('month', "public"."orders"."order_date") AS "order_date",
  AVG("public"."orders"."quantity") AS "avg"
FROM
  "public"."orders"
GROUP BY
  DATE_TRUNC('month', "public"."orders"."order_date")
ORDER BY
  DATE_TRUNC('month', "public"."orders"."order_date") ASC


-- Sales per country (map)
SELECT
  "public"."orders"."country" AS "country",
  COUNT(*) AS "count"
FROM
  "public"."orders"
GROUP BY
  "public"."orders"."country"
ORDER BY
  "public"."orders"."country" ASC


-- Sales pert state (US map)
SELECT
  "public"."orders"."state" AS "state",
  COUNT(*) AS "count"
FROM
  "public"."orders"
GROUP BY
  "public"."orders"."state"
ORDER BY
  "public"."orders"."state" ASC
