create database railways;
use railways;

create table canc(
pnr int,
r_fare int
);

INSERT INTO canc (`pnr`, `r_fare`) VALUES
(57, 1100),
(58, 5600);

create table class(
c_name varchar (90)
);

INSERT INTO class(`c_name`) VALUES
('AC1'),
('AC2'),
('AC3'),
('CC'),
('EC'),
('SL');

create table classseats(
TRAIN_NO int,
s_point varchar (90),
d_point varchar (90),
doj date,
class varchar (7) not null,
fare int,
seats_left int
);

INSERT INTO classseats values(12, 'Chandigarh', 'Jaipur', '2015-05-07', 'AC1', 2200, 107);
INSERT INTO classseats values(12, 'Chandigarh', 'Jaipur', '2015-05-17', 'AC1', 3200, 20);
INSERT INTO classseats values(12, 'Chandigarh', 'Jaipur', '2015-05-17', 'AC3', 2400, 60);
INSERT INTO classseats values(12, 'Chandigarh', 'Jaipur', '2015-05-17', 'EC', 1200, 100);
INSERT INTO classseats values(12, 'Chandigarh', 'Jaipur', '2015-05-17', 'SL', 500, 200);
INSERT INTO classseats values(12, 'Jaipur', 'Kolkata', '2015-05-07', 'AC1', 1434, 243);
INSERT INTO classseats values(12, 'Jaipur', 'Kolkata', '2015-05-17', 'AC1', 2900, 15);
INSERT INTO classseats values(12, 'Jaipur', 'Kolkata', '2015-05-17', 'AC3', 2100, 40);
INSERT INTO classseats values(12, 'Jaipur', 'Kolkata', '2015-05-17', 'EC', 1500, 120);
INSERT INTO classseats values(12, 'Jaipur', 'Kolkata', '2015-05-17', 'SL', 800, 250);
INSERT INTO classseats values(12, 'Kolkata', 'Lucknow', '2015-05-07', 'AC1', 934, 322);
INSERT INTO classseats values(12, 'Kolkata', 'Lucknow', '2015-05-17', 'AC1', 3100, 30);
INSERT INTO classseats values(12, 'Kolkata', 'Lucknow', '2015-05-17', 'AC3', 1900, 30);
INSERT INTO classseats values(12, 'Kolkata', 'Lucknow', '2015-05-17', 'EC', 1700, 150);
INSERT INTO classseats values(12, 'Kolkata', 'Lucknow', '2015-05-17', 'SL', 700, 220);
INSERT INTO classseats values(12, 'Lucknow', 'Delhi', '2015-05-07', 'AC1', 344, 326);
INSERT INTO classseats values(12, 'Lucknow', 'Delhi', '2015-05-17', 'AC1', 2750, 20);
INSERT INTO classseats values(12, 'Lucknow', 'Delhi', '2015-05-17', 'AC3', 2350, 60);
INSERT INTO classseats values(12, 'Lucknow', 'Delhi', '2015-05-17', 'EC', 1100, 118);
INSERT INTO classseats values(12, 'Lucknow', 'Delhi', '2015-05-17', 'SL', 900, 180);
INSERT INTO classseats values(18, 'Chandigarh', 'Jaipur', '2015-05-12', 'AC1', 2420, 50);
INSERT INTO classseats values(18, 'Chandigarh', 'Jaipur', '2015-05-12', 'AC3', 1700, 20);
INSERT INTO classseats values(18, 'Chandigarh', 'Jaipur', '2015-05-12', 'CC', 750, 120);
INSERT INTO classseats values(18, 'Jaipur', 'Delhi', '2015-05-12', 'AC1', 2750, 20);
INSERT INTO classseats values(18, 'Jaipur', 'Delhi', '2015-05-12', 'AC3', 1200, 20);
INSERT INTO classseats values(18, 'Jaipur', 'Delhi', '2015-05-12', 'CC', 900, 150);
INSERT INTO classseats values(20, 'Delhi', 'Jaipur', '2015-05-09', 'AC1', 4500, 20);
INSERT INTO classseats values(20, 'Delhi', 'Jaipur', '2015-05-09', 'AC2', 3200, 50);
INSERT INTO classseats values(20, 'Delhi', 'Jaipur', '2015-05-09', 'AC3', 2700, 50);
INSERT INTO classseats values(20, 'Delhi', 'Jaipur', '2015-05-09', 'SL', 900, 300);


