USE `HotelDB`;

-- --------------------------------------------
-- Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

SELECT g.FirstName, g.LastName, r.RoomNumber, r.CheckinDate, r.CheckoutDate FROM Reservation r
JOIN Guest g USING(GuestId)
WHERE YEAR(r.CheckoutDate) = 2023 AND MONTH(r.CheckoutDate) = 7;

-- Hakoz	Baelz	205	2023-06-28	2023-07-02
-- Bettyann	Seery	303	2023-07-28	2023-07-29
-- Walter	Holaway	204	2023-07-13	2023-07-14
-- Wilfred	Vise	401	2023-07-18	2023-07-21


-- --------------------------------------------
-- Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT g.FirstName, g.LastName, r.RoomNumber, r.CheckinDate, r.CheckoutDate FROM Reservation r
JOIN Guest g USING(GuestId)
JOIN RoomAmenities ra USING(RoomNumber)
JOIN Amenities a USING (AmenityId)
WHERE a.AmenityName = 'Jacuzzi';

-- Karie	Yang	201	2023-03-06	2023-03-07
-- Bettyann	Seery	203	2023-02-05	2023-02-10
-- Karie	Yang	203	2023-09-13	2023-09-15
-- Hakoz	Baelz	205	2023-06-28	2023-07-02
-- Wilfred	Vise	207	2023-04-23	2023-04-24
-- Walter	Holaway	301	2023-04-09	2023-04-13
-- Mack	Simmer	301	2023-11-22	2023-11-25
-- Bettyann	Seery	303	2023-07-28	2023-07-29
-- Duane	Cullison	305	2023-02-22	2023-02-24
-- Bettyann	Seery	305	2023-08-30	2023-09-01
-- Hakoz	Baelz	307	2023-03-17	2023-03-20


-- --------------------------------------------
-- Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT g.FirstName, g.LastName, r.RoomNumber, r.CheckinDate, r.NumAdults, r.NumChildren FROM Reservation r
JOIN Guest g USING(GuestId)
WHERE g.FirstName = 'Hakoz' AND g.LastName = 'Baelz';

-- Hakoz	Baelz	307	2023-03-17	1	1
-- Hakoz	Baelz	205	2023-06-28	2	0

-- --------------------------------------------
-- Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.

SELECT rm.RoomNumber, rs.ReservationId, rm.BasePrice + (rm.ExtraPersonPrice * (rs.NumAdults + rs.NumChildren - rm.StandardOccupancy)) AS PerRoomCost FROM Room rm
LEFT JOIN Reservation rs USING(RoomNumber);

-- 201	54	219.99
-- 202	57	194.99
-- 203	52	209.99
-- 203	71	219.99
-- 204	66	194.99
-- 205	65	
-- 206	62	
-- 206	73	
-- 207	60	
-- 208	63	
-- 208	70	
-- 301	59	189.99
-- 301	74	219.99
-- 302	56	184.99
-- 302	75	174.99
-- 303	68	209.99
-- 304	58	174.99
-- 304	64	184.99
-- 305	53	
-- 305	69	
-- 306		
-- 307	55	
-- 308	51	
-- 401	61	459.99
-- 401	67	459.99
-- 401	72	419.99
-- 402		


-- --------------------------------------------
-- Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

SELECT Room.RoomNumber, Room.RoomType, Room.StandardOccupancy, Room.MaximumOccupancy FROM Room -- Didn't add r, since it was annoying me
JOIN Reservation r USING(RoomNumber)
WHERE Room.MaximumOccupancy >= 3 AND (r.CheckinDate BETWEEN '2023-04-01' AND '2023-04-30' OR r.CheckoutDate BETWEEN '2023-04-01' AND '2023-04-30')
GROUP BY Room.RoomNumber;

-- 304	Double	2	4
-- 301	Double	2	4

-- --------------------------------------------
-- Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.

SELECT g.FirstName, g.LastName, COUNT(r.ReservationId) AS NumReservations FROM Guest g
LEFT JOIN Reservation r USING(GuestId)
GROUP BY g.GuestId
ORDER BY NumReservations DESC, g.LastName ASC;

-- Mack	Simmer	4
-- Bettyann	Seery	3
-- Duane	Cullison	2
-- Walter	Holaway	2
-- Aurore	Lipton	2
-- Maritza	Tilton	2
-- Joleen	Tison	2
-- Hakoz	Baelz	2
-- Wilfred	Vise	2
-- Karie	Yang	2
-- Zachery	Luechtefeld	1
-- Jeremiah	Pendergrass	1


-- --------------------------------------------
-- Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT g.FirstName, g.LastName, a.AddressLine, a.City, a.State, a.Zip, g.Phone FROM Guest g
JOIN Address a USING(AddressId)
WHERE g.Phone = '(111) 111-1111';

-- Hakoz	Baelz	123 Sesame St	New York City	NY	11111	(111) 111-1111
