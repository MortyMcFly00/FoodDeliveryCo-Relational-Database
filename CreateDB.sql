CREATE DATABASE FoodDeliveryCo;

USE FoodDeliveryCo;

CREATE TABLE addressbook (
    addressID INT AUTO_INCREMENT PRIMARY KEY,
    streetAddress VARCHAR(100),
    City  VARCHAR(50),
    State CHAR(2),
    Zip   VARCHAR(10)
);

CREATE TABLE facility (
    facilityID INT AUTO_INCREMENT PRIMARY KEY,
    addressID INT,
    Name  VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE customer (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    facilityID INT,
    addressID  INT,
    fName VARCHAR(30),
    lName VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE vendor (
    vendorID INT AUTO_INCREMENT PRIMARY KEY,
    facilityID INT,
    addressID  INT,
    Name  VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100),
    dept_location VARCHAR(100),
    dept_head VARCHAR(50)
);

CREATE TABLE employee (
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    facilityID INT,
    addressID  INT,
    dept_id    INT,
    fName VARCHAR(30),
    lName VARCHAR(30),
    Gender VARCHAR(6),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    start_date DATETIME,
    Salary DECIMAL(10,2)
);

CREATE TABLE timesheet (
    timesheetID INT AUTO_INCREMENT PRIMARY KEY,
    employeeID INT,
    work_date DATETIME,
    hours_worked DECIMAL(5,2)
);

CREATE TABLE menu (
    menuID INT AUTO_INCREMENT PRIMARY KEY,
    vendorID INT
);

CREATE TABLE stock (
    stockID INT AUTO_INCREMENT PRIMARY KEY,
    facilityID INT,
    Name VARCHAR(30),
    itemLocation VARCHAR(15),
    onHand INT
);

CREATE TABLE menuitem (
    menu_itemID INT AUTO_INCREMENT PRIMARY KEY,
    menuID INT,
    stockID INT,
    Name VARCHAR(30),
    Price DECIMAL(10,2)
);

CREATE TABLE shoppingcart (
    cartID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE cartitem (
    cart_itemID INT AUTO_INCREMENT PRIMARY KEY,
    cartID INT,
    menu_itemID INT,
    Quantity INT
);

CREATE TABLE customer_order (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    facilityID INT,
    customerID INT,
    cartID INT,
    order_time DATETIME
);

CREATE TABLE tbl_employee_audit (
    auditID INT AUTO_INCREMENT PRIMARY KEY,
    audit_data VARCHAR(100)
);

ALTER TABLE facility
    ADD CONSTRAINT fk_facility_address
        FOREIGN KEY (addressID) REFERENCES addressbook(addressID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE customer
    ADD CONSTRAINT fk_customer_facility
        FOREIGN KEY (facilityID) REFERENCES facility(facilityID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_customer_address
        FOREIGN KEY (addressID)  REFERENCES addressbook(addressID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE vendor
    ADD CONSTRAINT fk_vendor_facility
        FOREIGN KEY (facilityID) REFERENCES facility(facilityID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_vendor_address
        FOREIGN KEY (addressID)  REFERENCES addressbook(addressID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE employee
    ADD CONSTRAINT fk_employee_facility
        FOREIGN KEY (facilityID) REFERENCES facility(facilityID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_employee_address
        FOREIGN KEY (addressID)  REFERENCES addressbook(addressID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_employee_department
        FOREIGN KEY (dept_id)    REFERENCES department(dept_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE timesheet
    ADD CONSTRAINT fk_timesheet_employee
        FOREIGN KEY (employeeID) REFERENCES employee(employeeID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE menu
    ADD CONSTRAINT fk_menu_vendor
        FOREIGN KEY (vendorID) REFERENCES vendor(vendorID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE stock
    ADD CONSTRAINT fk_stock_facility
        FOREIGN KEY (facilityID) REFERENCES facility(facilityID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE menuitem
    ADD CONSTRAINT fk_menuitem_menu
        FOREIGN KEY (menuID) REFERENCES menu(menuID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_menuitem_stock
        FOREIGN KEY (stockID) REFERENCES stock(stockID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE cartitem
    ADD CONSTRAINT fk_cartitem_cart
        FOREIGN KEY (cartID) REFERENCES shoppingcart(cartID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_cartitem_menuitem
        FOREIGN KEY (menu_itemID) REFERENCES menuitem(menu_itemID) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE customer_order
    ADD CONSTRAINT fk_order_facility
        FOREIGN KEY (facilityID) REFERENCES facility(facilityID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_order_customer
        FOREIGN KEY (customerID) REFERENCES customer(customerID) ON UPDATE CASCADE ON DELETE RESTRICT,
    ADD CONSTRAINT fk_order_cart
        FOREIGN KEY (cartID) REFERENCES shoppingcart(cartID) ON UPDATE CASCADE ON DELETE RESTRICT;


CREATE TRIGGER emp_insert_trig AFTER INSERT ON employee
    FOR EACH ROW INSERT INTO tbl_employee_audit (audit_data) VALUES
    (CONCAT('New employee with ID = ', NEW.employeeID, ' was added on ', CURRENT_DATE())
);

CREATE TRIGGER emp_delete_trig AFTER DELETE ON employee
    FOR EACH ROW INSERT INTO tbl_employee_audit (audit_data) VALUES
    (CONCAT('Employee with ID = ', OLD.employeeID, ' was deleted on ', CURRENT_DATE())
);