
-- Goods by brands
SELECT
 name as 'Наименование',
 (SELECT brand_name FROM brands WHERE goods.brand_id=brands.id) as 'Брэнд'
 FROM goods;

-- Goods by categorys and subcategories
SELECT
 name as 'Наименование',
 (SELECT category FROM catalogs WHERE goods.category_id=catalogs.id) as 'Категория',
 (SELECT name FROM sub_categorys WHERE goods.sub_category_id=sub_categorys.id) as 'Подкатегория'
 FROM goods;
 

-- Get user info + последний заказ
SELECT
  u.id,
  u.user_name as 'Логин',
  u.email as 'Email',
  u.avatar_blob_id as 'Аватар',
  CONCAT(p.first_name, ' ', p.last_name) AS 'Имя',
  p.birthday AS 'Дата рождения',
  p.city as 'Город',
  p.phone as 'Телефон',
  o.id as 'ID заказа',
  o.created_at as 'Дата заказа'
  FROM users AS u 
   JOIN profiles AS p
    ON u.id = p.user_id
   JOIN orders AS o
    ON u.id = o.user_id;
   

