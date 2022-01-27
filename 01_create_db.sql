-- Создаём БД

DROP DATABASE IF EXISTS yoga_shop;
CREATE DATABASE yoga_shop;

-- Делаем её текущей
USE yoga_shop;

-- Таблица1 Пользователи
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки', 
  user_name VARCHAR(100) NOT NULL COMMENT 'Логин пользователя',
  email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Почта',
  avatar_blob_id VARCHAR(250) DEFAULT NULL COMMENT 'Аватар',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Пользователи';  


-- Таблица2 Профили
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT 'Ссылка на пользователя',
  first_name VARCHAR(100) NOT NULL COMMENT 'Имя пользователя',
  last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия пользователя',  
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT 'Телефон',
  gender ENUM ('m', 'f', 'n') DEFAULT 'n' COMMENT 'Пол',
  birthday DATE COMMENT 'Дата рождения',
  city VARCHAR(130) COMMENT 'Город проживания',
  country VARCHAR(130) COMMENT 'Страна проживания',
  address_delivery VARCHAR(130) COMMENT 'Адрес доставки',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Профили';

-- Добавляем внешние ключи
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

-- Таблица Товары

DROP TABLE IF EXISTS goods;     
     CREATE TABLE goods (
     id SERIAL PRIMARY KEY,
     name VARCHAR(255) COMMENT 'Название',
     brand_id INT UNSIGNED COMMENT 'Брэнд',
     category_id INT UNSIGNED COMMENT 'Категория' ,
     sub_category_id INT UNSIGNED COMMENT 'Подкатегория' ,
     price DECIMAL(8,2) COMMENT 'Цена' ,
     amount INT COMMENT 'Количество на складе',
     storehouses_id INT UNSIGNED COMMENT 'Склад',
     country_origin_id INT UNSIGNED COMMENT 'Страна производства',
     INDEX (storehouses_id),
     INDEX (country_origin_id),
     INDEX (brand_id)
     ) COMMENT 'Товары';
        
         
-- Таблица3 Категории товаров

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки',
  category VARCHAR(100) NOT NULL COMMENT 'Название категории',
  short_description VARCHAR(250) NOT NULL COMMENT 'Короткое описание',
  image_blob_id VARCHAR(250) DEFAULT NULL COMMENT 'Идентификатор картинки категории',
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
) COMMENT 'Категории товаров';

-- Таблица4 Подкатегории

