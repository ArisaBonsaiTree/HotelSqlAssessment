DROP SCHEMA IF EXISTS `HotelDB`;
CREATE SCHEMA `HotelDB`;
USE `HotelDB`;

CREATE TABLE `Address` (
  `AddressId` INT PRIMARY KEY,
  `AddressLine` VARCHAR(255),
  `City` VARCHAR(15),
  `State` VARCHAR(2),
  `Zip` VARCHAR(5)
);

CREATE TABLE `Guest` (
  `GuestId` INT PRIMARY KEY,
  `FirstName` VARCHAR(100),
  `LastName` VARCHAR(100),
  `AddressId` INT,
  `Phone` VARCHAR(15),
  FOREIGN KEY (`AddressId`) REFERENCES `Address`(`AddressId`)
);

CREATE TABLE `Amenities` (
    AmenityId INT PRIMARY KEY,
    AmenityName VARCHAR(50)
);

CREATE TABLE `Room` (
    RoomNumber INT PRIMARY KEY,
    RoomType VARCHAR(50),
    ADAAccessible BOOLEAN,
    StandardOccupancy INT,
    MaximumOccupancy INT,
    BasePrice DECIMAL(10, 2),
    ExtraPersonPrice DECIMAL(10, 2)
);

CREATE TABLE `RoomAmenities` (
    RoomNumber INT,
    AmenityId INT,
    PRIMARY KEY (RoomNumber, AmenityId),
    FOREIGN KEY (`RoomNumber`) REFERENCES `Room` (`RoomNumber`),
    FOREIGN KEY (`AmenityId`) REFERENCES `Amenities` (`AmenityId`)
);

CREATE TABLE `Reservation` (
  `ReservationId` INT AUTO_INCREMENT PRIMARY KEY,
  `RoomNumber` INT,
  `GuestId` INT,
  `CheckinDate` DATE,
  `CheckoutDate` DATE,
  `NumAdults` INT,
  `NumChildren` INT,
  FOREIGN KEY (`GuestId`) REFERENCES `Guest`(`GuestId`),
  FOREIGN KEY (`RoomNumber`) REFERENCES `Room`(`RoomNumber`)
);

