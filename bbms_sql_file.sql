-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 11:28 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `donor_count` ()  NO SQL
SELECT BloodGroup,COUNT(*) AS Count from donor GROUP BY BloodGroup$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hospital_count` ()  NO SQL
SELECT BloodGroup,Status , COUNT(*) as Count FROM hospital_bloodrequest GROUP BY Status,BloodGroup$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recipient_count` ()  NO SQL
SELECT BloodGroup,Status,COUNT(*) as Count from recipient_bloodrequest GROUP BY Status,BloodGroup$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bloodrecipient`
--

CREATE TABLE `bloodrecipient` (
  `Recipient_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `fatherName` varchar(50) NOT NULL,
  `motherName` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `Email` varchar(30) NOT NULL,
  `BloodGroup` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `BloodQuantity` int(11) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodrecipient`
--

INSERT INTO `bloodrecipient` (`Recipient_id`, `Name`, `fatherName`, `motherName`, `DOB`, `Phone`, `Gender`, `Email`, `BloodGroup`, `BloodQuantity`, `City`, `Address`) VALUES
(1, 'Manasa', 'Lokesh', 'Girija', '1999-08-12', 7785206195, 'Female', 'manasa@gmail.com', 'A+', 2, 'Banglore', 'Banglore,Karnataka,India'),
(2, 'Parth', 'Uday', 'Shubhaavi', '1991-03-11', 8976574255, 'Male', 'parth@gmail.com', 'A-', 3, 'Mumbai', 'Mumbai,Maharashtra,India'),
(3, 'Manvi', 'Vijay', 'Sandhya', '2014-07-01', 7795852061, 'Female', 'manvi@cmrit.ac.in', 'AB+', 3, 'Mysore', 'Mysore,Karnataka,India'),
(4, 'Sara', 'Saif', 'Amrita', '1995-08-12', 8886658213, 'Female', 'sara@gmail.com', 'O+', 5, 'Delhi', 'Delhi,India'),
(5, 'Ishan', 'Pranav', 'Suchitra', '1998-07-18', 8618440116, 'Male', 'ishan@gmail.com', 'B+', 2, 'Patna', 'Patna,India'),
(6, 'Marie ', 'David', 'Julie', '1990-11-14', 9606036690, 'Female', 'marie@gmail.com', 'AB-', 4, 'Hosur', 'Hosur,Tamil Nadu, India'),
(7, 'Shubman', 'Lakhwinder', 'Kiara', '1999-09-08', 6366964276, 'Male', 'shubman@gmail.com', 'O-', 2, 'Mumbai', 'Mumbai,Maharashtra,India'),
(8, 'Divi', 'Vasudev', 'Devaki', '1996-03-15', 9967030797, 'Female', 'divi@gmail.com', 'B-', 4, 'Hyderabad', 'Hyderabad,Telangana,India'),
(9, 'Kunal', 'Hardik', 'Natasha', '1993-10-11', 7102201693, 'Male', 'kunal@gmail.com', 'AB+', 3, 'Delhi', 'Delhi,India'),
(10, 'Adah', 'Dhushyant', 'Alisha', '2007-06-19', 9102172044, 'Female', 'adah@gmail.com', 'AB-', 2, 'Banglore', 'Banglore,Karnataka,India'),
(11, 'Ishank', 'Kabir', 'Ishita', '1999-11-30', 9120524782, 'Male', 'ishank@gmail.com', 'B+', 5, 'Mysore', 'Mysore,Karnataka,India'),
(12, 'Kabir', 'Rohan', 'Saloni', '1997-04-28', 8120476523, 'Male', 'kabir@gmail.com', 'A+', 4, 'Patna', 'Patna,India'),
(13, 'Mishka', 'Karthik', 'Naira', '2000-01-13', 6190286435, 'Female', 'mishka@gmail.com', 'O-', 3, 'Hosur', 'Hosur,Tamil Nadu,India'),
(14, 'Aarav', 'Naksh', 'Zara', '1993-07-29', 8120912079, 'Male', 'aarav@gmail.com', 'A-', 5, 'Banglore', 'Banglore,Karnataka,India'),
(15, 'Saanvi', 'Pranav', 'Shanaya', '1995-03-10', 9120817863, 'Female', 'saanvi@gmail.com', 'AB-', 2, 'Kolar', 'Kolar,India');

--
-- Triggers `bloodrecipient`
--
DELIMITER $$
CREATE TRIGGER `r_bldrqst` AFTER INSERT ON `bloodrecipient` FOR EACH ROW INSERT INTO recipient_bloodrequest(Recipient_id,Name,Phone,Email,BloodGroup,BloodQuantity,City,Address) VALUES(NEW.Recipient_id,NEW.Name,NEW.Phone,NEW.Email,NEW.BloodGroup,NEW.BloodQuantity,NEW.City,NEW.Address)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `donorID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `fatherName` varchar(50) NOT NULL,
  `motherName` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `Email` varchar(30) NOT NULL,
  `BloodGroup` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `City` varchar(20) NOT NULL,
  `Address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`donorID`, `Name`, `fatherName`, `motherName`, `DOB`, `Phone`, `Gender`, `Email`, `BloodGroup`, `City`, `Address`) VALUES
(1, 'Manali', 'Rohit', 'Sonakshi', '1996-07-20', 7365496037, 'Female', 'manali@gmail.com', 'A+', 'Banglore', 'Banglore,Karnataka,India'),
(2, 'Santhosh', 'Murali', 'Sujatha', '1994-05-01', 7795856101, 'Male', 'santhosh@gmail.com', 'AB-', 'Hosur', 'Hosur,Tamil Nadu,India'),
(3, 'Abhishek', 'Veerabhadra', 'Anita', '2000-06-12', 9901899265, 'Male', 'abhishek@gmail.com', 'AB+', 'Banglore', 'Banglore,Karnataka,India'),
(4, 'Nandan', 'Jagadeesh', 'Manjula', '1999-04-10', 9148333597, 'Male', 'nandan@gmail.com', 'O-', 'Kolar', 'Kolar,Karnatka,India\n'),
(5, 'Anjali', 'Abhishek', 'Akila', '1991-05-29', 7894536723, 'Female', 'anjali@gmail.com', 'B+', 'Patna', 'Patna,India'),
(6, 'Geeta', 'Sriram', 'Seeta', '1993-08-08', 8764235499, 'Female', 'geeta@gmail.com', 'B+', 'Mysore', 'Mysore,Karnataka,India'),
(7, 'Punarva', 'Mallesh', 'Navya', '1995-10-16', 9990107080, 'Male', 'punarva@gmail.com', 'O+', 'Hyderabad', 'Hyderabad,Telangana,India'),
(8, 'Meghana', 'Jagesh', 'Sujata', '2001-12-15', 9900379211, 'Female', 'meghana@gmail.com', 'O-', 'Mumbai', 'Mumbai,Maharashtra,India'),
(9, 'John', 'Peter', 'Jessie', '1994-12-12', 8867459720, 'Male', 'john@gmail.com', 'AB-', 'Delhi', 'Delhi,India'),
(10, 'Ayan', 'Adil', 'Nishath', '1992-09-01', 6732538974, 'Male', 'ayan@gmail.com', 'A+', 'Patna', 'Patna,India'),
(11, 'Mahesh', 'Krishna', 'Radha', '1997-04-14', 7349852080, 'Male', 'mahesh@gmail.com', 'A+', 'Mysore', 'Mysore,Karnataka,India'),
(12, 'Gagan', 'Shekar', 'Ambika', '1996-01-26', 8998767540, 'Male', 'gagan@gmail.com', 'B-', 'Hyderabad', 'Hyderabad,Telangana,India'),
(13, 'Pooja', 'Manjunath', 'Manjula', '2000-09-01', 7454543424, 'Female', 'pooja@gmail.com', 'A-', 'Banglore', 'Banglore,Karnataka,India'),
(14, 'Harshith', 'Naveen', 'Sharada', '1995-03-04', 8050531017, 'Male', 'harshith@gmail.com', 'O+', 'Mumbai', 'Mumbai,Maharashtra,India'),
(15, 'Dhanush', 'Manjunath', 'Lasya', '1998-09-17', 6677889943, 'Male', 'dhanush@gmail.com', 'AB+', 'Hosur', 'Hosur,Tamil Nadu,India'),
(16, 'Dharshan', 'Sohel', 'Raksha', '1995-06-19', 8876596429, 'Male', 'dharshan@gmail.com', 'A-', 'Delhi', 'Delhi,India'),
(17, 'Arha', 'Rehan', 'Shayari', '1993-07-30', 6675986577, 'Female', 'arha@gmail.com', 'B-', 'Mumbai', 'Mumbai,Maharashtra,India'),
(18, 'Ileyana', 'Rana', 'Hansika', '1994-10-05', 9085679742, 'Female', 'ileyana@gmail.com', 'A+', 'Kolkata', 'Kolkata,West Bengal,India'),
(19, 'Rahul', 'Vikram', 'Saranya', '1996-04-20', 7655498312, 'Male', 'rahul@gmail.com', 'B-', 'Hyderabad', 'Hyderabad,Telangana,India'),
(20, 'Anshika', 'Chetan', 'Sushma', '2000-08-31', 7993362714, 'Female', 'anshika@gmail.com', 'B+', 'Mysore', 'Mysore,Karnataka,India');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_bloodrequest`
--

