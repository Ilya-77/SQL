
-- Goods view

CREATE OR REPLACE VIEW goods_view AS
SELECT id, name, price, amount FROM goods;

-- Goods by categorys and subcategories

CREATE OR REPLACE VIEW goods_cat_subcat_view AS
SELECT g.id, g.name as 'Наименование', c.category as 'Категория', sub.name as 'Подкатегория' 
  FROM goods g
   LEFT JOIN catalogs AS c
    ON g.category_id = c.id
   LEFT JOIN sub_categorys AS sub
    ON g.sub_category_id = sub.id;

-- Goods by users and orders
   
CREATE OR REPLACE VIEW goods_users_orders AS
SELECT g.id, g.name as 'Наименование', 
p.user_id,
CONCAT(p.first_name, ' ', p.last_name) AS 'ФИО',
op.id as 'ID Заказа', op.created_at as 'Дата заказа'
  FROM orders_products op
   LEFT JOIN orders AS o
    ON op.order_id = o.id
   LEFT JOIN goods AS g
    ON op.product_id = g.id
    LEFT JOIN profiles AS p
    ON o.user_id = p.user_id;


