-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Mar 18, 2024 at 11:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digital_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `addappt`
--

CREATE TABLE `addappt` (
  `AddApptId` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Remember Me` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `AppointmentsId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Duration` int(11) NOT NULL,
  `Status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical notes`
--

CREATE TABLE `medical notes` (
  `Medical Notes Id` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `ProviderId` int(11) NOT NULL,
  `AppointmentId` int(11) NOT NULL,
  `HPI` text DEFAULT NULL,
  `PE` text DEFAULT NULL,
  `Summary` text DEFAULT NULL,
  `AP` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `MedicationId` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `ProviderId` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `MessageId` int(11) NOT NULL,
  `Patient` varchar(45) NOT NULL,
  `Provider` varchar(45) NOT NULL,
  `message` text NOT NULL,
  `Current_TimeStamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patientappointments`
--

CREATE TABLE `patientappointments` (
  `AppointmentsId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Provider Info` varchar(255) NOT NULL,
  `Room Info` varchar(300) NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Video Url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient register`
--

CREATE TABLE `patient register` (
  `UserId` int(11) NOT NULL,
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Confirm Password` varchar(12) NOT NULL,
  `Date of Birth` date NOT NULL,
  `Sex` enum('Male','Female','Other') NOT NULL,
  `Pronouns` enum('He/Him','She/Her','They/Them') NOT NULL,
  `preferred Name` varchar(45) NOT NULL,
  `Phone Number` varchar(13) NOT NULL,
  `ProviderRegister_ProviderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='	';

-- --------------------------------------------------------

--
-- Table structure for table `patient register_has_messages`
--

CREATE TABLE `patient register_has_messages` (
  `Patient Register_UserId` int(11) NOT NULL,
  `Patient Register_ProviderRegister_ProviderId` int(11) NOT NULL,
  `Messages_MessageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient register_has_patientappointments`
--

CREATE TABLE `patient register_has_patientappointments` (
  `Patient Register_UserId` int(11) NOT NULL,
  `Patient Register_ProviderRegister_ProviderId` int(11) NOT NULL,
  `PatientAppointments_AppointmentsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient register_has_updatemedicalinfo`
--

CREATE TABLE `patient register_has_updatemedicalinfo` (
  `Patient Register_UserId` int(11) NOT NULL,
  `Patient Register_ProviderRegister_ProviderId` int(11) NOT NULL,
  `UpdateMedicalInfo_PatientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient register_has_update patient profile`
--

CREATE TABLE `patient register_has_update patient profile` (
  `Patient Register_UserId` int(11) NOT NULL,
  `Patient Register_ProviderRegister_ProviderId` int(11) NOT NULL,
  `Update Patient Profile_PatientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient register_has_videorooms`
--

CREATE TABLE `patient register_has_videorooms` (
  `Patient Register_UserId` int(11) NOT NULL,
  `Patient Register_ProviderRegister_ProviderId` int(11) NOT NULL,
  `VideoRooms_RoomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider calendar`
--

CREATE TABLE `provider calendar` (
  `ProviderCalendarId` int(11) NOT NULL,
  `Date` datetime(6) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Patient Info` varchar(255) DEFAULT NULL,
  `video URL` varchar(300) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerinbox`
--

CREATE TABLE `providerinbox` (
  `Id` int(11) NOT NULL,
  `ProviderId` varchar(45) NOT NULL,
  `PatientId` varchar(45) NOT NULL,
  `Read Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister`
--

CREATE TABLE `providerregister` (
  `ProviderId` int(11) NOT NULL,
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(45) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Confirm Password` varchar(12) NOT NULL,
  `Provider Code` varchar(10) NOT NULL,
  `Date of Birth` date NOT NULL,
  `Sex` enum('Male','Female','Other') NOT NULL,
  `Pronouns` enum('He/Him','She/Her','They/Them') NOT NULL,
  `preffered Name` varchar(45) NOT NULL,
  `Phone Number` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister_has_addappt`
--

CREATE TABLE `providerregister_has_addappt` (
  `ProviderRegister_ProviderId` int(11) NOT NULL,
  `AddAppt_AddApptId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister_has_appointments`
--

CREATE TABLE `providerregister_has_appointments` (
  `ProviderRegister_ProviderId` int(11) NOT NULL,
  `Appointments_AppointmentsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister_has_medical notes`
--

CREATE TABLE `providerregister_has_medical notes` (
  `ProviderRegister_ProviderId` int(11) NOT NULL,
  `Medical Notes_Medical Notes Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister_has_medications`
--

CREATE TABLE `providerregister_has_medications` (
  `ProviderRegister_ProviderId` int(11) NOT NULL,
  `Medications_MedicationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister_has_provider calendar`
--

CREATE TABLE `providerregister_has_provider calendar` (
  `ProviderRegister_ProviderId` int(11) NOT NULL,
  `Provider Calendar_ProviderCalendarId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister_has_providerinbox`
--

CREATE TABLE `providerregister_has_providerinbox` (
  `ProviderRegister_ProviderId` int(11) NOT NULL,
  `ProviderInbox_Id` int(11) NOT NULL,
  `ProviderInbox_PatientId` varchar(45) NOT NULL,
  `ProviderInbox_ProviderId` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerregister_has_providerregister`
--

CREATE TABLE `providerregister_has_providerregister` (
  `ProviderRegister_ProviderId` int(11) NOT NULL,
  `ProviderRegister_ProviderId1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providerupdate`
--

CREATE TABLE `providerupdate` (
  `ProviderId` int(11) NOT NULL,
  `Preferred Name` varchar(50) NOT NULL,
  `Specialty` varchar(60) NOT NULL,
  `NPI Number` varchar(10) NOT NULL,
  `DEA Number` varchar(9) DEFAULT NULL,
  `Bank name` varchar(20) NOT NULL,
  `Account Number` varchar(13) NOT NULL,
  `Additional Information` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updatemedicalinfo`
--

CREATE TABLE `updatemedicalinfo` (
  `PatientId` int(11) NOT NULL,
  `Height` decimal(5,2) NOT NULL,
  `Weight` decimal(5,2) NOT NULL,
  `Medications` varchar(255) NOT NULL,
  `Reported Medications` varchar(255) NOT NULL,
  `Allergies` varchar(255) NOT NULL,
  `Medical History` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update patient profile`
--

CREATE TABLE `update patient profile` (
  `PatientId` int(11) NOT NULL,
  `Prefered name` varchar(50) NOT NULL,
  `Pronouns` enum('He/Him','Her/She','They/Them') NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State/Province` varchar(12) NOT NULL,
  `Zip Code` varchar(5) NOT NULL,
  `PhoneNumber` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videorooms`
--

CREATE TABLE `videorooms` (
  `RoomId` int(11) NOT NULL,
  `Created At` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addappt`
--
ALTER TABLE `addappt`
  ADD PRIMARY KEY (`AddApptId`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppointmentsId`);

--
-- Indexes for table `medical notes`
--
ALTER TABLE `medical notes`
  ADD PRIMARY KEY (`Medical Notes Id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`MedicationId`),
  ADD KEY `ProviderId_idx` (`ProviderId`),
  ADD KEY `PatientId_idx` (`PatientId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`MessageId`);

--
-- Indexes for table `patientappointments`
--
ALTER TABLE `patientappointments`
  ADD PRIMARY KEY (`AppointmentsId`);

--
-- Indexes for table `patient register`
--
ALTER TABLE `patient register`
  ADD PRIMARY KEY (`UserId`,`ProviderRegister_ProviderId`);

--
-- Indexes for table `patient register_has_messages`
--
ALTER TABLE `patient register_has_messages`
  ADD PRIMARY KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`,`Messages_MessageId`),
  ADD KEY `fk_Patient Register_has_Messages_Messages1_idx` (`Messages_MessageId`),
  ADD KEY `fk_Patient Register_has_Messages_Patient Register1_idx` (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`);

--
-- Indexes for table `patient register_has_patientappointments`
--
ALTER TABLE `patient register_has_patientappointments`
  ADD PRIMARY KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`,`PatientAppointments_AppointmentsId`),
  ADD KEY `fk_Patient Register_has_PatientAppointments_PatientAppointm_idx` (`PatientAppointments_AppointmentsId`),
  ADD KEY `fk_Patient Register_has_PatientAppointments_Patient Registe_idx` (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`);

--
-- Indexes for table `patient register_has_updatemedicalinfo`
--
ALTER TABLE `patient register_has_updatemedicalinfo`
  ADD PRIMARY KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`,`UpdateMedicalInfo_PatientId`),
  ADD KEY `fk_Patient Register_has_UpdateMedicalInfo_UpdateMedicalInfo_idx` (`UpdateMedicalInfo_PatientId`),
  ADD KEY `fk_Patient Register_has_UpdateMedicalInfo_Patient Register1_idx` (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`);

--
-- Indexes for table `patient register_has_update patient profile`
--
ALTER TABLE `patient register_has_update patient profile`
  ADD PRIMARY KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`,`Update Patient Profile_PatientId`),
  ADD KEY `fk_Patient Register_has_Update Patient Profile_Update Patie_idx` (`Update Patient Profile_PatientId`),
  ADD KEY `fk_Patient Register_has_Update Patient Profile_Patient Regi_idx` (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`);

--
-- Indexes for table `patient register_has_videorooms`
--
ALTER TABLE `patient register_has_videorooms`
  ADD PRIMARY KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`,`VideoRooms_RoomId`),
  ADD KEY `fk_Patient Register_has_VideoRooms_VideoRooms1_idx` (`VideoRooms_RoomId`),
  ADD KEY `fk_Patient Register_has_VideoRooms_Patient Register1_idx` (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`);

--
-- Indexes for table `provider calendar`
--
ALTER TABLE `provider calendar`
  ADD PRIMARY KEY (`ProviderCalendarId`);

--
-- Indexes for table `providerinbox`
--
ALTER TABLE `providerinbox`
  ADD PRIMARY KEY (`Id`,`PatientId`,`ProviderId`);

--
-- Indexes for table `providerregister`
--
ALTER TABLE `providerregister`
  ADD PRIMARY KEY (`ProviderId`);

--
-- Indexes for table `providerregister_has_addappt`
--
ALTER TABLE `providerregister_has_addappt`
  ADD PRIMARY KEY (`ProviderRegister_ProviderId`,`AddAppt_AddApptId`),
  ADD KEY `fk_ProviderRegister_has_AddAppt_AddAppt1_idx` (`AddAppt_AddApptId`),
  ADD KEY `fk_ProviderRegister_has_AddAppt_ProviderRegister1_idx` (`ProviderRegister_ProviderId`);

--
-- Indexes for table `providerregister_has_appointments`
--
ALTER TABLE `providerregister_has_appointments`
  ADD PRIMARY KEY (`ProviderRegister_ProviderId`,`Appointments_AppointmentsId`),
  ADD KEY `fk_ProviderRegister_has_Appointments_Appointments1_idx` (`Appointments_AppointmentsId`),
  ADD KEY `fk_ProviderRegister_has_Appointments_ProviderRegister1_idx` (`ProviderRegister_ProviderId`);

--
-- Indexes for table `providerregister_has_medical notes`
--
ALTER TABLE `providerregister_has_medical notes`
  ADD PRIMARY KEY (`ProviderRegister_ProviderId`,`Medical Notes_Medical Notes Id`),
  ADD KEY `fk_ProviderRegister_has_Medical Notes_Medical Notes1_idx` (`Medical Notes_Medical Notes Id`),
  ADD KEY `fk_ProviderRegister_has_Medical Notes_ProviderRegister1_idx` (`ProviderRegister_ProviderId`);

--
-- Indexes for table `providerregister_has_medications`
--
ALTER TABLE `providerregister_has_medications`
  ADD PRIMARY KEY (`ProviderRegister_ProviderId`,`Medications_MedicationId`),
  ADD KEY `fk_ProviderRegister_has_Medications_Medications1_idx` (`Medications_MedicationId`),
  ADD KEY `fk_ProviderRegister_has_Medications_ProviderRegister1_idx` (`ProviderRegister_ProviderId`);

--
-- Indexes for table `providerregister_has_provider calendar`
--
ALTER TABLE `providerregister_has_provider calendar`
  ADD PRIMARY KEY (`ProviderRegister_ProviderId`,`Provider Calendar_ProviderCalendarId`),
  ADD KEY `fk_ProviderRegister_has_Provider Calendar_Provider Calendar_idx` (`Provider Calendar_ProviderCalendarId`),
  ADD KEY `fk_ProviderRegister_has_Provider Calendar_ProviderRegister1_idx` (`ProviderRegister_ProviderId`);

--
-- Indexes for table `providerregister_has_providerinbox`
--
ALTER TABLE `providerregister_has_providerinbox`
  ADD PRIMARY KEY (`ProviderRegister_ProviderId`,`ProviderInbox_Id`,`ProviderInbox_PatientId`,`ProviderInbox_ProviderId`),
  ADD KEY `fk_ProviderRegister_has_ProviderInbox_ProviderInbox1_idx` (`ProviderInbox_Id`,`ProviderInbox_PatientId`,`ProviderInbox_ProviderId`),
  ADD KEY `fk_ProviderRegister_has_ProviderInbox_ProviderRegister1_idx` (`ProviderRegister_ProviderId`);

--
-- Indexes for table `providerregister_has_providerregister`
--
ALTER TABLE `providerregister_has_providerregister`
  ADD PRIMARY KEY (`ProviderRegister_ProviderId`,`ProviderRegister_ProviderId1`),
  ADD KEY `fk_ProviderRegister_has_ProviderRegister_ProviderRegister2_idx` (`ProviderRegister_ProviderId1`),
  ADD KEY `fk_ProviderRegister_has_ProviderRegister_ProviderRegister1_idx` (`ProviderRegister_ProviderId`);

--
-- Indexes for table `providerupdate`
--
ALTER TABLE `providerupdate`
  ADD PRIMARY KEY (`ProviderId`);

--
-- Indexes for table `updatemedicalinfo`
--
ALTER TABLE `updatemedicalinfo`
  ADD PRIMARY KEY (`PatientId`);

--
-- Indexes for table `update patient profile`
--
ALTER TABLE `update patient profile`
  ADD PRIMARY KEY (`PatientId`);

--
-- Indexes for table `videorooms`
--
ALTER TABLE `videorooms`
  ADD PRIMARY KEY (`RoomId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addappt`
--
ALTER TABLE `addappt`
  MODIFY `AddApptId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `AppointmentsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical notes`
--
ALTER TABLE `medical notes`
  MODIFY `Medical Notes Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `MedicationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `MessageId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patientappointments`
--
ALTER TABLE `patientappointments`
  MODIFY `AppointmentsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient register`
--
ALTER TABLE `patient register`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provider calendar`
--
ALTER TABLE `provider calendar`
  MODIFY `ProviderCalendarId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providerinbox`
--
ALTER TABLE `providerinbox`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providerregister`
--
ALTER TABLE `providerregister`
  MODIFY `ProviderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providerupdate`
--
ALTER TABLE `providerupdate`
  MODIFY `ProviderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updatemedicalinfo`
--
ALTER TABLE `updatemedicalinfo`
  MODIFY `PatientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update patient profile`
--
ALTER TABLE `update patient profile`
  MODIFY `PatientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videorooms`
--
ALTER TABLE `videorooms`
  MODIFY `RoomId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addappt`
--
ALTER TABLE `addappt`
  ADD CONSTRAINT `AddAppId` FOREIGN KEY (`AddApptId`) REFERENCES `provider calendar` (`ProviderCalendarId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `medications`
--
ALTER TABLE `medications`
  ADD CONSTRAINT `PatientId` FOREIGN KEY (`PatientId`) REFERENCES `patient register` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderId` FOREIGN KEY (`ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `patientappointments`
--
ALTER TABLE `patientappointments`
  ADD CONSTRAINT `AppointmentId` FOREIGN KEY (`AppointmentsId`) REFERENCES `provider calendar` (`ProviderCalendarId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient register_has_messages`
--
ALTER TABLE `patient register_has_messages`
  ADD CONSTRAINT `fk_Patient Register_has_Messages_Messages1` FOREIGN KEY (`Messages_MessageId`) REFERENCES `messages` (`MessageId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Patient Register_has_Messages_Patient Register1` FOREIGN KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`) REFERENCES `patient register` (`UserId`, `ProviderRegister_ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient register_has_patientappointments`
--
ALTER TABLE `patient register_has_patientappointments`
  ADD CONSTRAINT `fk_Patient Register_has_PatientAppointments_Patient Register1` FOREIGN KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`) REFERENCES `patient register` (`UserId`, `ProviderRegister_ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Patient Register_has_PatientAppointments_PatientAppointmen1` FOREIGN KEY (`PatientAppointments_AppointmentsId`) REFERENCES `patientappointments` (`AppointmentsId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient register_has_updatemedicalinfo`
--
ALTER TABLE `patient register_has_updatemedicalinfo`
  ADD CONSTRAINT `fk_Patient Register_has_UpdateMedicalInfo_Patient Register1` FOREIGN KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`) REFERENCES `patient register` (`UserId`, `ProviderRegister_ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Patient Register_has_UpdateMedicalInfo_UpdateMedicalInfo1` FOREIGN KEY (`UpdateMedicalInfo_PatientId`) REFERENCES `updatemedicalinfo` (`PatientId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient register_has_update patient profile`
--
ALTER TABLE `patient register_has_update patient profile`
  ADD CONSTRAINT `fk_Patient Register_has_Update Patient Profile_Patient Regist1` FOREIGN KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`) REFERENCES `patient register` (`UserId`, `ProviderRegister_ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Patient Register_has_Update Patient Profile_Update Patient1` FOREIGN KEY (`Update Patient Profile_PatientId`) REFERENCES `update patient profile` (`PatientId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient register_has_videorooms`
--
ALTER TABLE `patient register_has_videorooms`
  ADD CONSTRAINT `fk_Patient Register_has_VideoRooms_Patient Register1` FOREIGN KEY (`Patient Register_UserId`,`Patient Register_ProviderRegister_ProviderId`) REFERENCES `patient register` (`UserId`, `ProviderRegister_ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Patient Register_has_VideoRooms_VideoRooms1` FOREIGN KEY (`VideoRooms_RoomId`) REFERENCES `videorooms` (`RoomId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `provider calendar`
--
ALTER TABLE `provider calendar`
  ADD CONSTRAINT `ProviderCalenderId` FOREIGN KEY (`ProviderCalendarId`) REFERENCES `appointments` (`AppointmentsId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providerregister_has_addappt`
--
ALTER TABLE `providerregister_has_addappt`
  ADD CONSTRAINT `fk_ProviderRegister_has_AddAppt_AddAppt1` FOREIGN KEY (`AddAppt_AddApptId`) REFERENCES `addappt` (`AddApptId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderRegister_has_AddAppt_ProviderRegister1` FOREIGN KEY (`ProviderRegister_ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providerregister_has_appointments`
--
ALTER TABLE `providerregister_has_appointments`
  ADD CONSTRAINT `fk_ProviderRegister_has_Appointments_Appointments1` FOREIGN KEY (`Appointments_AppointmentsId`) REFERENCES `appointments` (`AppointmentsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderRegister_has_Appointments_ProviderRegister1` FOREIGN KEY (`ProviderRegister_ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providerregister_has_medical notes`
--
ALTER TABLE `providerregister_has_medical notes`
  ADD CONSTRAINT `fk_ProviderRegister_has_Medical Notes_Medical Notes1` FOREIGN KEY (`Medical Notes_Medical Notes Id`) REFERENCES `medical notes` (`Medical Notes Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderRegister_has_Medical Notes_ProviderRegister1` FOREIGN KEY (`ProviderRegister_ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providerregister_has_medications`
--
ALTER TABLE `providerregister_has_medications`
  ADD CONSTRAINT `fk_ProviderRegister_has_Medications_Medications1` FOREIGN KEY (`Medications_MedicationId`) REFERENCES `medications` (`MedicationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderRegister_has_Medications_ProviderRegister1` FOREIGN KEY (`ProviderRegister_ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providerregister_has_provider calendar`
--
ALTER TABLE `providerregister_has_provider calendar`
  ADD CONSTRAINT `fk_ProviderRegister_has_Provider Calendar_Provider Calendar1` FOREIGN KEY (`Provider Calendar_ProviderCalendarId`) REFERENCES `provider calendar` (`ProviderCalendarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderRegister_has_Provider Calendar_ProviderRegister1` FOREIGN KEY (`ProviderRegister_ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providerregister_has_providerinbox`
--
ALTER TABLE `providerregister_has_providerinbox`
  ADD CONSTRAINT `fk_ProviderRegister_has_ProviderInbox_ProviderInbox1` FOREIGN KEY (`ProviderInbox_Id`,`ProviderInbox_PatientId`,`ProviderInbox_ProviderId`) REFERENCES `providerinbox` (`Id`, `PatientId`, `ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderRegister_has_ProviderInbox_ProviderRegister1` FOREIGN KEY (`ProviderRegister_ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providerregister_has_providerregister`
--
ALTER TABLE `providerregister_has_providerregister`
  ADD CONSTRAINT `fk_ProviderRegister_has_ProviderRegister_ProviderRegister1` FOREIGN KEY (`ProviderRegister_ProviderId`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ProviderRegister_has_ProviderRegister_ProviderRegister2` FOREIGN KEY (`ProviderRegister_ProviderId1`) REFERENCES `providerregister` (`ProviderId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
