INSERT INTO addressbook (streetAddress, City, State, Zip) VALUES
    ('100 Main St','Lake Havasu City','AZ','86403'),
    ('742 Maple Rd','Lake Havasu City','AZ','86403'),
    ('56 Desert Palm Ave','Lake Havasu City','AZ','86404'),
    ('56 Desert Palm Ave','Bullhead City','AZ','86426'),
    ('15 Sierra Vista Ln','Kingman','AZ','86409'),
    ('88 Highland St','Lake Havasu City','AZ','86403'),
    ('1020 Hillcrest Ct','Bullhead City','AZ','86426'),
    ('50 Sandstone Way','Kingman','AZ','86409'),
    ('455 Marina Blvd','Lake Havasu City','AZ','86404'),
    ('230 Sunrise Loop','Lake Havasu City','AZ','86403'),
    ('15 Ironwood Dr','Bullhead City','AZ','86426'),
    ('703 Lakeview Ln','Kingman','AZ','86409'),
    ('90 Palisades Blvd','Lake Havasu City','AZ','86404'),
    ('45 Canyon Rim Rd','Bullhead City','AZ','86426'),
    ('672 Willow Springs Ct','Kingman','AZ','86409');




INSERT INTO facility (addressID, Name, Phone, Email) VALUES
    (1,'Food Delivery Co.','15558971234','food@delivery.com');




INSERT INTO addressbook (streetAddress, City, State, Zip) VALUES
    ('312 Copper Ridge Dr', 'Lake Havasu City', 'AZ', '86403'),
    ('487 Juniper Canyon Rd', 'Lake Havasu City', 'AZ', '86404'),
    ('2290 Lakeshore Terrace', 'Bullhead City', 'AZ', '86426'),
    ('74 Mesquite Springs Ave', 'Kingman', 'AZ', '86409'),
    ('915 Sand Dune Pass', 'Lake Havasu City', 'AZ', '86406'),
    ('1601 Pioneer Trail', 'Kingman', 'AZ', '86409'),
    ('203 Coral Cove Ct', 'Lake Havasu City', 'AZ', '86403'),
    ('51 Vista Del Sol Way', 'Bullhead City', 'AZ', '86426');




INSERT INTO department (dept_name, dept_location, dept_head) VALUES
    ('Kitchen Ops','North Kitchen','Sam Carter'),
    ('Delivery Ops','Riverfront Hub','Dana Brooks');




INSERT INTO employee (facilityID, addressID, dept_id, fName, lName, Gender, Phone, Email, start_date, Salary) VALUES
    (1, 16, 1, 'Elena','Martinez','Female','9285552101','elena.martinez@foodco.example','2024-10-01 09:00:00', 24.50),
    (1, 17, 1, 'Noah','Bennett','Male','9285552102','noah.bennett@foodco.example', '2024-10-07 09:00:00', 23.25),
    (1, 18, 2, 'Grace','Kim','Female','9285552103','grace.kim@foodco.example', '2024-10-09 09:00:00', 22.00),
    (1, 19, 2, 'Ethan','Walker','Male','9285552104','ethan.walker@foodco.example', '2024-10-10 09:00:00', 21.75),
    (1, 20, 1, 'Maya','Singh','Female','9285552105','maya.singh@foodco.example', '2024-10-12 09:00:00', 25.00),
    (1, 21, 2, 'Logan','Price','Male','9285552106','logan.price@foodco.example', '2024-10-14 09:00:00', 22.50),
    (1, 22, 1, 'Zoe','Chambers','Female','9285552107','zoe.chambers@foodco.example', '2024-10-15 09:00:00', 23.75),
    (1, 23, 2, 'Owen','Ramirez','Male','9285552108','owen.ramirez@foodco.example', '2024-10-16 09:00:00', 21.50);




INSERT INTO customer (facilityID, addressID, fName, lName, Phone, Email) VALUES
    (1, 11, 'Matthew','McPhail','9285553001','matt.mcphail@example.com'),
    (1, 12, 'Sarah','Lopez','9285553002','sarah.lopez@example.com'),
    (1, 13, 'James','Carter','9285553003','james.carter@example.com'),
    (1, 14, 'Olivia','Nguyen','9285553004','olivia.nguyen@example.com'),
    (1, 15, 'Daniel','Ruiz','9285553005','daniel.ruiz@example.com');




INSERT INTO vendor (facilityID, addressID, Name, Phone, Email) VALUES
    (1, 8,  'Sun Valley Produce','9285554001','contact@sunvalleyproduce.com'),
    (1, 9,  'High Desert Foods','9285554002','sales@highdesertfoods.com'),
    (1, 9,  'Sierra Meats Supply','9285554003','support@sierrameats.com'),
    (1, 9,  'Canyon Beverage Co','9285554004','info@canyonbevco.com'),
    (1, 9,  'Western Grain Market','9285554005','orders@westerngrain.com');




