USE `HotelDB`;
SET FOREIGN_KEY_CHECKS=0; -- to disable them
-- SET FOREIGN_KEY_CHECKS=1; -- to re-enable them
-- Edit > Preferences > SQL EDITOR > Check box 'SAFE UPDATE'
-- Query > Reconnect Server
DELETE FROM Address;
DELETE FROM Guest;
DELETE FROM Amenities;
DELETE FROM Room;
DELETE FROM RoomAmenities;
DELETE FROM Reservation;

INSERT INTO Address (AddressId, AddressLine, City, State, Zip) VALUES
(1, '123 Sesame St', 'New York City', 'NY', '11111'),
(2, '379 Old Shore Street', 'Council Bluffs', 'IA', '51501'),
(3, '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654'),
(4, '9662 Foxrun Lane', 'Harlingen', 'TX', '78552'),
(5, '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096'),
(6, '762 Wild Rose Street', 'Saginaw', 'MI', '48601'),
(7, '7 Poplar Dr.', 'Arvada', 'CO', '80003'),
(8, '70 Oakwood St.', 'Zion', 'IL', '60099'),
(9, '7556 Arrowhead St.', 'Cumberland', 'RI', '02864'),
(10, '77 West Surrey Street', 'Oswego', 'NY', '13126'),
(11, '939 Linda Rd.', 'Burke', 'VA', '22015'),
(12, '87 Queen St.', 'Drexel Hill', 'PA', '19026');


INSERT INTO Guest (GuestId, FirstName, LastName, AddressId, Phone) VALUES
(1, 'Hakoz', 'Baelz', 1, '(111) 111-1111'),
(2, 'Mack', 'Simmer', 2, '(291) 553-0508'),
(3, 'Bettyann', 'Seery', 3, '(478) 277-9632'),
(4, 'Duane', 'Cullison', 4, '(308) 494-0198'),
(5, 'Karie', 'Yang', 5, '(214) 730-0298'),
(6, 'Aurore', 'Lipton', 6, '(377) 507-0974'),
(7, 'Zachery', 'Luechtefeld', 7, '(814) 485-2615'),
(8, 'Jeremiah', 'Pendergrass', 8, '(279) 491-0960'),
(9, 'Walter', 'Holaway', 9, '(446) 396-6785'),
(10, 'Wilfred', 'Vise', 10, '(834) 727-1001'),
(11, 'Maritza', 'Tilton', 11, '(446) 351-6860'),
(12, 'Joleen', 'Tison', 12, '(231) 893-2755');

INSERT INTO Amenities(AmenityId, AmenityName) VALUES
(1, 'Microwave'),
(2, 'Refrigerator'),
(3, 'Oven'),
(4, 'Jacuzzi');


INSERT INTO Room (RoomNumber, RoomType, ADAAccessible, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPersonPrice) VALUES
(201, 'Double', FALSE, 2, 4, 199.99, 10.00),
(202, 'Double', TRUE, 2, 4, 174.99, 10.00),
(203, 'Double', FALSE, 2, 4, 199.99, 10.00),
(204, 'Double', TRUE, 2, 4, 174.99, 10.00),

(205, 'Single', FALSE, 2, 2, 174.99, null),
(206, 'Single', TRUE, 2, 2, 149.99, null),
(207, 'Single', FALSE, 2, 2, 174.99, null),
(208, 'Single', TRUE, 2, 2, 149.99, null),

(301, 'Double', FALSE, 2, 4, 199.99, 10.00),
(302, 'Double', TRUE, 2, 4, 174.99, 10.00),
(303, 'Double', FALSE, 2, 4, 199.99, 10.00),
(304, 'Double', TRUE, 2, 4, 174.99, 10.00),

(305, 'Single', FALSE, 2, 2, 174.99, null),
(306, 'Single', TRUE, 2, 2, 149.99, null),
(307, 'Single', FALSE, 2, 2, 174.99, null),
(308, 'Single', TRUE, 2, 2, 149.99, null),

(401, 'Suite', TRUE, 3, 8, 399.99, 20.00),
(402, 'Suite', TRUE, 3, 8, 399.99, 20.00);


INSERT INTO RoomAmenities (RoomNumber, AmenityId) VALUES 
(201, 1),
(201, 4),
(202, 2),
(203, 1),
(203, 4),
(204, 2),
(205, 1),
(205, 2),
(205, 4),
(206, 1),
(206, 2),
(207, 1),
(207, 2),
(207, 4),
(208, 1),
(208, 2),
(301, 1),
(301, 4),
(302, 2),
(303, 1),
(303, 4),
(304, 2),
(305, 1),
(305, 2),
(305, 4),
(306, 1),
(306, 2),
(307, 1),
(307, 2),
(307, 4),
(308, 1),
(308, 2),
(401, 1),
(401, 2),
(401, 3),
(402, 1),
(402, 2),
(402, 3);

INSERT INTO Reservation (RoomNumber, GuestId, CheckinDate, CheckoutDate, NumAdults, NumChildren) VALUES
(308, 2, '2023-02-02', '2023-02-04', 1, 0),
(203, 3, '2023-02-05', '2023-02-10', 2, 1),
(305, 4, '2023-02-22', '2023-02-24', 2, 0),
(201, 5, '2023-03-06', '2023-03-07', 2, 2),
(307, 1, '2023-03-17', '2023-03-20', 1, 1),
(302, 6, '2023-03-18', '2023-03-23', 3, 0),
(202, 7, '2023-03-29', '2023-03-31', 2, 2),
(304, 8, '2023-03-31', '2023-04-05', 2, 0),
(301, 9, '2023-04-09', '2023-04-13', 1, 0),
(207, 10, '2023-04-23', '2023-04-24', 1, 1),
(401, 11, '2023-05-30', '2023-06-02', 2, 4),
(206, 12, '2023-06-10', '2023-06-14', 2, 0),
(208, 12, '2023-06-10', '2023-06-14', 1, 0),
(304, 6, '2023-06-17', '2023-06-18', 3, 0),
(205, 1, '2023-06-28', '2023-07-02', 2, 0),
(204, 9, '2023-07-13', '2023-07-14', 3, 1),
(401, 10, '2023-07-18', '2023-07-21', 4, 2),
(303, 3, '2023-07-28', '2023-07-29', 2, 1),
(305, 3, '2023-08-30', '2023-09-01', 1, 0),
(208, 2, '2023-09-16', '2023-09-17', 2, 0),
(203, 5, '2023-09-13', '2023-09-15', 2, 2),
(401, 4, '2023-11-22', '2023-11-25', 2, 2),
(206, 2, '2023-11-22', '2023-11-25', 2, 0),
(301, 2, '2023-11-22', '2023-11-25', 2, 2),
(302, 11, '2023-12-24', '2023-12-28', 2, 0);