CREATE TABLE `hospital_bloodrequest` (
  `Hospital_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `BloodGroup` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `BloodQuantity` int(11) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `RegDate` date NOT NULL DEFAULT current_timestamp(),
  `Status` enum('Done','Pending') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_bloodrequest`
--

INSERT INTO `hospital_bloodrequest` (`Hospital_id`, `Name`, `Phone`, `Email`, `BloodGroup`, `BloodQuantity`, `City`, `Address`, `RegDate`, `Status`) VALUES
(1, 'City Hospital', 8618192479, 'cityhospital@gmail.com', 'A+', 10, 'Banglore', 'Banglore,Karnataka,India', '2020-12-03', 'Done'),
(2, 'Apollo Hospital', 8618912479, 'apollohospitals@gmail.com', 'O+', 5, 'Mysore', 'Mysore,Karnataka,India', '2020-12-03', 'Done'),
(3, 'Fortis Hospital', 9663181298, 'fortishospital@gmail.com', 'B-', 7, 'Mumbai', 'Mumbai,Maharashtra,India', '2020-12-04', 'Done'),
(4, 'AIIMS', 8826511500, 'aiims@gmail.com', 'AB+', 3, 'Delhi', 'Delhi,India', '2020-12-04', 'Done'),
(5, 'Victoria Hospital', 7754543428, 'victoriahospital@gmail.com', 'O-', 8, 'Patna', 'Patna,India', '2020-12-05', 'Done'),
(6, 'Trinity Hospital', 8041503434, 'trinityhospital@gmail.com', 'A-', 5, 'Hosur', 'Hosur,Tamil Nadu,India', '2020-12-05', 'Done'),
(7, 'Abhaya Hospital', 8120912034, 'abhayahospital@gmail.com', 'B+', 9, 'Banglore', 'Banglore,Karnataka,India', '2020-12-06', 'Pending'),
(8, 'Vydehi Hospital', 9128534876, 'vydehihospital@gmail.com', 'AB-', 4, 'Kolar', 'Kolar,Karnataka,India', '2020-12-06', 'Pending'),
(9, 'Jayadeva Hospital', 7184369210, 'jayadevahospital@gmail.com', 'A+', 7, 'Banglore', 'Banglore,Karnataka,India', '2020-12-06', 'Pending'),
(10, 'Columbia Asia Hospital', 9937652895, 'columbiaasiahospital@gmail.com', 'B-', 15, 'Mumbai', 'Mumbai,Maharashtra,India', '2020-12-06', 'Pending'),
(11, 'St.John\'s Hospital', 8918249791, 'stjohnhospital@gmail.com', 'O+', 5, 'Banglore', 'Banglore,Karnataka,India', '2020-12-06', 'Pending');

--
-- Triggers `hospital_bloodrequest`
--
DELIMITER $$
CREATE TRIGGER `hospital_stock_Dec` AFTER UPDATE ON `hospital_bloodrequest` FOR EACH ROW UPDATE stock set units=units-new.BloodQuantity WHERE bloodGroup=new.BloodGroup
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `processing_manager`
--

CREATE TABLE `processing_manager` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processing_manager`
--

INSERT INTO `processing_manager` (`username`, `password`) VALUES
('manager1', '12345'),
('manager2', '23456');

-- --------------------------------------------------------

--
-- Table structure for table `recipient_bloodrequest`
--

CREATE TABLE `recipient_bloodrequest` (
  `Recipient_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `BloodGroup` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `BloodQuantity` int(11) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `RegDate` date NOT NULL DEFAULT current_timestamp(),
  `Status` enum('Done','Pending') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient_bloodrequest`
--

INSERT INTO `recipient_bloodrequest` (`Recipient_id`, `Name`, `Phone`, `Email`, `BloodGroup`, `BloodQuantity`, `City`, `Address`, `RegDate`, `Status`) VALUES
(1, 'Manasa', 7785206195, 'manasa@gmail.com', 'A+', 2, 'Banglore', 'Banglore,Karnataka,India', '2020-12-03', 'Done'),
(2, 'Parth', 8976574255, 'parth@gmail.com', 'A-', 3, 'Mumbai', 'Mumbai,Maharashtra,India', '2020-12-03', 'Done'),
(3, 'Manvi', 7795852061, 'manvi@cmrit.ac.in', 'AB+', 3, 'Mysore', 'Mysore,Karnataka,India', '2020-12-03', 'Done'),
(4, 'Sara', 8886658213, 'sara@gmail.com', 'O+', 5, 'Delhi', 'Delhi,India', '2020-12-04', 'Done'),
(5, 'Ishan', 8618440116, 'ishan@gmail.com', 'B+', 2, 'Patna', 'Patna,India', '2020-12-04', 'Done'),
(6, 'Marie ', 9606036690, 'marie@gmail.com', 'AB-', 4, 'Hosur', 'Hosur,Tamil Nadu, India', '2020-12-04', 'Done'),
(7, 'Shubman', 6366964276, 'shubman@gmail.com', 'O-', 2, 'Mumbai', 'Mumbai,Maharashtra,India', '2020-12-05', 'Done'),
(8, 'Divi', 9967030797, 'divi@gmail.com', 'B-', 4, 'Hyderabad', 'Hyderabad,Telangana,India', '2020-12-05', 'Done'),
(9, 'Kunal', 7102201693, 'kunal@gmail.com', 'AB+', 3, 'Delhi', 'Delhi,India', '2020-12-05', 'Done'),
(10, 'Adah', 9102172044, 'adah@gmail.com', 'AB-', 2, 'Banglore', 'Banglore,Karnataka,India', '2020-12-05', 'Done'),
(11, 'Ishank', 9120524782, 'ishank@gmail.com', 'B+', 5, 'Mysore', 'Mysore,Karnataka,India', '2020-12-06', 'Pending'),
(12, 'Kabir', 8120476523, 'kabir@gmail.com', 'A+', 4, 'Patna', 'Patna,India', '2020-12-06', 'Pending'),
(13, 'Mishka', 6190286435, 'mishka@gmail.com', 'O-', 3, 'Hosur', 'Hosur,Tamil Nadu,India', '2020-12-06', 'Pending'),
(14, 'Aarav', 8120912079, 'aarav@gmail.com', 'A-', 5, 'Banglore', 'Banglore,Karnataka,India', '2020-12-06', 'Pending'),
(15, 'Saanvi', 9120817863, 'saanvi@gmail.com', 'AB-', 2, 'Kolar', 'Kolar,India', '2020-12-06', 'Pending');

--
-- Triggers `recipient_bloodrequest`
--
DELIMITER $$
CREATE TRIGGER `recipient_stock_Dec` AFTER UPDATE ON `recipient_bloodrequest` FOR EACH ROW UPDATE stock set units=units-new.BloodQuantity where bloodGroup=new.BloodGroup
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registration_staff`
--

CREATE TABLE `registration_staff` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration_staff`
--

INSERT INTO `registration_staff` (`username`, `password`) VALUES
('staff1', '12345'),
('staff2', '23456');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `bloodGroup` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`bloodGroup`, `units`) VALUES
('A+', 110),
('A-', 85),
('B+', 88),
('B-', 100),
('O+', 42),
('O-', 69),
('AB+', 22),
('AB-', 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodrecipient`
--
ALTER TABLE `bloodrecipient`
  ADD PRIMARY KEY (`Recipient_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`donorID`);

--
-- Indexes for table `hospital_bloodrequest`
--
ALTER TABLE `hospital_bloodrequest`
  ADD PRIMARY KEY (`Hospital_id`);

--
-- Indexes for table `processing_manager`
--
ALTER TABLE `processing_manager`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `recipient_bloodrequest`
--
ALTER TABLE `recipient_bloodrequest`
  ADD PRIMARY KEY (`Recipient_id`);

--
-- Indexes for table `registration_staff`
--
ALTER TABLE `registration_staff`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloodrecipient`
--
ALTER TABLE `bloodrecipient`
  MODIFY `Recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hospital_bloodrequest`
--
ALTER TABLE `hospital_bloodrequest`
  MODIFY `Hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipient_bloodrequest`
--
ALTER TABLE `recipient_bloodrequest`
  ADD CONSTRAINT `recipient_bloodrequest_ibfk_1` FOREIGN KEY (`Recipient_id`) REFERENCES `bloodrecipient` (`Recipient_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
