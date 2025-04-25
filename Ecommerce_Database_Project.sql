CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;


-- Table: brand
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(100) NOT NULL
);

-- Table: product_category
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Table: product
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Table: product_image
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: color
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) NOT NULL
);

-- Table: size_category
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

-- Table: size_option
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    size_value VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Table: product_item
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    variation_id INT,
    stock_quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Table: attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    attribute_category_id INT,
    type_name VARCHAR(100),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

-- Table: product_attribute
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_type_id INT,
    value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);


-- Insert into brand
INSERT INTO brand (brand_name) 
VALUES  ('Nike'), ('Apple'), ('Samsung'), ('Adidas'), ('Sony'),
        ('Dell'), ('HP'), ('Lenovo'), ('Puma'), ('LG');


-- Insert into product_category
INSERT INTO product_category (category_name) 
VALUES  ('Shoes'), ('Phones'), ('Electronics'), ('Laptops'), ('Wearables'),
        ('Home Appliances'), ('Accessories'), ('Gaming'), ('Sports'), ('Audio');

-- Insert into product
INSERT INTO product (product_name, brand_id, category_id, base_price) 
VALUES  ('Air Max 90', 1, 1, 120.00),
        ('iPhone 14', 2, 2, 999.99),
        ('Galaxy S22', 3, 2, 850.00),
        ('Ultraboost 21', 4, 1, 180.00),
        ('PlayStation 5', 5, 8, 499.99),
        ('XPS 13', 6, 4, 1100.00),
        ('Envy x360', 7, 4, 950.00),
        ('ThinkPad X1', 8, 4, 1250.00),
        ('SmartWatch Pro', 9, 5, 200.00),
        ('OLED TV', 10, 6, 1500.00);

-- Insert into product_image with real image URLs from Pexels
INSERT INTO product_image (product_id, image_url) 
VALUES  (1, 'https://images.pexels.com/photos/9940528/pexels-photo-9940528.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (2, 'https://images.pexels.com/photos/30353224/pexels-photo-30353224/free-photo-of-sleek-apple-devices-on-black-background.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (3, 'https://images.pexels.com/photos/13780425/pexels-photo-13780425.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (4, 'https://images.pexels.com/photos/31764072/pexels-photo-31764072/free-photo-of-man-running-on-rocky-trail-in-izmir-turkiye.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (5, 'https://images.pexels.com/photos/13189272/pexels-photo-13189272.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (6, 'https://images.pexels.com/photos/7594369/pexels-photo-7594369.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (7, 'https://images.pexels.com/photos/699459/pexels-photo-699459.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (8, 'https://images.pexels.com/photos/13279391/pexels-photo-13279391.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (9, 'https://images.pexels.com/photos/10321190/pexels-photo-10321190.jpeg?auto=compress&cs=tinysrgb&w=600'),
        (10, 'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&w=600');


-- Insert into color
INSERT INTO color (color_name) 
VALUES  ('Black'), ('White'), ('Red'), ('Blue'), ('Green'),
        ('Yellow'), ('Gray'), ('Purple'), ('Pink'), ('Orange');

-- Insert into size_category
INSERT INTO size_category (category_name) 
VALUES  ('Clothing Size'), ('Shoe Size'), ('Device Storage'), ('TV Size'), ('Watch Size'),
        ('Laptop Screen'), ('Phone Screen'), ('Battery Size'), ('Box Size'), ('USB Size');

-- Insert into size_option
INSERT INTO size_option (size_category_id, size_value) 
VALUES  (1, 'S'), (1, 'M'), (1, 'L'), (2, '42'), (2, '43'),
        (3, '128GB'), (3, '256GB'), (4, '55"'), (5, '44mm'), (6, '13.3"');

-- Insert into product_variation
INSERT INTO product_variation (product_id, color_id, size_option_id) 
VALUES  (1, 1, 4),
        (2, 2, 6),
        (3, 3, 7),
        (4, 4, 5),
        (5, 5, 8),
        (6, 6, 10),
        (7, 7, 10),
        (8, 8, 10),
        (9, 9, 9),
        (10, 10, 8);

-- Insert into product_item
INSERT INTO product_item (product_id, variation_id, stock_quantity, price) 
VALUES  (1, 1, 100, 125.00),
        (2, 2, 50, 1049.00),
        (3, 3, 75, 890.00),
        (4, 4, 120, 185.00),
        (5, 5, 20, 510.00),
        (6, 6, 30, 1150.00),
        (7, 7, 40, 990.00),
        (8, 8, 25, 1300.00),
        (9, 9, 80, 220.00),
        (10, 10, 15, 1550.00);

-- Insert into attribute_category
INSERT INTO attribute_category (category_name) 
VALUES  ('Physical'), ('Technical'), ('Style'), ('Performance'), ('Durability'),
        ('Material'), ('Battery'), ('Color Info'), ('Dimensions'), ('Warranty');

-- Insert into attribute_type
INSERT INTO attribute_type (attribute_category_id, type_name) 
VALUES  (1, 'Weight'), (1, 'Height'), (2, 'RAM'), (2, 'Processor'), (3, 'Fit'),
        (4, 'Speed'), (5, 'Resistance'), (6, 'Fabric'), (7, 'Battery Life'), (10, 'Warranty Duration');

-- Insert into product_attribute
INSERT INTO product_attribute (product_id, attribute_type_id, value) 
VALUES  (1, 1, '1.2kg'), (2, 3, '6GB'), (3, 4, 'Snapdragon 8 Gen 1'),
        (4, 5, 'Slim Fit'), (5, 6, '8K Gaming'), (6, 3, '16GB'),
        (7, 4, 'Ryzen 5'), (8, 3, '32GB'), (9, 9, '36 hours'), (10, 10, '2 years');


-- CREATING USERS AND GRANTING PRIVILEGES

-- Create an admin user with full access to the ecommerce database
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123!';
GRANT ALL PRIVILEGES ON ecommerce.* TO 'admin_user'@'localhost';

-- Create an inventory manager with permission to view and update product-related tables
CREATE USER 'inventory_manager'@'localhost' IDENTIFIED BY 'InventoryPass123!';
GRANT SELECT, INSERT, UPDATE ON ecommerce.product TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE ON ecommerce.product_item TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE ON ecommerce.product_image TO 'inventory_manager'@'localhost';

-- Create a sales viewer with read-only access to product and category data
CREATE USER 'sales_viewer'@'localhost' IDENTIFIED BY 'ViewerPass123!';
GRANT SELECT ON ecommerce.product TO 'sales_viewer'@'localhost';
GRANT SELECT ON ecommerce.product_item TO 'sales_viewer'@'localhost';
GRANT SELECT ON ecommerce.product_category TO 'sales_viewer'@'localhost';

-- Applying the privilege changes
FLUSH PRIVILEGES;
