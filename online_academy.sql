-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 01, 2021 lúc 03:53 PM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `online_academy`
--
CREATE DATABASE IF NOT EXISTS `online_academy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `online_academy`;

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `tokens`
--

CREATE TABLE `tokens` (
	UserID int,
    Token varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tokens`
--



-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `users`
--
CREATE TABLE `users` (
	UserID INT AUTO_INCREMENT PRIMARY KEY not null,
	Email varchar(50) DEFAULT NULL,
    Password varchar(255) DEFAULT NULL,
    UserName varchar(50) DEFAULT NULL,
    Permission int(6) DEFAULT NULL,
    Verification int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CategoryID` int(10) NOT NULL,
  `CategoryName` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Web Development'),
(2, 'Mobile Development');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `CourseID` int(10) NOT NULL,
  `CourseImage` varchar(26) DEFAULT NULL,
  `CourseName` varchar(60) DEFAULT NULL,
  `ShortDes` varchar(120) DEFAULT NULL,
  `StudentCount` int(6) DEFAULT NULL,
  `Price` int(7) DEFAULT NULL,
  `SalePrice` int(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SubCategoryID` int(10) DEFAULT NULL,
  `View` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`CourseID`, `CourseImage`, `CourseName`, `ShortDes`, `StudentCount`, `Price`, `SalePrice`, `UpdatedAt`, `SubCategoryID`, `View`) VALUES
(1, 'images/courses/1/main.jpg', 'Flutter & Dart - The Complete Guide [2020 Edition]', 'A Complete Guide to the Flutter SDK & Flutter Framework for building native iOS and Android apps', 111900, 3000000, 300000, '0000-00-00 00:00:00.000000', 1, 1000),
(2, 'images/courses/2/main.jpg', 'The Complete 2020 Flutter Development Bootcamp with Dart', 'Officially created in collaboration with the Google Flutter team.', 84899, 3000000, 300000, '0000-00-00 00:00:00.000000', 1, 2000),
(3, 'images/courses/3/main.jpg', 'Dart and Flutter: The Complete Developer\'s Guide', 'Everything you need to know for building mobile apps with Flutter and Dart, including RxDart and Animations!', 20074, 3000000, 300000, '0000-00-00 00:00:00.000000', 1, 2000),
(4, 'images/courses/4/main.jpg', 'Flutter & Dart - The Complete Flutter App Development Course', 'Build Flutter iOS and Android Apps with a Single Codebase: Learn Google\'s Flutter Mobile Development Framework & Dart', 17851, 3000000, 300000, '0000-00-00 00:00:00.000000', 1, 2500),
(5, 'images/courses/5/main.png', 'Flutter & Firebase: Build a Complete App for iOS & Android', 'Learn Dart, Flutter & Firebase by Google, and build a real-world, production ready app', 7642, 3000000, 300000, '0000-00-00 00:00:00.000000', 1, 2500),
(6, 'images/courses/6/main.jpg', 'The Complete Flutter UI Masterclass | iOS, Android, & Web', 'Learn how to build beautiful and responsive iOS, Android, and Web user interfaces using Flutter and Dart!', 2023, 1200000, -1, '0000-00-00 00:00:00.000000', 1, 3000),
(7, 'images/courses/7/main.jpg', 'Master Flutter - Learn Dart & Flutter by Developing 5 Apps', 'Learn Google Flutter & Dart by Developing 5 Real Life & Enterprise Apps including UI, App Dashboard and API', 1373, 3000000, 300000, '0000-00-00 00:00:00.000000', 1, 3000),
(8, 'images/courses/8/main.jpg', 'The Complete Android N Developer Course', 'Learn Android App Development with Android 7 Nougat by building real apps including Uber, Whatsapp and Instagram!', 147909, 3000000, 300000, '0000-00-00 00:00:00.000000', 2, 1800),
(9, 'images/courses/9/main.jpg', 'The Complete Android Oreo Developer Course - Build 23 Apps!', 'Learn Android O App Development using Java & Kotlin - build real apps including Super Mario Run, Whatsapp and Instagram!', 68517, 3000000, 300000, '0000-00-00 00:00:00.000000', 2, 1800),
(10, 'images/courses/10/main.jpg', 'Android Java Masterclass - Become an App Developer', 'Improve your career options by learning Android app Development. Master Android Studio and build your first app today', 56288, 2300000, 230000, '0000-00-00 00:00:00.000000', 2, 2300),
(11, 'images/courses/11/main.jpg', 'The Comprehensive Android Development Masterclass', 'Master New Android API\'s like ROOM Database, ML Kit Face Recognition, Firestore, Firebase, Maps and Android Studio IDE', 11872, 3000000, 300000, '0000-00-00 00:00:00.000000', 2, 2300),
(12, 'images/courses/12/main.jpg', 'Android O & Java - The Complete Android Development Bootcamp', 'Learn Android O app development from beginning to end. Learn to code in Java while building fun Android O projects.', 34714, 3000000, 300000, '0000-00-00 00:00:00.000000', 2, 1450),
(13, 'images/courses/13/main.jpg', 'Android App Development Masterclass using Kotlin', 'Learn Kotlin Android App Development And Become an Android Developer. Incl. Kotlin Tutorial and Android Tutorial Videos', 26759, 2300000, 230000, '0000-00-00 00:00:00.000000', 2, 1450),
(14, 'images/courses/14/main.jpg', 'The Complete Android R + Java Developer Course™ : 2020', 'In this course, you\'ll learn Android Development and get to build your own Android R apps by using Java.', 31225, 3000000, 300000, '0000-00-00 00:00:00.000000', 2, 1203),
(15, 'images/courses/15/main.jpg', 'The Complete JavaScript Course 2020: From Zero to Expert!', 'The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!', 384225, 3000000, 300000, '0000-00-00 00:00:00.000000', 3, 1203),
(16, 'images/courses/16/main.jpg', 'JavaScript: Understanding the Weird Parts', 'An advanced JavaScript course for everyone! Scope, closures, prototypes, \'this\', build your own framework, and more.', 155488, 3000000, 300000, '0000-00-00 00:00:00.000000', 3, 1100),
(17, 'images/courses/17/main.jpg', 'Modern JavaScript From The Beginning', 'Learn and build projects with pure JavaScript (No frameworks or libraries)', 75217, 3000000, 300000, '0000-00-00 00:00:00.000000', 3, 1100),
(18, 'images/courses/18/main.jpg', 'JavaScript - The Complete Guide 2021 (Beginner + Advanced)', 'Modern JavaScript from the beginning - all the way up to JS expert level! THE must-have JavaScript resource in 2020.', 61438, 3000000, 300000, '0000-00-00 00:00:00.000000', 3, 2300),
(19, 'images/courses/19/main.jpg', 'The Modern JavaScript Bootcamp', 'Learn JavaScript by building real-world apps. Includes 3 real-world projects, 80 programming challenges, and ES6/ES7!', 40753, 3000000, 300000, '0000-00-00 00:00:00.000000', 3, 2300),
(20, 'images/courses/20/main.jpg', 'JavaScript: The Advanced Concepts', 'Learn modern advanced JavaScript practices and be in the top 10% of JavaScript developers', 37959, 3000000, 300000, '0000-00-00 00:00:00.000000', 3, 3100),
(21, 'images/courses/21/main.jpg', 'The Modern Javascript Bootcamp Course (2020)', 'The most up-to-date JS resource online! Master Javascript by building a beautiful portfolio of projects!', 32327, 3000000, 300000, '0000-00-00 00:00:00.000000', 3, 3100),
(22, 'images/courses/22/main.jpg', 'React - The Complete Guide (incl Hooks, React Router, Redux)', 'Dive in and learn React.js from scratch! Learn Reactjs, Hooks, Redux, React Routing, Animations, Next.js and way more!', 99032, 3000000, 300000, '0000-00-00 00:00:00.000000', 4, 3200),
(23, 'images/courses/23/main.jpg', 'Modern React with Redux [2020 Update]', 'Master React v16.6.3 and Redux with React Router, Webpack, and Create-React-App. Includes Hooks!', 217685, 3000000, 300000, '0000-00-00 00:00:00.000000', 4, 3200),
(24, 'images/courses/24/main.jpg', 'Advanced React and Redux', 'Walkthroughs on advanced React v16.6.3 and Redux v4.0.0 - Authentication, Testing, Middlewares, HOC\'s, and Deployment', 68806, 3000000, 300000, '0000-00-00 00:00:00.000000', 4, 2800),
(25, 'images/courses/25/main.jpg', 'Node with React: Fullstack Web Development', 'Build and deploy fullstack web apps with NodeJS, React, Redux, Express, and MongoDB.', 69067, 3000000, 300000, '0000-00-00 00:00:00.000000', 4, 2800),
(26, 'images/courses/26/main.jpg', 'The Complete React Developer Course (w/ Hooks and Redux)', 'Learn how to build and launch React web applications using React, Redux, Webpack, React-Router, and more!', 65012, 3000000, 300000, '0000-00-00 00:00:00.000000', 4, 2900),
(27, 'images/courses/27/main.jpg', 'GraphQL with React: The Complete Developers Guide', 'Learn and master GraphQL by building real web apps with React and Node', 42339, 3000000, 300000, '0000-00-00 00:00:00.000000', 4, 2900),
(28, 'images/courses/28/main.jpg', 'The Modern React Bootcamp (Hooks, Context, NextJS, Router)', 'Just published! Follow the same curriculum I teach my students in SF. 10+ projects including one HUGE application!', 23345, 3000000, 300000, '0000-00-00 00:00:00.000000', 4, 3000),
(29, 'images/courses/29/main.jpg', 'Build Responsive Real World Websites with HTML5 and CSS3', 'The easiest way to learn modern web design, HTML5 and CSS3 step-by-step from scratch. Design AND code a huge project.', 210654, 3000000, 300000, '0000-00-00 00:00:00.000000', 5, 3000),
(30, 'images/courses/30/main.jpg', 'Advanced CSS and Sass: Flexbox, Grid, Animations and More!', 'The most advanced and modern CSS course on the internet: master flexbox, CSS Grid, responsive design, and so much more.', 119791, 3000000, 300000, '0000-00-00 00:00:00.000000', 5, 3100),
(31, 'images/courses/31/main.jpg', 'Web Design for Beginners: Real World Coding in HTML & CSS', 'Launch a career as a web designer by learning HTML5, CSS3, responsive design, Sass and more!', 51798, 3000000, 350000, '0000-00-00 00:00:00.000000', 5, 3100),
(32, 'images/courses/32/main.jpg', 'CSS - The Complete Guide 2021 (incl. Flexbox, Grid & Sass)', 'Learn CSS for the first time or brush up your CSS skills and dive in even deeper. EVERY web developer has to know CSS.', 47246, 3000000, 300000, '0000-00-00 00:00:00.000000', 5, 1750),
(33, 'images/courses/33/main.jpg', 'Modern HTML & CSS From The Beginning (Including Sass)', 'Build modern responsive websites & UIs with HTML5, CSS3 & Sass! Learn Flex & CSS Grid', 45455, 3000000, 300000, '0000-00-00 00:00:00.000000', 5, 1750),
(34, 'images/courses/34/main.jpg', 'Build Websites from Scratch with HTML & CSS', 'Learn Web Development Essentials and Become a Web Developer From Scratch in this Complete HTML & CSS Beginner\'s Course', 64924, 3000000, 300000, '0000-00-00 00:00:00.000000', 5, 1908),
(35, 'images/courses/35/main.jpg', '50 Projects In 50 Days - HTML, CSS & JavaScript', 'Sharpen your skills by building 50 quick, unique & fun mini projects', 9489, 3000000, 300000, '0000-00-00 00:00:00.000000', 5, 1809);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_content`
--

CREATE TABLE `course_content` (
  `ContentID` int(10) NOT NULL,
  `ContentName` varchar(74) DEFAULT NULL,
  `CourseID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `course_content`
