-- 반동물 주인 테이블
CREATE TABLE PetOwners(
OwnerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '고객 고유 ID',
name VARCHAR(45) COMMENT '고객 이름',
contact VARCHAR(45) COMMENT '고객 연락처');

-- 반려동물 테이블
CREATE TABLE pets(
petID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '반려동물 고유 ID',
OwnerID INT NOT NULL COMMENT '반려동물의 주인 ID',
name VARCHAR(45) COMMENT '반려동물 이름',
species VARCHAR(45) COMMENT '종',
breed VARCHAR(45) COMMENT '품종',
FOREIGN KEY (OwnerID)
REFERENCES PetOwners(OwnerID));

-- 객실 테이블
CREATE TABLE Rooms(
roomID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '객실 고유 ID',
roomNumber VARCHAR(45) COMMENT '객실 번호',
roomType VARCHAR(45) COMMENT '객실 타입',
pricePerNight VARCHAR(45) COMMENT '1박당 가격');

-- 예약 테이블
CREATE TABLE Reservations(
reservationID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '예약 고유 ID',
petID INT COMMENT '예약된 반려동물 ID',
roomID INT COMMENT '예약된 객실 ID',
startDate Date COMMENT '예약 시작 날짜',
endDate Date COMMENT '예약 종료 날짜',
FOREIGN KEY (petID)
REFERENCES pets(petID),
FOREIGN KEY (roomID)
REFERENCES Rooms(roomID));

-- 서비스 테이블
CREATE TABLE Services(
serviceID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '서비스 고유 ID',
reservationID INT COMMENT '예약 ID',
serviceName VARCHAR(45) COMMENT '서비스 이름',
servicePrice VARCHAR(45) COMMENT '서비스 가격',
FOREIGN KEY (reservationID)
REFERENCES Reservations(reservationID));