DROP TRIGGER IF EXISTS `before_insert_on_classseats`;
DELIMITER //
CREATE TRIGGER `before_insert_on_classseats` BEFORE INSERT ON `classseats`
 FOR EACH ROW begin
if datediff(curdate(),new.doj)>0 then
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check_date!!!';
end if;
if new.fare<=0 then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check fare!!!';
end if;
if new.seats_left<=0 then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check seats!!!';
end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_on_classseats`;
DELIMITER //
CREATE TRIGGER `before_update_on_classseats` BEFORE UPDATE ON `classseats`
 FOR EACH ROW begin
if datediff(curdate(),new.doj)>0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'check date!!!';
end if;
if new.fare<=0 then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check fare!!!';
end if;
if new.seats_left<=0 then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check seats!!!';
end if;
end
//
DELIMITER ;

drop table passenger_details;

CREATE TABLE passenger_details(
  pnr int NOT NULL,
  p_name varchar(50),
  p_age int,
  p_gender varchar(10)
);

INSERT INTO passenger_details values (58, 'akhil', 20, 'M');
INSERT INTO passenger_details values(58, 'deepak', 21, 'M');
INSERT INTO passenger_details values(58, 'rahul', 12, 'M');
INSERT INTO passenger_details values(58, 'shyam', 50, 'M');
INSERT INTO passenger_details values(59, 'abhinav', 20, 'M');
INSERT INTO passenger_details values(59, 'vikas', 40, 'M');
INSERT INTO passenger_details values(60, 'mohan', 20, 'M');

DROP TRIGGER IF EXISTS `before_insert_on_passenger_details`;
DELIMITER //
CREATE TRIGGER `before_insert_on_passenger_details` BEFORE INSERT ON `passenger_details`
 FOR EACH ROW begin
if new.p_gender NOT IN ('M','F') then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Enter M:Male F:Female.';
end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_on_passenger_details`;
DELIMITER //
CREATE TRIGGER `before_update_on_passenger_details` BEFORE UPDATE ON `passenger_details`
 FOR EACH ROW begin
if new.p_gender NOT IN ('M','F') then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Enter M:Male F:Female.';
end if;
end
//
DELIMITER ;

drop table reservation;

CREATE TABLE reservation(
  pnr int primary key,
  id int NOT NULL,
  train_no int NOT NULL,
  s_point varchar(50),
  d_point varchar(50),
  doj date,
  t_fare int,
  class varchar(50),
  nos int,
status varchar(50)
);

INSERT INTO reservation values(51, 6, 14, 'Chandigarh', 'Jaipur', '2015-05-07', 3300, 'AC1', 2, 'BOOKED');
INSERT INTO reservation values(52, 4, 12, 'Chandigarh', 'Jaipur', '2015-05-07', 3300, 'AC1', 2, 'BOOKED');
INSERT INTO reservation values(57, 5, 12, 'Chandigarh', 'Jaipur', '2015-05-07', 2200, 'AC1', 1, 'CANCELLED');
INSERT INTO reservation values(58, 6, 20, 'Delhi', 'Jaipur', '2015-05-09', 11200, 'AC2', 4, 'CANCELLED');
INSERT INTO reservation values(59, 10, 12, 'Lucknow', 'Delhi', '2015-05-17', 2200, 'EC', 2, 'BOOKED');

DROP TRIGGER IF EXISTS `after_insert_on_reservation`;
DELIMITER //
CREATE TRIGGER `after_insert_on_reservation` AFTER INSERT ON `reservation`
 FOR EACH ROW begin
UPDATE classseats SET seats_left=seats_left-new.nos where train_no=new.train_no AND class=new.class AND doj=new.doj AND s_point=new.s_point AND d_point=new.d_point;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_on_reservation`;
DELIMITER //
CREATE TRIGGER `after_update_on_reservation` AFTER UPDATE ON `reservation`
 FOR EACH ROW begin
if (new.status='CANCELLED' AND datediff(new.doj,curdate())<0 ) then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Cancellation Not Possible!!!!';
end if;

if (new.status='CANCELLED' AND datediff(new.doj,curdate())>0 )then
UPDATE classseats SET seats_left=seats_left+new.nos where train_no=new.train_no AND class=new.class AND doj=new.doj AND s_point=new.s_point AND d_point=new.d_point;
 if datediff(new.doj,curdate())>=30 then 
 INSERT INTO canc values (new.pnr,new.t_fare);
 end if;
 if datediff(new.doj,curdate())<30 then 
 INSERT INTO canc values (new.pnr,0.5*new.t_fare);
 end if;
end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_insert_on_reservation`;
DELIMITER //
CREATE TRIGGER `before_insert_on_reservation` BEFORE INSERT ON `reservation`
 FOR EACH ROW begin