--

INSERT INTO `course_content` (`ContentID`, `ContentName`, `CourseID`) VALUES
(1, 'Introduction', 1),
(2, 'Flutter Basics', 1),
(3, 'Running Apps on Different Devices & Debugging Apps', 1),
(4, 'Introduction', 2),
(5, 'Setup and Installation', 2),
(6, 'How to create Flutter App from scratch', 2),
(7, 'Let\'s Dive In!', 3),
(8, 'A Dart Introduction', 3),
(9, 'Staing on Target with Dart', 3),
(10, 'Getting Started', 4),
(11, 'Why Flutter', 4),
(12, 'Object Oriented Programming - Introduction', 4),
(13, 'Course Introduction', 5),
(14, 'Introduction to Dart', 5),
(15, 'Flutter setup on macOS', 5),
(16, 'Introduction', 6),
(17, 'Food Delivery App', 6),
(18, 'Budget App', 6),
(19, 'Introduction', 7),
(20, 'Installation and configuration', 7),
(21, 'Flutter - Welcome to my Universe', 7),
(22, 'What Does the Course Cover?', 8),
(23, 'Introduction To Android Studio', 8),
(24, 'Java Deep Dive', 8),
(25, 'What Does the Course Cover?', 9),
(26, 'Introduction To Android Studio', 9),
(27, 'Java Deep Dive', 9),
(28, 'Introduction', 10),
(29, 'Downloading and Setup', 10),
(30, 'Hello World Android app', 10),
(31, 'Welcome', 11),
(32, 'Install Android Studio on Windows Machine', 11),
(33, 'Install Android Studio on Mac Machine', 11),
(34, 'Set up for Android Development', 12),
(35, 'Build the \"I am Rich\" App', 12),
(36, 'Coding Challenge #1 - Using the layout editor in Android Studio and Github', 12),
(37, 'Introduction and Course Information', 13),
(38, 'Downloading and Installing the Necessary Tools', 13),
(39, 'Hello World Android App', 13),
(40, 'Welcome to Android R', 14),
(41, 'Develop your first Android R App', 14),
(42, 'Learn to Code in Java', 14),
(43, 'Welcome, Welcome, Welcome', 15),
(44, 'JS Fundamental - Part 1', 15),
(45, 'JS Fundamental - Part 2', 15),
(46, 'Getting Started', 16),
(47, 'Execution Contexts and Lexical Environments', 16),
(48, 'Types and Operators', 16),
(49, 'Intro & Getting Started', 17),
(50, 'JS Language Fundamentals', 17),
(51, 'DOM Manipulation & Events', 17),
(52, 'Introduction', 18),
(53, 'Basics', 18),
(54, 'Efficient Development & Debugging', 18),
(55, 'Course Overview', 19),
(56, 'Setting up Your Machine', 19),
(57, 'JS Basics', 19),
(58, 'Introduction', 20),
(59, 'JavaScript Foundation', 20),
(60, 'JavaScript Foundation II', 20),
(61, 'Introduction', 21),
(62, 'JS Values & Variables', 21),
(63, 'How to Model data Efficiently', 21),
(64, 'Getting Started', 22),
(65, 'Refreshing Next generation JavaScript', 22),
(66, 'understanding the base Features * Syntax', 22),
(67, 'Let\'s Dive In!', 23),
(68, 'Building Content with JSX', 23),
(69, 'Communicating with Props', 23),
(70, 'Welcome! Let\'s Get Started!', 24),
(71, 'Testing', 24),
(72, 'Higher Order Components', 24),
(73, 'Course Overview', 25),
(74, 'Server Side Architecture', 25),
(75, 'Authentication with Google Oauth', 25),
(76, 'Welcome', 26),
(77, 'Setting up Your Machine', 26),
(78, 'Hello React', 26),
(79, 'Why GraphQL?', 27),
(80, 'A REST-ful Routing Primer', 27),
(81, 'On To GraphQL', 27),
(82, 'A Taste of React', 28),
(83, 'Introducing JSX', 28),
(84, 'Props and More', 28),
(85, 'Course Introduction', 29),
(86, 'Dive into HTML', 29),
(87, 'Formatting with CSS', 29),
(88, 'Welcome, Welcome, Welcome', 30),
(89, 'Natours Project - Setup and First Steps', 30),
(90, 'How CSS Works', 30),
(91, 'Welcome! Let\'s Get Started!', 31),
(92, 'HTML Essentials', 31),
(93, 'Adding Media to a Web Page', 31),
(94, 'Getting Started', 32),
(95, 'Diving Into the Basics of CSS', 32),
(96, 'Diving Deeper into CSS', 32),
(97, 'Introduction', 33),
(98, 'HTML Basics', 33),
(99, 'CSS Basics', 33),
(100, 'Getting Started', 34),
(101, 'HTML Foundations : Part I', 34),
(102, 'HTML Foundations : Part II', 34),
(103, 'Introduction', 35),
(104, 'Day 1 - Expanding Cards', 35),
(105, 'Day 2 - Progress Steps', 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_lecturer`
--

CREATE TABLE `course_lecturer` (
  `CourseID` int(10) NOT NULL,
  `LecturerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `course_lecturer`
--

INSERT INTO `course_lecturer` (`CourseID`, `LecturerID`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(8, 10),
(8, 11),
(9, 9),
(9, 11),
(9, 12),
(10, 13),
(10, 14),
(11, 5),
(12, 15),
(13, 13),
(13, 14),
(14, 16),
(15, 17),
(16, 18),
(17, 19),
(18, 1),
(18, 2),
(19, 20),
(20, 21),
(21, 4),
(21, 22),
(22, 1),
(22, 2),
(23, 4),
(24, 4),
(25, 4),
(26, 20),
(27, 4),
(28, 22),
(29, 17),
(30, 17),
(31, 23),
(32, 1),
(32, 2),
(32, 24),
(33, 19),
(34, 25),
(34, 26),
(35, 19),
(35, 27);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fulldes`
--

CREATE TABLE `fulldes` (
  `FullDesID` int(10) NOT NULL,
  `CourseID` int(10) DEFAULT NULL,
  `FullDes` varchar(138) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `fulldes`
--

INSERT INTO `fulldes` (`FullDesID`, `CourseID`, `FullDes`) VALUES
(1, 1, 'Learn Flutter and Dart from the ground up, step-by-step'),
(2, 1, 'Build engaging native mobile apps for both Android and iOS'),
(3, 1, 'Use features like Google Maps, the device camera, authentication and much more!'),
(4, 1, 'Learn how to upload images and how to send manual and automated push notifications'),
(5, 1, 'Learn all the basics without stopping after them: Dive deeply into Flutter & Dart and become an advanced developer'),
(6, 2, 'Build beautiful, fast and native-quality apps with Flutter'),
(7, 2, 'Become a fully-fledged Flutter developer'),
(8, 2, 'Build iOS and Android apps with just one codebase'),
(9, 2, 'Build iOS and Android apps using just one programming language (Dart)'),
(10, 2, 'Build a portfolio of beautiful Flutter apps to impress any recruiter'),
(11, 2, 'Understand all the fundamental concepts of Flutter development'),
(12, 2, 'Become proficient in one of the fastest growing technologies'),
(13, 3, 'Build beautiful multi-screen apps with Flutter'),
(14, 3, 'Understand the different approaches for loading and maintaining data in Flutter apps'),
(15, 3, 'Create and publish open source projects using Dart'),
(16, 3, 'Learn how to build offline-enabled apps with incredibly efficient data loading'),
(17, 3, 'Comprehend the best method for reading the incredible amount of Flutter documentation'),
(18, 3, 'Store long-term data on a user\'s physical device using SQLite'),
(19, 3, 'Master streams and understand reactive programming to create Flutter apps'),
(20, 4, 'Be ABLE to Build Any iOS and Android App You Want'),
(21, 4, 'MASTER Dart and Flutter Framework'),
(22, 4, 'BUILD Full-fledged Apps for Your Startup or Business'),
(23, 4, 'CREATE a Portfolio of Apps to Apply for Development Job'),
(24, 4, 'WORK as A Cross-Platform Mobile Developer Who can Develop iOS and Android Apps'),
(25, 4, 'GAIN a Competitive Advantage in the Workplace as a Flutter Mobile Developer'),
(26, 5, 'Build a complete, real-world app with Flutter & Firebase'),
(27, 5, 'Write iOS & Android apps with a single codebase'),
(28, 5, 'Write production-ready code following best practices and become a competent Flutter developer'),
(29, 5, 'Fast-track your Flutter learning with practical tips and proven techniques'),
(30, 6, 'Build beautiful mobile and web UI with Flutter and Dart'),
(31, 6, 'Learn how to implement basic and advanced Flutter widgets'),
(32, 6, 'Design and implement your own custom widgets'),
(33, 6, 'Visualize data with Flutter'),
(34, 7, 'Developing Android & iOS apps using Dart & Flutter'),
(35, 7, 'Design Professional Looking Apps'),
(36, 7, 'Design and Develop Enterprise Apps'),
(37, 7, 'Develop eCommerce & Blog App, API & App Dashboard - using Flutter & Laravel & MySQL, Sqflite, Shared preferences and Stripe'),
(38, 7, 'Develop News App, API & App Dashboard - using Flutter & NodeJS/ExpressJS & MySQL and Realtime notification using Firebase Cloud Message'),
(39, 7, 'Develop a todo app using Dart, Flutter and Sqflite'),
(40, 7, 'Publish Apps at Play Store and App Store'),
(41, 7, 'Monetize Your App'),
(42, 8, 'Make pretty much any Android app you like (your only limit is your imagination)'),
(43, 8, 'Submit your apps to Google Play and generate revenue with Google Pay and Google Ads'),
(44, 8, 'Become a professional app developer, take freelance gigs and work from anywhere in the world'),
(45, 8, 'Bored with the same old, same old? Apply for a new job in a software company as an Android developer'),
(46, 9, 'Make pretty much any Android app you like (your only limit is your imagination)'),
(47, 9, 'Submit your apps to Google Play and generate revenue with Google Pay and Google Ads'),
(48, 9, 'Become a professional app developer, take freelance gigs and work from anywhere in the world'),
(49, 9, 'Bored with the same old, same old? Apply for a new job in a software company as an Android developer'),
(50, 10, 'You’re taught step by step HOW to build Android 7 apps for Google’s Nougat platform that will work on older Android versions.'),
(51, 10, 'With each comprehensive step, the WHY you’re doing it is explained.'),
(52, 10, 'You’ll have EXPERT LEVEL knowledge of the Java programming language and know exactly how each process of Android Nougat development works.'),
(53, 10, 'The course is continually UPDATED, so you’ll learn the very latest as Android Nougat evolves.'),
(54, 10, 'NEW CONTENT is always being added, and you\'re covered with full lifetime access to the course.'),
(55, 10, 'SUPPORT is mind blowing – questions you have are answered that day.'),
(56, 10, 'The EXPERTISE to be an Android Nougat app developer as taught by the best.'),
(57, 10, 'The skills you’ll learn are in HIGH DEMAND. You’ve learned to program like an expert. Go get that job!'),
(58, 11, 'Master Java Programming Language'),
(59, 11, 'Build Dynamic Android Apps From Scratch'),
(60, 11, 'Master Android Development'),
(61, 11, 'Build Several Android Apps with the latest Android API\'s: ROOM, Firebase, Firestore and ML Kit Face Recognition'),
(62, 11, 'Learn Android Development Best Practices'),
(63, 11, 'Learn Android User Interface Design'),
(64, 12, 'Build any Android app you want'),
(65, 12, 'You\'ll have a portfolio of apps to apply for jr. developer jobs'),
(66, 12, 'Build apps for your business'),
(67, 12, 'You\'ll be able to work as a freelance Android contractor'),
(68, 13, 'Learn the core Android app development and Kotlin skills to build real Android apps.'),
(69, 13, 'Learn how to target current and older versions of Android when writing your apps.'),
(70, 13, 'Understand how to create Android apps using Kotlin.'),
(71, 13, 'Be able to apply for Android app development roles.'),
(72, 14, 'Apply for your dream job as an Android Developer'),
(73, 14, 'Build complex, production ready Java Android Applications'),
(74, 14, 'Build server based Android Applications with Paypal integration from scratch'),
(75, 14, 'Build a fantastic resume in order to show to employers'),
(76, 15, 'Become an advanced, confident, and modern JavaScript developer from scratch'),
(77, 15, 'Build 6 beautiful real-world projects for your portfolio (not boring toy apps)'),
(78, 15, 'Become job-ready by understanding how JavaScript really works behind the scenes'),
(79, 15, 'How to think and work like a developer: problem-solving, researching, workflows'),
(80, 16, 'Grasp how Javascript works and it\'s fundamental concepts'),
(81, 16, 'Write solid, good Javascript code'),
(82, 16, 'Understand advanced concepts such as closures, prototypal inheritance, IIFEs, and much more.'),
(83, 16, 'Drastically improve your ability to debug problems in Javascript.'),
(84, 17, 'Modular learning sections & 10 real world projects with pure JavaScript'),
(85, 17, 'Master the DOM (document object model) WITHOUT jQuery'),
(86, 17, 'Asynchronous programming with Ajax, Fetch API, Promises & Async / Await'),
(87, 17, 'OOP including ES5 prototypes & ES2015 classes'),
(88, 18, 'JavaScript from scratch - beginner to advanced'),
(89, 18, 'All core features and concepts you need to know in modern JavaScript development'),
(90, 18, 'Everything you need to become a JavaScript expert and apply for JavaScript jobs'),
(91, 18, 'Project-driven learning with plenty of examples'),
(92, 18, 'All about variables, functions, objects and arrays'),
(93, 18, 'Object-oriented programming'),
(94, 18, 'Deep dives into prototypes, JavaScript engines & how it works behind the scenes'),
(95, 18, 'Manipulating web pages (= the DOM) with JavaScript'),
(96, 18, 'Event handling, asynchronous coding and Http requests'),
(97, 18, 'Meta-programming, performance optimization, memory leak busting'),
(98, 18, 'Testing, security and deployment'),
(99, 18, 'And so much more!'),
(100, 19, 'Learn JavaScript by building three real-world web applications'),
(101, 19, 'Gain a deep understanding of how JavaScript works behind the scenes'),
(102, 19, 'Explore the latest cutting-edge features from ES6 and ES7'),
(103, 19, 'Test your skills and gain confidence by completing over 80 coding challenges'),
(104, 19, 'Learn how to deploy your application to the web so you can share them with everyone'),
(105, 19, 'Learn how to use Promises and Async/Await with asynchronous JavaScript'),
(106, 19, 'Get more done by learning how to debug and fix your code when things go wrong'),
(107, 19, 'Get access to a free 80 page PDF guide with lecture notes, code samples, and documentation links'),
(108, 20, 'Advanced JavaScript Practices'),
(109, 20, 'Object Oriented Programming'),
(110, 20, 'Functional Programming'),
(111, 20, 'Scope and Execution Context'),
(112, 20, 'Inheritance + Prototype Chain'),
(113, 20, 'Latest features: ES6, ES7, ES8, ES9, ES10, ES2020'),
(114, 21, 'Learn everything there is to know about Javascript - from scratch!'),
(115, 21, 'Build beautiful web apps to add to your portfolio'),
(116, 21, 'Get job ready with a deep understanding of the internals of JS'),
(117, 21, 'Work with Node JS and Express'),
(118, 21, 'Create a full E-Commerce app complete with authentication'),
(119, 21, 'Automate testing your code by creating your own custom testing framework!'),
(120, 22, 'Build powerful, fast, user-friendly and reactive web apps'),
(121, 22, 'Provide amazing user experiences by leveraging the power of JavaScript with ease'),
(122, 22, 'Apply for high-paid jobs or work as a freelancer in one the most-demanded sectors you can find in web dev right now'),
(123, 22, 'Learn React Hooks & Class-based Components'),
(124, 23, 'Build amazing single page applications with React JS and Redux'),
(125, 23, 'Master fundamental concepts behind structuring Redux applications'),
(126, 23, 'Realize the power of building composable components'),
(127, 23, 'Be the engineer who explains how Redux works to everyone else, because you know the fundamentals so well'),
(128, 23, 'Become fluent in the toolchain supporting React, including NPM, Webpack, Babel, and ES6/ES2015 Javascript syntax'),
(129, 24, 'Build a scaleable API with authentication using Express, Mongo, and Passport'),
(130, 24, 'Learn the differences between cookie-based and token-based authentication'),
(131, 24, 'Figure out what a Higher Order Component and how to use it to write dramatically less code'),
(132, 24, 'Write Redux middleware from scratch to uncover what is happening behind the scenes with Redux'),
(133, 24, 'Set up your own testing environment with Jest and Enzyme'),
(134, 24, 'Realize the power of building composable components'),
(135, 25, 'Create boilerplate starter projects with React, Redux, Express, and Mongo'),
(136, 25, 'Understand common web technologies and design patterns to connect them together'),
(137, 25, 'Master deployment techniques between the production and development environments'),
(138, 25, 'Make an app with Google OAuth authentication'),
(139, 25, 'Learn to effectively create and send emails from a backend server'),
(140, 25, 'Accept and process credit card payments from users'),
(141, 26, 'Build, test, and launch React apps'),
(142, 26, 'Use cutting-edge ES6/ES7 JavaScript'),
(143, 26, 'Setup authentication and user accounts'),
(144, 26, 'Deploy your React apps live to the web'),
(145, 26, 'Learn the latest React libraries and tools'),
(146, 26, 'Master React, Redux, React-Router, and more'),
(147, 27, 'Build amazing single page applications with React JS and GraphQL'),
(148, 27, 'Master fundamental concepts behind structuring GraphQL servers'),
(149, 27, 'Realize the power of building flexible data schemas'),
(150, 27, 'Be the engineer who explains how GraphQL works to everyone else, because you know the fundamentals so well'),
(151, 27, 'Become fluent in the ecosystem supporting GraphQL, including the differences between Apollo and Relay'),
(152, 28, 'React Hooks! (My favorite part of React!)'),
(153, 28, 'The new Context API'),
(154, 28, 'State management w/ useReducer + use Context (Redux Lite)'),
(155, 28, 'The basics of React (props, state, etc)'),
(156, 28, 'Master React Router'),
(157, 28, 'Build tons of projects, each with a beautiful interface'),
(158, 29, 'Real-world skills to build real-world websites: professional, beautiful and truly responsive websites'),
(159, 29, 'A huge project that will teach you everything you need to know to get started with HTML5 and CSS3'),
(160, 29, 'The proven 7 real-world steps from complete scratch to a fully functional and optimized website'),
(161, 29, 'Simple-to-use web design guidelines and tips to make your website stand out from the crowd'),
(162, 30, 'Tons of modern CSS techniques to create stunning designs and effects'),
(163, 30, 'Advanced CSS animations with @keyframes, animation and transition'),
(164, 30, 'How CSS works behind the scenes: the cascade, specificity, inheritance, etc.'),
(165, 30, 'CSS architecture: component-based design, BEM, writing reusable code, etc.'),
(166, 31, 'Create any website layout you can imagine'),
(167, 31, 'Support any device size with Responsive (mobile-friendly) Design'),
(168, 31, 'Add tasteful animations and effects with CSS3'),
(169, 31, 'Use common vocabulary from the design industry'),
(170, 32, 'Build beautiful websites which don\'t just contain great content but also look good'),
(171, 32, 'Use basic as well as advanced CSS features'),
(172, 32, 'Understand the concepts and theory behind CSS and certain CSS features'),
(173, 33, 'Build Multiple High Quality Website & UI Projects'),
(174, 33, 'HTML5 Semantic Layout & CSS Fundamentals'),
(175, 33, 'Flexbox & CSS Grid Projects'),
(176, 33, 'CSS Variables, Transitions, Dropdowns, Overlays & More'),
(177, 33, 'Website Hosting & Deployment With FTP & Git'),
(178, 33, 'All Skill Levels'),
(179, 34, 'By the end of this course, you will have a basic & thorough understanding of HTML & CSS'),
(180, 34, 'Upon completion, you will have coded a handful of useful HTML & CSS examples'),
(181, 34, 'In the last section of this course, you focus on building a beautiful, semantic, HTML & CSS web page'),
(182, 34, 'By the end of this course, you will have impressed yourself, and will be able to hit the ground running with your newly acquired skillset'),
(183, 34, 'Start building beautiful websites'),
(184, 34, 'Build a portfolio website, so you can highlight your best web work'),
(185, 34, 'Get the ball rolling for a career in web design'),
(186, 35, 'Project based teaching to sharpen your HTML, CSS & JavaScript skills'),
(187, 35, 'Perfect for beginners looking for things to build unique projects in a short timeframe'),
(188, 35, 'Modern styling with flexbox, CSS animations, custom properties, etc'),
(189, 35, 'DOM manipulation, events, array methods, HTTP requests & more');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lecture`
--

CREATE TABLE `lecture` (
  `LectureID` int(10) NOT NULL,
  `LectureName` varchar(76) DEFAULT NULL,
  `Preview` int(1) DEFAULT NULL,
  `VideoLink` varchar(128) DEFAULT NULL,
  `ContentID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lecture`
--

INSERT INTO `lecture` (`LectureID`, `LectureName`, `Preview`, `VideoLink`, `ContentID`) VALUES
(1, 'What is Flutter ?', 1, 'https://www.udemy.com/tutorial/learn-flutter-dart-to-build-ios-android-apps/what-is-flutter/', 1),
(2, 'Flutter MacOS Setup', 1, 'https://www.udemy.com/tutorial/learn-flutter-dart-to-build-ios-android-apps/flutter-macos-setup/', 1),
(3, 'Flutter Windows Setup', 1, 'https://www.udemy.com/tutorial/learn-flutter-dart-to-build-ios-android-apps/flutter-windows-setup/', 1),
(4, 'Module Introduction', 0, '', 2),
(5, 'Creating a new project', 0, '', 2),
(6, 'An Overview of the Generated Files & Folders', 0, '', 2),
(7, 'Module Introduction', 0, '', 3),
(8, 'Running the App on a Real Android Device', 0, '', 3),
(9, 'Running the App on an iOS Emulator', 0, '', 3),
(10, 'What is Flutter ?', 1, 'https://www.udemy.com/tutorial/flutter-bootcamp-with-dart/what-is-flutter/', 4),
(11, 'Why is Flutter ?', 1, 'https://www.udemy.com/tutorial/flutter-bootcamp-with-dart/why-flutter/', 4),
(12, 'Overview of the Process', 0, '', 5),
(13, 'Windows Setup Step 1 - Install the Flutter SDK', 0, '', 5),
(14, 'Windows Setup Step 2 - Install Android Studio', 0, '', 5),
(15, 'Windows Setup Step 3 - Install the Android Emulator', 0, '', 5),
(16, 'Windows Installation Troubleshooting', 0, '', 5),
(17, 'A Quick Note About macOS Catalina', 0, '', 5),
(18, 'Mac Setup Step 1 - Install the Flutter SDK', 0, '', 5),
(19, 'Mac Setup Step 2 - Install Android Studio', 0, '', 5),
(20, 'Mac Setup Step 3 - Install the Android Emulator', 0, '', 5),
(21, 'Mac Setup Step 4 - Install Xcode and Command Line Tools', 0, '', 5),
(22, 'Mac Setup Step 5 - Test the iOS Simulator', 0, '', 5),
(23, 'Mac Installation Troubleshooting', 0, '', 5),
(24, '[Optional] Configure Android Studio for Flutter Development', 0, '', 5),
(25, '[Optional] Guided Tour of Android Studio for Flutter Development', 0, '', 5),
(26, 'Creating a New Flutter Project from Scratch', 0, '', 6),
(27, 'A quick note about Hot Reload', 0, '', 6),
(28, 'Scaffolding a Flutter App', 0, '', 6),
(29, 'Working with Assets in Flutter & the Pubspec file', 0, '', 6),
(30, 'How to Add App Icons to the iOS and Android Apps', 0, '', 6),
(31, 'How to Ace this Course', 0, '', 6),
(32, 'How to Get Help', 0, '', 7),
(33, 'Course Organization', 0, '', 7),
(34, 'Dart Overview', 0, '', 8),
(35, 'The Dartpad Editor', 0, '', 8),
(36, 'Our First program', 0, '', 8),
(37, 'For Loops', 0, '', 9),
(38, 'Adding Elements to Lists', 1, 'https://www.udemy.com/tutorial/dart-and-flutter-the-complete-developers-guide/adding-elements-to-lists/', 9),
(39, 'More on Variable Initialization', 0, '', 9),
(40, 'The Learning Path of This Course', 0, '', 10),
(41, 'Why Flutter Development ?', 1, 'https://www.udemy.com/tutorial/flutter-dart-the-complete-flutter-app-development-course/why-flutter-development/', 11),
(42, 'Important Message', 0, '', 11),
(43, 'Introduction to Classes and Objects', 1, 'https://www.udemy.com/tutorial/flutter-dart-the-complete-flutter-app-development-course/introduction-to-classes-and-objects/', 12),
(44, 'Introduction to Class Creation and Instance Variables', 0, '', 12),
(45, 'Adding Methods to Classes', 0, '', 12),
(46, 'Course Introduction', 0, '', 13),
(47, 'Course Content', 0, '', 13),
(48, 'App Overview', 0, '', 13),
(49, 'The Dart Language', 0, '', 14),
(50, 'Introduction to Dartpad', 0, '', 14),
(51, 'String interpolation', 0, '', 14),
(52, 'Flutter setup on macOS', 0, '', 15),
(53, 'Setting the PATH variable', 0, '', 15),
(54, 'Flutter doctor', 0, '', 15),
(55, 'Introduction', 0, '', 16),
(56, 'Search Bar', 0, '', 17),
(57, 'Recent Orders', 0, '', 17),
(58, 'Nearby Restaurant', 0, '', 17),
(59, 'Home Screen', 0, '', 18),
(60, 'Sliver App Bar and Sliver List', 0, '', 18),
(61, 'Bar Chart', 0, '', 18),
(62, 'Before you take this course', 0, '', 19),
(63, 'What is flutter for', 0, '', 19),
(64, 'Installing the flutter sdk', 0, '', 20),
(65, 'Installing android studio', 0, '', 20),
(66, 'Setting up emulator', 0, '', 20),
(67, 'Create and run the application', 0, '', 21),
(68, 'Create and run the application using android studio', 0, '', 21),
(69, 'Writing from scratch', 0, '', 21),
(70, 'What does the course cover ?', 0, '', 22),
(71, 'How To Get All The Free Stuff', 0, '', 22),
(72, 'Frequently Asked Questions', 0, '', 22),
(73, 'Asking Great Questions & Debugging Your Code', 0, '', 22),
(74, 'Introduction', 0, '', 23),
(75, 'Installing Anndroid Studio On MacOS', 0, '', 23),
(76, 'Installing Anndroid Studio On Windows', 0, '', 23),
(77, 'Android Studio Overview', 0, '', 23),
(78, 'Opening Sample Projects', 0, '', 23),
(79, 'Opening Sample Projects (Android Studio files)', 0, '', 23),
(80, 'Formatting Text', 0, '', 23),
(81, 'Formatting Text (Android Studio files)', 0, '', 23),
(82, 'Buttons', 0, '', 23),
(83, 'Buttons (Android Studio files)', 0, '', 23),
(84, 'TextFields', 0, '', 23),
(85, 'TextFields (Android Studio files)', 0, '', 23),
(86, 'Displaying Messages', 0, '', 23),
(87, 'Displaying Messages (Android Studio files)', 0, '', 23),
(88, 'Images', 0, '', 23),
(89, 'Images (Android Studio files)', 0, '', 23),
(90, 'Currency Converter', 0, '', 23),
(91, 'Currency Converter (Android Studio files)', 0, '', 23),
(92, 'Introduction To Android Studio Quiz', 0, '', 23),
(93, 'Hello World With Java', 0, '', 24),
(94, 'Hello World With Java (Java files)', 0, '', 24),
(95, 'Variables', 0, '', 24),
(96, 'Variables (Java files)', 0, '', 24),
(97, 'Arrays And Maps', 0, '', 24),
(98, 'Arrays And Maps (Java files)', 0, '', 24),
(99, 'If Statements', 0, '', 24),
(100, 'If Statements (Java Files)', 0, '', 24),
(101, 'What does the course cover ?', 0, '', 25),
(102, 'How To Get All The Free Stuff', 0, '', 25),
(103, 'Frequently Asked Questions', 0, '', 25),
(104, 'Asking Great Questions & Debugging Your Code', 0, '', 25),
(105, 'Introduction', 0, '', 26),
(106, 'Installing Anndroid Studio On MacOS', 0, '', 26),
(107, 'Installing Anndroid Studio On Windows', 0, '', 26),
(108, 'Android Studio Overview', 0, '', 26),
(109, 'Opening Sample Projects', 0, '', 26),
(110, 'Opening Sample Projects (Android Studio files)', 0, '', 26),
(111, 'Formatting Text', 0, '', 26),
(112, 'Formatting Text (Android Studio files)', 0, '', 26),
(113, 'Buttons', 0, '', 26),
(114, 'Buttons (Android Studio files)', 0, '', 26),
(115, 'TextFields', 0, '', 26),
(116, 'TextFields (Android Studio files)', 0, '', 26),
(117, 'Displaying Messages', 0, '', 26),
(118, 'Displaying Messages (Android Studio files)', 0, '', 26),
(119, 'Images', 0, '', 26),
(120, 'Images (Android Studio files)', 0, '', 26),
(121, 'Currency Converter', 0, '', 26),
(122, 'Currency Converter (Android Studio files)', 0, '', 26),
(123, 'Introduction To Android Studio Quiz', 0, '', 26),
(124, 'Hello World With Java', 0, '', 27),
(125, 'Hello World With Java (Java files)', 0, '', 27),
(126, 'Variables', 0, '', 27),
(127, 'Variables (Java files)', 0, '', 27),
(128, 'Arrays And Maps', 0, '', 27),
(129, 'Arrays And Maps (Java files)', 0, '', 27),
(130, 'If Statements', 0, '', 27),
(131, 'If Statements (Java Files)', 0, '', 27),
(132, 'Interface Overview', 0, '', 28),
(133, 'Introduction to Android', 0, '', 28),
(134, 'FAQ', 0, '', 28),
(135, 'Windows - Install Android Studio', 0, '', 29),
(136, 'Mac - Install Android Studio', 0, '', 29),
(137, 'Linux - Install Android Studio', 0, '', 29),
(138, 'Hello World', 0, '', 30),
(139, 'Tour of Android Studio', 0, '', 30),
(140, 'Setting Up a Virtual Device', 0, '', 30),
(141, 'Learning Path', 0, '', 31),
(142, 'Important Message', 0, '', 31),
(143, 'WINDOWS USERS ONLY] Download Android Studio for Windows', 0, '', 32),
(144, '[OPTIONAL - WINDOWS USERS ONLY]VTX Emulator Issues Fixes on Windows', 0, '', 32),
(145, '[MAC USERS ONLY] Download and Install Android Studio on MAC', 0, '', 33),
(146, 'Configure Android Studio for Productivity: Themes, Auto-Import & SDKs', 0, '', 34),
(147, 'How to Set Up an Android Emulator with Hardware Acceleration', 1, 'https://www.udemy.com/tutorial/android-app-development-with-java/how-to-set-up-an-android-emulator-with-hardware-acceleration/', 34),
(148, 'How to Get All the Free Stuff', 0, '', 34),
(149, 'Working with the Layout Editor, Strings, and App Themes', 0, '', 35),
(150, 'Adding Graphics to a Project and using ImageViews', 0, '', 35),
(151, 'What is XML and How Does it Work ?', 1, 'https://www.udemy.com/tutorial/android-app-development-with-java/what-is-xml-and-how-does-it-work/', 35),
(152, 'What are the Coding Challenges?', 0, '', 36),
(153, 'What You Will Create', 0, '', 36),
(154, 'Step 1: Importing Projects from GitHub and Opening them in Android Studio ⭐️', 0, '', 36),
(155, 'Introduction', 0, '', 37),
(156, 'The Udemy Interface', 1, 'https://www.udemy.com/tutorial/android-oreo-kotlin-app-masterclass/the-udemy-interface/', 37),
(157, 'Introduction To Android', 1, 'https://www.udemy.com/tutorial/android-oreo-kotlin-app-masterclass/introduction-to-android/', 37),
(158, 'Mac - Install Android Studio', 0, '', 38),
(159, 'Linux - Install Android Studio', 0, '', 38),
(160, 'Configure Android SDK on all Three Platforms', 1, 'https://www.udemy.com/tutorial/android-oreo-kotlin-app-masterclass/configure-android-sdk-on-all-three-platforms/', 38),
(161, 'Your Programming Careers Questions Answered', 0, '', 39),
(162, 'Access to Programming Career Q&A', 0, '', 39),
(163, 'Introduction', 0, '', 39),
(164, 'What is a Programming Language', 0, '', 40),
(165, 'Lots of Programming Languages. Why?', 0, '', 40),
(166, 'What is Java?', 0, '', 40),
(167, 'Learning Objectives', 0, '', 41),
(168, 'Enter the world of android application development!', 0, '', 41),
(169, 'Download & Install Android Studio', 0, '', 41),
(170, 'Learning Objectives', 0, '', 42),
(171, 'Take a look at Java Code!', 0, '', 42),
(172, 'Take a look at XML Code!', 0, '', 42),
(173, 'Watch Before You Start!', 0, '', 43),
(174, 'Read Before You Start!', 0, '', 43),
(175, 'Migration Guide to v2 + Old Course', 0, '', 43),
(176, 'Section Intro', 0, '', 44),
(177, 'Hello World!', 0, '', 44),
(178, 'A Brief Introduction to JavaScript', 0, '', 44),
(179, 'Section Intro', 0, '', 45),
(180, 'Activating Strict Mode', 0, '', 45),
(181, 'Functions', 0, '', 45),
(182, 'Introduction and The Goal of this Course', 0, '', 46),
(183, 'Setup', 0, '', 46),
(184, 'Big Words and Javascript', 0, '', 46),
(185, 'What About Asunchronous Callbacks?', 1, 'https://www.udemy.com/tutorial/understand-javascript/what-about-asynchronous-callbacks/', 47),
(186, 'The Scope Chain', 0, '', 47),
(187, 'Scope, ES6, and let', 0, '', 47),
(188, 'Primitive Types', 0, '', 48),
(189, 'Conceptual Aside : Operators', 0, '', 48),
(190, 'Operator Precedence and Associaivity', 0, '', 48),
(191, 'Welcome To The Course', 0, '', 49),
(192, 'Project Files & Questions', 0, '', 49),
(193, 'Projects Github Repo', 0, '', 49),
(194, 'Type Conversion', 0, '', 50),
(195, 'Numbers & The Math Object', 0, '', 50),
(196, 'String Methods & Concatenation', 0, '', 50),
(197, 'What is the DOM ?>', 1, 'https://www.udemy.com/tutorial/modern-javascript-from-the-beginning/what-is-the-dom/', 51),
(198, 'DOM Selectors For Multiple Elements', 0, '', 51),
(199, 'Traversing The DOM', 0, '', 51),
(200, 'Introduction', 0, '', 52),
(201, 'What is JavaScript?', 0, '', 52),
(202, 'JavaScript In Action', 0, '', 52),
(203, 'Adding JavaScript to the Website', 0, '', 53),
(204, 'Introducing Variables & Constants', 0, '', 53),
(205, 'Declaring & Defining Variables', 0, '', 53),
(206, 'Module Introduction', 0, '', 54),
(207, 'Efficient Development & Debugging - An Overview', 0, '', 54),
(208, 'Configuring the IDE Look & Feel', 0, '', 54),
(209, 'Welcome!', 0, '', 55),
(210, 'Grab the PDF Guide', 0, '', 55),
(211, 'Installing VSCode', 1, 'https://www.udemy.com/tutorial/modern-javascript/installing-visual-studio-code/', 56),
(212, 'Install cmder', 1, 'https://www.udemy.com/tutorial/modern-javascript/windows-only-install-cmder/', 56),
(213, 'Installing Node.js', 0, '', 56),
(214, 'Logical \"And\" and \"Or\" Operators', 0, '', 57),
(215, 'Variable Scope: Part I', 0, '', 57),
(216, 'Variable Scope: Part II', 0, '', 57),
(217, 'How To Succeed In This Course', 0, '', 58),
(218, 'Join Our Online Classroom', 0, '', 58),
(219, 'Exercise: Meet The Community!', 0, '', 58),
(220, 'Inside the V8 Engine', 0, '', 59),
(221, 'Comparing Other Languages', 0, '', 59),
(222, 'Writing Optimized Code', 0, '', 59),
(223, 'Section Overview', 0, '', 60),
(224, 'Execution Context', 0, '', 60),
(225, 'Lexical Environment', 0, '', 60),
(226, 'How This Course Works?', 0, '', 61),
(227, 'JS, ECMA, TC39 : What Do They Mean ?', 0, '', 61),
(228, 'The Tools you Need', 0, '', 61),
(229, 'Running Code in the JS Console', 0, '', 62),
(230, 'Introducing Numbers', 0, '', 62),
(231, 'NaN & Infinity', 0, '', 62),
(232, 'Booleans Intro', 0, '', 63),
(233, 'Strings', 0, '', 63),
(234, 'String Indices', 0, '', 63),
(235, 'What is React ?', 1, 'https://www.udemy.com/tutorial/react-the-complete-guide-incl-redux/what-is-react/', 64),
(236, 'Why Should we Choose React?', 1, 'https://www.udemy.com/tutorial/react-the-complete-guide-incl-redux/why-should-we-choose-react/', 64),
(237, 'Introduction', 0, '', 64),
(238, 'Module Introduction', 0, '', 65),
(239, 'Understanding \"let\" and \"const\"', 0, '', 65),
(240, 'Arrow Functions', 0, '', 65),
(241, 'Module Introduction', 0, '', 66),
(242, 'The Build Workflow', 0, '', 66),
(243, 'Using Create React App', 0, '', 66),
(244, 'Installing Node JS', 0, '', 67),
(245, 'Important Update About React App Generation', 0, '', 67),
(246, 'Generating a React Project', 0, '', 67),
(247, 'What is JSX?', 0, '', 68),
(248, 'Converting HTML to JSX', 0, '', 68),
(249, 'Inline Styling with JSX', 0, '', 68),
(250, 'Three Tenets of Components', 0, '', 69),
(251, 'Application Overview', 0, '', 69),
(252, 'Semantic UI CDN Link', 0, '', 69),
(253, 'Introduction!', 0, '', 70),
(254, 'Github Links', 0, '', 70),
(255, 'npx Create React App Generation', 0, '', 71),
(256, 'Project Generation', 0, '', 71),
(257, 'Our First Test', 0, '', 71),
(258, 'An Introduction to Higher Order Components', 0, '', 72),
(259, 'Connect - A Higher Order Component', 0, '', 72),
(260, 'App Overview', 0, '', 72),
(261, 'App User Flow Walkthrough', 0, '', 73),
(262, 'Tech Stack', 0, '', 73),
(263, 'App Mockups', 0, '', 73),
(264, 'Relationship Between Node and Express', 0, '', 74),
(265, 'Generating Express Apps', 0, '', 74),
(266, 'Express Route Handlers', 0, '', 74),
(267, 'The OAuth Flow', 0, '', 75),
(268, 'Overview of Passport JS', 0, '', 75),
(269, 'Passport Setup', 0, '', 75),
(270, 'Welcome & Asking good Questions', 0, '', 76),
(271, 'Why should I learn React ?', 1, 'https://www.udemy.com/tutorial/react-2nd-edition/why-should-i-learn-react/', 76),
(272, 'Section Intro : Setting up Your Environment', 0, '', 77),
(273, 'Installing VSCode', 0, '', 77),
(274, 'Installing Node.js & Yarn', 1, 'https://www.udemy.com/tutorial/react-2nd-edition/installing-nodejs-yarn/', 77),
(275, 'Exploring JSX', 1, 'https://www.udemy.com/tutorial/react-2nd-edition/exploring-jsx/', 78),
(276, 'Conditional Rendering in JSX', 0, '', 78),
(277, 'ES6 Aside: const and let', 0, '', 78),
(278, 'Introduction', 0, '', 79),
(279, 'Links to Completed Code', 0, '', 79),
(280, 'Review of REST-ful Routing', 0, '', 80),
(281, 'Shortcomings of RESTful Routing', 0, '', 80),
(282, 'What is GraphQL', 1, '', 81),
(283, 'Async Resolve Functions', 1, '', 81),
(284, 'nodemon Hookup', 0, '', 81),
(285, 'Introducing Components', 1, 'https://www.udemy.com/tutorial/modern-react-bootcamp/introducing-components/', 82),
(286, 'Setting Up Your Server', 0, '', 82),
(287, 'Writing Our First Component', 0, '', 82),
(288, 'Basics Rules of JSX', 0, '', 83),
(289, 'How JSX Works Behind the Scenes', 0, '', 83),
(290, 'Embedding JavaScript in JSX', 0, '', 83),
(291, 'Intro to React Props', 0, '', 84),
(292, 'Props are Immutable?', 0, '', 84),
(293, 'Other Types of Props', 0, '', 84),
(294, 'READ BEFORE YOU START!', 0, '', 85),
(295, 'My Resources Page (Former E-Book)', 0, '', 85),
(296, 'Starting to fill the structure', 0, '', 86),
(297, 'Images and attributes', 0, '', 86),
(298, 'One more thing: links', 0, '', 86),
(299, 'Starting to make our webpage pretty: text', 1, 'https://www.udemy.com/tutorial/design-and-develop-a-killer-website-with-html5-and-css3/starting-to-make-our-webpage-pretty-text/', 87),
(300, 'Classes and ID\'s', 0, '', 87),
(301, 'The CSS box model', 0, '', 87),
(302, 'Welcome to the Most Advanced CSS Course Ever!', 0, '', 88),
(303, 'READ BEFORE YOU START!', 0, '', 88),
(304, 'Setting up Our Tools', 0, '', 88),
(305, 'Creating Cool CSS Animations', 1, 'https://www.udemy.com/tutorial/advanced-css-and-sass/creating-cool-css-animations/', 89),
(306, 'Building a Complex Animated Button - Part 1', 0, '', 89),
(307, 'Building a Complex Animated Button - Part 2', 0, '', 89),
(308, 'Behind the Scenes', 1, 'https://www.udemy.com/tutorial/advanced-css-and-sass/how-css-works-behind-the-scenes-an-overview/', 90),
(309, 'CSS Architecture, Components and BEM', 0, '', 90),
(310, 'Implementing BEM in the Natours Project', 0, '', 90),
(311, 'Course Introduction', 0, '', 91),
(312, 'Big Picture Overview of Course', 0, '', 91),
(313, 'Why HTML is Exciting', 1, 'https://www.udemy.com/tutorial/web-design-for-beginners-real-world-coding-in-html-css/why-html-is-exciting/', 92),
(314, 'Hands On! Create your First HTML File', 0, '', 92),
(315, 'Russian Stacking Dolls: Bulleted Lists', 0, '', 92),
(316, 'Images', 0, '', 93),
(317, 'Audio Files', 0, '', 93),
(318, 'Video Files', 0, '', 93),
(319, 'Introduction', 0, '', 94),
(320, 'What is CSS ?', 1, 'https://www.udemy.com/tutorial/css-the-complete-guide-incl-flexbox-grid-sass/what-is-css/', 94),
(321, 'Course Outline', 0, '', 94),
(322, 'Module Introduction', 0, '', 95),
(323, 'Understanding the Course Project Setup', 0, '', 95),
(324, 'Adding CSS to our Project with Inline Styles', 0, '', 95),
(325, 'Module Introduction', 0, '', 96),
(326, 'Introducing the CSS Box Model', 0, '', 96),
(327, 'Understanding the Box Model', 0, '', 96),
(328, 'Welcome To The Course', 0, '', 97),
(329, 'The Roles Of HTML & CSS In Web Development', 0, '', 97),
(330, 'Getting Setup With Visual Studio Code', 0, '', 97),
(331, 'Doctype & Basic Layout', 0, '', 98),
(332, 'Setting Up Live Server (VSCode Extension)', 0, '', 98),
(333, 'Meta Tags & Search Engines', 0, '', 98),
(334, 'Section Intro', 0, '', 99),
(335, 'Implementing CSS', 0, '', 99),
(336, 'Basic CSS Selectors', 0, '', 99),
(337, 'HTML Tags, Attributes & Elements', 0, '', 100),
(338, 'File & Folder Naming Conventions', 0, '', 100),
(339, 'Typical Website File & Folder Structure', 0, '', 100),
(340, 'Page Title', 0, '', 101),
(341, 'Headings', 0, '', 101),
(342, 'Paragraphs', 0, '', 101),
(343, 'Hyperlinks', 0, '', 102),
(344, 'Lists', 0, '', 102),
(345, 'Images', 0, '', 102),
(346, 'Welcome', 0, '', 103),
(347, 'Project Starter Boilerplate', 0, '', 103),
(348, 'Course Projects Code & Demos', 0, '', 103),
(349, 'Project Intro', 0, '', 104),
(350, 'Initial Cards', 0, '', 104),
(351, 'Expanding Effect', 0, '', 104),
(352, 'Project Intro', 0, '', 105),
(353, 'Creating the Steps', 0, '', 105),
(354, 'Step Functionality', 0, '', 105);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lecturer`
--

CREATE TABLE `lecturer` (
  `LecturerID` int(10) NOT NULL,
  `LecturerName` varchar(37) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lecturer`
--

INSERT INTO `lecturer` (`LecturerID`, `LecturerName`) VALUES
(1, 'Academind by Maximilian Schwarzmüller'),
(2, 'Maximilian Schwarzmüller'),
(3, 'Dr. Angela Yu'),
(4, 'Stephen Grider'),
(5, 'Paulo Dichone'),
(6, 'Andrea Bizzotto'),
(7, 'Marcus Ng'),
(8, 'Lutfor Rahman'),
(9, 'Rob Percival'),
(10, 'Marc Stock'),
(11, 'Codestars by Rob Percival'),
(12, 'Nick Walter'),
(13, 'Tim Buchalka'),
(14, 'Jean-Paul Roberts'),
(15, 'Philipp Muellauer'),
(16, 'Morteza Kordi'),
(17, 'Jonas Schmedtmann'),
(18, 'Anthony Alicea'),
(19, 'Brad Traversy'),
(20, 'Andrew Mead'),
(21, 'Andrei Neagoie'),
(22, 'Colt Steele'),
(23, 'Brad Schiff'),
(24, 'Manuel Lorenz'),
(25, 'Brad Hussey'),
(26, 'Code College'),
(27, 'Florin Pop');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rating`
--

CREATE TABLE `rating` (
  `CourseID` int(10) NOT NULL,
  `TotalRates` int(6) DEFAULT NULL,
  `TotalVotes` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `rating`
--

INSERT INTO `rating` (`CourseID`, `TotalRates`, `TotalVotes`) VALUES
(1, 138667, 30145),
(2, 121270, 25802),
(3, 17484, 3720),
(4, 17685, 3930),
(5, 8818, 1917),
(6, 1537, 327),
(7, 1080, 257),
(8, 119790, 27225),
(9, 63092, 14339),
(10, 39735, 8830),
(11, 9016, 2049),
(12, 32325, 7027),
(13, 16869, 3923),
(14, 16871, 3749),
(15, 430116, 91514),
(16, 187587, 39912),
(17, 107757, 22927),
(18, 54979, 11952),
(19, 48433, 10305),
(20, 32815, 6982),
(21, 27880, 5932),
(22, 455547, 99032),
(23, 301134, 64071),
(24, 44003, 9566),
(25, 58957, 12544),
(26, 299055, 65012),
(27, 33819, 7352),
(28, 21348, 4542),
(29, 220105, 47849),
(30, 129922, 27067),
(31, 65067, 14145),
(32, 44340, 9434),
(33, 71938, 15306),
(34, 29035, 6312),
(35, 5530, 1152);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategory`
--

CREATE TABLE `subcategory` (
  `SubcategoryID` int(10) NOT NULL,
  `SubcategoryName` varchar(19) DEFAULT NULL,
  `CategoryID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `subcategory`
--

INSERT INTO `subcategory` (`SubcategoryID`, `SubcategoryName`, `CategoryID`) VALUES
(1, 'Google Flutter', 2),
(2, 'Android Development', 2),
(3, 'JavaScript', 1),
(4, 'React', 1),
(5, 'Css', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`);

--
-- Chỉ mục cho bảng `course_content`
--
ALTER TABLE `course_content`
  ADD PRIMARY KEY (`ContentID`);

--
-- Chỉ mục cho bảng `course_lecturer`
--
ALTER TABLE `course_lecturer`
  ADD PRIMARY KEY (`CourseID`,`LecturerID`);

--
-- Chỉ mục cho bảng `fulldes`
--
ALTER TABLE `fulldes`
  ADD PRIMARY KEY (`FullDesID`);

--
-- Chỉ mục cho bảng `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`LectureID`);

--
-- Chỉ mục cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`LecturerID`);

--
-- Chỉ mục cho bảng `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`CourseID`);

--
-- Chỉ mục cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`SubcategoryID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `CourseID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `course_content`
--
ALTER TABLE `course_content`
  MODIFY `ContentID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT cho bảng `fulldes`
--
ALTER TABLE `fulldes`
  MODIFY `FullDesID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT cho bảng `lecture`
--
ALTER TABLE `lecture`
  MODIFY `LectureID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `LecturerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `rating`
--
ALTER TABLE `rating`
  MODIFY `CourseID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `SubcategoryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `rating` (`CourseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