DROP TABLE IF EXISTS sub_categorys;
CREATE TABLE sub_categorys (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  short_description VARCHAR(250) NOT NULL Default 'Enter description' COMMENT 'Короткое описание',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Подкатегории товаров';

-- Добавляем внешние ключи
ALTER TABLE sub_categorys
  ADD CONSTRAINT catalog_id_fk 
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
      ON DELETE CASCADE;
     
     SET FOREIGN_KEY_CHECKS=0;
    INSERT into sub_categorys (id, name, catalog_id)
    Values
    (1, 'pillows_platforms', 1),
    (2, 'covers_bags', 2),
    (3, 'bricks_blocks', 3),
    (4, 'blanckets_plaids', 4),
    (5, 'belts_ropes', 5),
    (6, 'wood_goods_chairs', 6),
    (7, 'equipments', 7),
    (8, 'bolsters', 8),
    (9, 'hammoks', 9),
    (10, 'YOGA_MATS', 10);
   SET FOREIGN_KEY_CHECKS=1;
  
  
  -- Таблица Заказы
     
     DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  -- KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

-- Добавляем внешние ключи
ALTER TABLE orders
  ADD CONSTRAINT orders_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

     
 -- Таблица5 Корзина
DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

-- Добавляем внешние ключи
ALTER TABLE orders_products
  ADD CONSTRAINT orders_id_fk 
    FOREIGN KEY (order_id) REFERENCES orders(id),
  ADD CONSTRAINT product_id_fk 
    FOREIGN KEY (product_id) REFERENCES goods(id)  
  ;
     
-- Таблица6 Пожелания покупателя при заказе

DROP TABLE IF EXISTS buy;
CREATE TABLE buy	 (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  buy_description VARCHAR(250) NOT NULL COMMENT 'Описание пожеланий',
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Пожелания покупателя';

-- Добавляем внешние ключи
ALTER TABLE buy
  ADD CONSTRAINT buy_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE;
   
-- Таблица7 Список складов

DROP TABLE IF EXISTS storehouses_list;
CREATE TABLE storehouses_list(
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  storehouse_name VARCHAR(250) NOT NULL
) COMMENT = 'Список складов';

-- Добавляем внешние ключи
ALTER TABLE storehouses_list
  ADD CONSTRAINT storehouses_id_fk 
    FOREIGN KEY (id) REFERENCES goods(storehouses_id);
   
-- Таблица8 Запасы на складе

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouses_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';


-- Добавляем внешние ключи
ALTER TABLE storehouses_products
  ADD CONSTRAINT storehouses_products_fk 
    FOREIGN KEY (storehouses_id) REFERENCES storehouses_list(id);

   
-- Таблица9 Список этапов покупки

DROP TABLE IF EXISTS step;
CREATE TABLE step(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  step_name VARCHAR(250) NOT NULL
) COMMENT = 'Список этапов покупки';

INSERT INTO step (step_name) VALUES ("Payment");
INSERT INTO step (step_name) VALUES ("Packing");
INSERT INTO step (step_name) VALUES ("Transfer");
INSERT INTO step (step_name) VALUES ("Delivery");

   -- Таблица10 Этапы покупки
   
DROP TABLE IF EXISTS buy_step;
CREATE TABLE buy_step (
  id SERIAL PRIMARY KEY,
  buy_id INT UNSIGNED,
  step_id INT UNSIGNED,
  date_step_beg DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_step_end DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Этапы покупки';

-- Добавляем внешние ключи
ALTER TABLE buy_step
  ADD CONSTRAINT buy_step_1_fk 
    FOREIGN KEY (buy_id) REFERENCES buy(id),
  ADD CONSTRAINT buy_step_2_fk  
    FOREIGN KEY (step_id) REFERENCES step(id);

-- Таблица11 Страны производители
   
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  country VARCHAR(200) NOT NULL
) COMMENT 'Страны производители';

-- Добавляем внешние ключи
ALTER TABLE countries
  ADD CONSTRAINT country_id_fk 
    FOREIGN KEY (id) REFERENCES goods(country_origin_id);
    
   SET FOREIGN_KEY_CHECKS=0;
     
   INSERT INTO countries VALUES
   (1, 'China'),
   (2,'Germany'),
   (3,'India'),
   (4, 'Russia'),
   (5, 'Poland'),
   (6, 'England'),
   (7, 'Bangladesh'),
   (8,'Thailand'),
   (9, 'Vietnam'),
   (10, 'USA');
  
  SET FOREIGN_KEY_CHECKS=1;
   
   -- Таблица12 Брэнд производителя
   
   DROP TABLE IF EXISTS brands;
CREATE TABLE brands(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  brand_name VARCHAR(250) NOT NULL
) COMMENT = 'Брэнд производителя';


-- Добавляем внешние ключи
 ALTER TABLE brands
  ADD CONSTRAINT brands_id_fk 
  FOREIGN KEY (id) REFERENCES goods(brand_id);
 
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO brands VALUES 
(1, 'Ojas'),
(2, 'Salamander'),
(3, 'Dabur'),
(4, 'Aasha Dent'),
(5, 'Devi Yoga'),
(6, 'Himalaya Herbals'),
(7, 'AKO Yoga'),
(8, 'Foco'),
(9, 'Hem'),
(10, 'Fifty');
SET FOREIGN_KEY_CHECKS=1;