INSERT INTO stock (facilityID, Name, itemLocation, onHand) VALUES
    (1,'Roma Tomatoes','a1 - b1',300),
    (1,'Fresh Mozzarella','a2 - b2',200),
    (1,'Basil Leaves','a3 - b1',180),
    (1,'Olive Oil','a3 - b1',180),
    (1,'Pizza Dough','a4 - b1',220),

    (1,'Pizza Dough','a2 - b4',160),
    (1,'Sourdough Loaf','a4 - b3',120),
    (1,'Tomato Bisque Base','a1 - b5',140),
    (1,'Butter','Cooler - b1',90),
    (1,'Parmesan','a2 - b5',130),

    (1,'Ground Beef','Freezer - b1',180),
    (1,'Taco Shells','a6 - b2',400),
    (1,'Pico de Gallo','Cooler - b2',150),
    (1,'Cheddar Blend','a2 - b6',180),
    (1,'Salsa Verde','a6 - b3',170),

    (1,'Beef Patties','Freezer - b2',220),
    (1,'Brioche Buns','a4 - b5',160),
    (1,'Pickles','a3 - b4',140),
    (1,'Ketchup Packets','a7 - b1',500),
    (1,'Swiss Cheese','a2 - b7',120),

    (1,'Spaghetti Noodles','a1 - b6',260),
    (1,'Marinara Sauce','a1 - b7',240),
    (1,'Meatballs','Freezer - b3',180),
    (1,'Garlic Bread','Freezer - b4',150),
    (1,'Caesar Kit','Cooler - b3',110);




INSERT INTO menu (vendorID) VALUES
    (1),(2),(3),(4),(5);




INSERT INTO menuitem (menuID, stockID, Name, Price) VALUES
    (1, 1,'Margherita Pizza',12.99),
    (1, 2,'Caprese Salad',8.49),
    (1, 3,'Basil Pesto Flatbread',10.49),
    (1, 4,'Garlic Olive Oil Dip',4.99),
    (1, 5,'Classic Cheese Slice',3.25),

    (2, 6,'Cheddar Melt Sandwich',9.25),
    (2, 7,'Sourdough Grilled Cheese',7.75),
    (2, 8,'Tomato Bisque Cup',4.50),
    (2, 9,'Buttery Breadsticks',3.99),
    (2,10,'Parmesan Crisps',2.99),

    (3,11,'Beef Taco',3.99),
    (3,12,'Crunchy Taco Shells (2)',2.49),
    (3,13,'Street Tacos (2)',5.99),
    (3,14,'Loaded Nachos',8.49),
    (3,15,'Chips & Salsa Verde',3.49),

    (4,16,'Classic Beef Burger',7.99),
    (4,17,'Brioche Burger',8.99),
    (4,18,'Pickle Spears (Side)',2.49),
    (4,19,'Ketchup Pack (Single)',0.25),
    (4,20,'Swiss Mushroom Burger',9.49),

    (5,21,'Spaghetti Marinara',9.99),
    (5,22,'House Marinara Jar',4.99),
    (5,23,'Spaghetti & Meatballs',11.49),
    (5,24,'Garlic Bread (2 pcs)',3.99),
    (5,25,'Caesar Salad',6.99);



INSERT INTO shoppingcart () VALUES
    (),(),(),(),();



INSERT INTO cartitem (cartID, menu_itemID, Quantity) VALUES
    (1,  1, 2),
    (1,  5, 1),
    (2, 11, 3),
    (2, 15, 2),
    (3, 21, 1),
    (3, 24, 2),
    (4, 16, 2),
    (4, 18, 1),
    (5,  8, 2),
    (5, 10, 1);



INSERT INTO customer_order (facilityID, customerID, cartID, order_time) VALUES
    (1, 1, 1, '2025-11-03 11:05:00'),
    (1, 2, 2, '2025-11-03 11:10:00'),
    (1, 3, 3, '2025-11-03 11:15:00'),
    (1, 4, 4, '2025-11-03 11:20:00'),
    (1, 5, 5, '2025-11-03 11:25:00');



INSERT INTO timesheet (employeeID, work_date, hours_worked) VALUES
    (1, '2025-10-28 09:00:00', 8.00),
    (2, '2025-10-28 09:00:00', 7.50),
    (3, '2025-10-28 09:00:00', 6.25),
    (4, '2025-10-28 09:00:00', 8.00),
    (5, '2025-10-28 09:00:00', 5.75);