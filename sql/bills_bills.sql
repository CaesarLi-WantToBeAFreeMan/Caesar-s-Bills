-- Host: 127.0.0.1    Database: bills
-- ------------------------------------------------------
-- Server version	8.0.41
-- Table structure for table `bills`

DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`(
    `id` bigint PRIMARY KEY AUTO_INCREMENT COMMENT 'unique id for a bill',
    `item` varchar(255) NOT NULL COMMENT 'name of a bill',
    `price` decimal(19,2) NOT NULL COMMENT 'price of a bill',
    `date` date NOT NULL COMMENT 'date when the bill was paid',
    KEY `index_date`(`date`) COMMENT 'index for date'
)ENGINE = InnoDB AUTO_INCREMENT = 121 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES
    (1, 'Cheeseburger', 5.99, '2025-01-03'),
    (2, 'Coca-Cola', 1.99, '2025-01-10'),
    (3, 'Pizza', 12.49, '2025-01-15'),
    (4, 'Latte', 4.50, '2025-01-20'),
    (5, 'French Fries', 2.99, '2025-01-25'),
    (6, 'Chicken Wings', 8.99, '2025-01-28'),
    (7, 'Iced Tea', 2.50, '2025-02-01'),
    (8, 'Hot Dog', 3.25, '2025-02-05'),
    (9, 'Sandwich', 6.99, '2025-02-07'),
    (10, 'Muffin', 2.79, '2025-02-10'),
    (11, 'Pasta', 10.49, '2025-02-12'),
    (12, 'Smoothie', 5.99, '2025-02-14'),
    (13, 'Hamburger', 6.50, '2025-02-16'),
    (14, 'Soda', 1.50, '2025-02-01'),
    (15, 'Salad', 7.99, '2025-01-11'),
    (16, 'Ice Cream', 4.99, '2025-01-14'),
    (17, 'Frappuccino', 5.50, '2025-02-03'),
    (18, 'Bagel', 2.50, '2025-01-02'),
    (19, 'Burrito', 8.25, '2025-01-06'),
    (20, 'Coffee', 3.00, '2025-01-17'),
    (21, 'Juice', 3.50, '2025-02-06'),
    (22, 'Tacos', 9.99, '2025-02-09'),
    (23, 'Cupcake', 3.75, '2025-02-13'),
    (24, 'Pancakes', 7.25, '2025-01-22'),
    (25, 'Mojito', 8.00, '2025-01-29'),
    (26, 'Steak', 19.99, '2025-02-02'),
    (27, 'Clam Chowder', 6.75, '2025-02-08'),
    (28, 'Gourmet Pizza', 15.49, '2025-01-30'),
    (29, 'Hot Chocolate', 4.00, '2025-02-04'),
    (30, 'Lemonade', 2.75, '2025-01-09'),
    (31, 'Macarons', 2.99, '2025-01-23'),
    (32, 'Cheese Fries', 4.25, '2025-02-11'),
    (33, 'Fried Chicken', 10.99, '2025-02-15'),
    (34, 'Waffles', 5.75, '2025-02-07'),
    (35, 'Toast', 1.50, '2025-01-19'),
    (36, 'Cinnamon Roll', 3.50, '2025-01-16'),
    (37, 'Veggie Burger', 8.50, '2025-01-21'),
    (38, 'Chili', 7.00, '2025-01-26'),
    (39, 'Nachos', 6.75, '2025-02-01'),
    (40, 'Spring Rolls', 4.50, '2025-02-04'),
    (41, 'Baked Ziti', 12.99, '2025-02-14'),
    (42, 'Donut', 1.99, '2025-02-05'),
    (43, 'Kombucha', 3.99, '2025-02-08'),
    (44, 'Steak Frites', 18.99, '2025-02-10'),
    (45, 'Cheese Pizza', 10.99, '2025-01-24'),
    (46, 'Croissant', 2.50, '2025-02-02'),
    (47, 'Chicken Salad', 9.99, '2025-02-11'),
    (48, 'Omelette', 8.00, '2025-01-07'),
    (49, 'Pudding', 3.25, '2025-02-13'),
    (50, 'BBQ Ribs', 16.50, '2025-02-01'),
    (51, 'Fries and Gravy', 4.50, '2025-01-05'),
    (52, 'Bacon Cheeseburger', 6.99, '2025-02-03'),
    (53, 'Fruit Salad', 5.50, '2025-02-12'),
    (54, 'Grilled Cheese', 4.00, '2025-01-04'),
    (55, 'Buffalo Wings', 9.99, '2025-02-06'),
    (56, 'Lobster Roll', 20.99, '2025-02-09'),
    (57, 'Bagel with Cream Cheese', 3.00, '2025-01-18'),
    (58, 'Chicken Quesadilla', 7.99, '2025-02-07'),
    (59, 'Cucumber Salad', 4.25, '2025-02-02'),
    (60, 'Beef Tacos', 6.00, '2025-01-12'),
    (61, 'Popcorn', 2.00, '2025-02-14'),
    (62, 'Grilled Salmon', 17.50, '2025-02-15'),
    (63, 'Apple Pie', 4.99, '2025-02-06'),
    (64, 'Ravioli', 13.50, '2025-01-30'),
    (65, 'Fish and Chips', 11.99, '2025-01-31'),
    (66, 'Pork Belly', 14.99, '2025-02-12'),
    (67, 'Lamb Chops', 22.99, '2025-02-04'),
    (68, 'Steamed Dumplings', 7.99, '2025-01-08'),
    (69, 'Pork Schnitzel', 16.00, '2025-01-20'),
    (70, 'Tuna Salad', 6.50, '2025-01-13'),
    (71, 'Chicken Tenders', 6.99, '2025-01-27'),
    (72, 'Grilled Shrimp', 13.99, '2025-02-01'),
    (73, 'Pesto Pasta', 11.99, '2025-02-05'),
    (74, 'Caesar Salad', 8.99, '2025-02-07'),
    (75, 'Steak Sandwich', 12.99, '2025-02-10'),
    (76, 'Cheese Plate', 11.50, '2025-02-03'),
    (77, 'Poke Bowl', 14.50, '2025-01-02'),
    (78, 'Vegan Burger', 9.50, '2025-01-11'),
    (79, 'Pulled Pork Sandwich', 10.00, '2025-01-06'),
    (80, 'Shakshuka', 8.99, '2025-02-09'),
    (81, 'Mushroom Risotto', 13.00, '2025-01-19'),
    (82, 'Fettuccine Alfredo', 14.50, '2025-02-04'),
    (83, 'Grilled Veggies', 6.00, '2025-02-01'),
    (84, 'Vegetable Soup', 5.00, '2025-01-04'),
    (85, 'Philly Cheesesteak', 10.99, '2025-02-10'),
    (86, 'Churros', 3.50, '2025-01-15'),
    (87, 'Ceviche', 11.00, '2025-02-02'),
    (88, 'Eggplant Parmesan', 12.00, '2025-02-12'),
    (89, 'Pineapple Fried Rice', 9.99, '2025-01-17'),
    (90, 'Pastrami Sandwich', 9.50, '2025-01-25'),
    (91, 'Grilled Octopus', 15.99, '2025-01-29'),
    (92, 'Tiramisu', 4.99, '2025-02-08'),
    (93, 'Churro Fries', 3.75, '2025-02-07'),
    (94, 'Egg Rolls', 4.00, '2025-01-16'),
    (95, 'Fried Rice', 7.50, '2025-02-06'),
    (96, 'Banh Mi', 6.00, '2025-02-03'),
    (97, 'Pork Tacos', 5.50, '2025-01-22'),
    (98, 'Sushi', 16.50, '2025-02-01'),
    (99, 'Chicken Burrito', 8.00, '2025-02-05'),
    (100, 'Beef Burrito', 8.25, '2025-02-14'),
    (101, 'Cheese Omelette', 6.50, '2025-01-18'),
    (102, 'Fried Shrimp', 15.00, '2025-02-02'),
    (103, 'Vegetarian Pizza', 12.00, '2025-01-12'),
    (104, 'Apple Cider', 3.00, '2025-01-20'),
    (105, 'Bacon and Eggs', 7.75, '2025-02-06'),
    (106, 'Fried Mozzarella', 5.25, '2025-02-01'),
    (107, 'Carrot Cake', 4.50, '2025-01-22'),
    (108, 'Steak and Eggs', 17.50, '2025-02-03'),
    (109, 'Egg Sandwich', 4.00, '2025-01-28'),
    (110, 'Ice Latte', 4.75, '2025-02-11'),
    (111, 'Garlic Bread', 3.50, '2025-01-16'),
    (112, 'Ramen', 10.99, '2025-02-08'),
    (113, 'Chicken Nachos', 7.25, '2025-01-03'),
    (114, 'Vegan Tacos', 7.99, '2025-01-25'),
    (115, 'Hot Wings', 8.50, '2025-02-04'),
    (116, 'Beef Wellington', 24.99, '2025-01-11'),
    (117, 'Tuna Tartare', 15.00, '2025-02-07'),
    (118, 'Pulled Pork Nachos', 9.50, '2025-01-19'),
    (119, 'Baked Salmon', 18.99, '2025-01-30'),
    (120, 'BBQ Chicken Pizza', 13.00, '2025-02-12');