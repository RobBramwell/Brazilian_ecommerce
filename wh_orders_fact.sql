SELECT
  o.*,
  c.customer_unique_id,
  ROW_NUMBER() OVER (PARTITION BY c.customer_unique_id ORDER BY order_purchase_timestamp ASC) AS order_seq_num,
  COUNT(order_id) OVER (PARTITION BY c.customer_unique_id ORDER BY order_purchase_timestamp ASC) AS lifetime_orders,
  LEAD(order_purchase_timestamp, 1) OVER (PARTITION BY c.customer_unique_id ORDER BY order_purchase_timestamp ASC) AS next_order_at,
  MIN(order_purchase_timestamp) OVER (PARTITION BY c.customer_unique_id ORDER BY order_purchase_timestamp ASC) AS first_order_at
FROM
  `ra-development.rob_training.orders_fact` o
LEFT JOIN
  `ra-development.rob_training.customers_dim` c
ON
  o.customer_id = c.customer_id
ORDER BY
  order_id,
  order_purchase_timestamp