if new.t_fare<0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Negative balance NOT possible';
end if;
if new.nos<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Negative OR 0 seats NOT possible';
end if;
if (select seats_left from classseats where train_no=new.train_no AND class=new.class AND doj=new.doj AND s_point=new.s_point AND d_point=new.d_point) < new.nos then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Not enough seats available!!!';
end if;
if datediff(new.doj,curdate())<0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Booking Not Possible!!!!';
end if;
SET new.status='BOOKED';
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_update_on_reservation`;
DELIMITER //
CREATE TRIGGER `before_update_on_reservation` BEFORE UPDATE ON `reservation`
 FOR EACH ROW begin
if new.t_fare<0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Negative balance NOT possible';
end if;
if new.nos<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Negative OR 0 seats NOT possible';
end if;
if (select seats_left from classseats where train_no=new.train_no AND class=new.class AND doj=new.doj AND s_point=new.s_point AND d_point=new.d_point) < new.nos then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Not enough seats available!!!';
end if;
end
//
DELIMITER ;

drop table schedule;

CREATE TABLE schedule(
id int primary key,
train_no int,
s_name varchar (90),
arrival_time time ,
departure_time time,
distance int
);


INSERT INTO schedule values(1, 12, 'Chandigarh', '01:00:12', '01:00:00', 0);
INSERT INTO schedule values (2, 12, 'Jaipur', '03:45:15', '03:50:00', 100);
INSERT INTO schedule VALUES(3, 12, 'Kolkata', '05:00:00', '05:15:00', 300);
INSERT INTO schedule VALUES(4, 12, 'Lucknow', '11:50:10', '12:00:00', 450);
INSERT INTO schedule VALUES(5, 12, 'Delhi', '16:30:00', '16:30:00', 600);
INSERT INTO schedule VALUES(6, 13, 'Jammu Kashmir', '22:00:00', '22:00:00', 0);
INSERT INTO schedule VALUES(7, 13, 'Delhi', '04:00:00', '04:05:00', 700);
INSERT INTO schedule VALUES(8, 13, 'Rajasthan', '07:30:50', '07:33:00', 900);
INSERT INTO schedule VALUES(9, 13, 'Allahbad', '09:00:00', '09:10:00', 1700);
INSERT INTO schedule VALUE(10, 13, 'Patna', '11:45:00', '11:47:00', 2500);
INSERT INTO schedule VALUE(11, 13, 'Madhya Pradesh', '13:00:00', '13:00:00', 3600);
INSERT INTO schedule VALUE(12, 14, 'Jammu Kashmir', '01:00:12', '01:00:12', 0);
INSERT INTO schedule VALUE(13, 14, 'Madras', '22:00:00', '22:00:00', 2500);
INSERT INTO schedule VALUE(14, 15, 'Delhi', '16:00:00', '16:00:00', 0);
INSERT INTO schedule VALUE(15, 15, 'Jaipur', '22:45:00', '22:45:00', 800);
INSERT INTO schedule VALUE(16, 16, 'Jaipur', '03:30:00', '03:30:00', 0);
INSERT INTO schedule VALUE(17, 16, 'Delhi', '09:30:00', '09:30:00', 800);
INSERT INTO schedule VALUE(18, 17, 'Delhi', '00:00:14', '00:00:14', 0);
INSERT INTO schedule VALUE(19, 17, 'Jaipur', '16:00:00', '16:10:00', 500);
INSERT INTO schedule VALUE(20, 17, 'Chandigarh', '20:30:00', '20:30:00', 1200);
INSERT INTO schedule VALUE(21, 18, 'Chandigarh', '08:05:00', '08:05:00', 0);
INSERT INTO schedule VALUE(23, 18, 'Delhi', '14:00:00', '14:00:00', 1200);
INSERT INTO schedule VALUE(25, 6, 'Allahbad', '08:00:00', '08:15:00', 200);
INSERT INTO schedule VALUE(26, 6, 'Lucknow', '15:15:00', '15:15:00', 700);
INSERT INTO schedule VALUE(27, 19, 'Lucknow', '13:30:00', '13:30:00', 0);
INSERT INTO schedule VALUE(28, 19, 'Allahbad', '20:00:00', '20:10:00', 300);
INSERT INTO schedule VALUE(29, 19, 'Jaipur', '05:15:00', '05:15:00', 700);
INSERT INTO schedule VALUE(30, 20, 'Delhi', '10:04:00', '10:04:00', 0);
INSERT INTO schedule VALUE(31, 20, 'Jaipur', '16:00:00', '16:00:00', 800);
INSERT INTO schedule VALUE(33, 21, 'Delhi', '10:00:00', '10:00:00', 800);
INSERT INTO schedule VALUE(34, 22, 'Delhi', '16:35:00', '16:35:00', 0);
INSERT INTO schedule VALUE(35, 22, 'Rajasthan', '20:00:00', '20:10:00', 1100);
INSERT INTO schedule VALUE(36, 22, 'Madhya Pradesh', '03:30:00', '03:33:00', 1500);
INSERT INTO schedule VALUE(37, 22, 'Mumbai', '09:00:00', '09:00:00', 2300);
INSERT INTO schedule VALUE(38, 23, 'Mumbai', '01:00:00', '01:00:00', 0);
INSERT INTO schedule VALUE(39, 23, 'Madhya Pradesh', '05:30:00', '05:40:00', 1500);
INSERT INTO schedule VALUE(40, 23, 'Rajasthan', '15:45:00', '15:50:00', 2000);
INSERT INTO schedule VALUE(41, 23, 'Delhi', '20:30:00', '20:30:00', 2300);

CREATE TABLE station(
id int,
s_name varchar (90)
);

INSERT INTO station values(1, 'Chandigarh');
INSERT INTO station values(2, 'Delhi');
INSERT INTO station values(3, 'Jaipur');
INSERT INTO station values(4, 'Lucknow');
INSERT INTO station values(5, 'Mumbai');
INSERT INTO station values(6, 'Allahbad');
INSERT INTO station values(7, 'Kolkata');
INSERT INTO station values(8, 'Patna');
INSERT INTO station values(9, 'Madras');
INSERT INTO station values(10, 'Jammu Kashmir');
INSERT INTO station values(11, 'Rajasthan');
INSERT INTO station values(12, 'Madhya Pradesh');


CREATE TABLE train(
train_no int,
t_name varchar(50),
s_point varchar(50),
arrival_time time,
d_point varchar(50),
departure_time time,
day varchar(10),
distance int
);


insert into train values(12, 'Shatabdi Express', 'Chandigarh', '01:00:12', 'Delhi', '16:30:00', 'Day 1', 600);
insert into train values(13, 'Harijan Express', 'Jammu Kashmir', '22:00:00', 'Madhya Pradesh', '13:00:00', 'Day2', 3600);
insert into train values(14, 'Jammu Mail Express', 'Jammu Kashmir', '01:00:12', 'Madras', '22:00:00', 'Day 1', 2500);
insert into train values(15, 'Delhi Jaipur Double Decker', 'Delhi', '16:00:00', 'Jaipur', '22:45:00', 'Day 1', 800);
insert into train values(16, 'Jaipur Delhi Double Decker', 'Jaipur', '03:30:00', 'Delhi', '09:30:00', 'Day 1', 800);
insert into train values(17, 'Delhi Chandigarh Shatabdi', 'Delhi', '00:00:14', 'Chandigarh', '20:30:00', 'Day 1', 1200);
insert into train values(18, 'Chandigarh Delhi Shatabdi', 'Chandigarh', '08:05:00', 'Delhi', '14:00:00', 'Day 2', 1200);
insert into train values(19, 'Ashram Express', 'Lucknow', '13:30:00', 'Jaipur', '05:15:00', 'Day 2', 700);
insert into train values(20, 'Frontier Express', 'Delhi', '10:04:00', 'Jaipur', '16:00:00', 'Day 1', 800);
insert into train values(21, 'Frontier Express', 'Jaipur', '20:00:00', 'Delhi', '10:00:00', 'Day 2', 800);
insert into train values(22, 'Rajdhani Express', 'Delhi', '16:35:00', 'Mumbai', '09:00:00', 'Day 2 ', 2300);
insert into train values(23, 'Rajdhani Express', 'Mumbai', '01:00:00', 'Delhi', '20:30:00', 'Day 1', 2300);



  


