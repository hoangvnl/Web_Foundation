-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 20, 2021 lúc 02:42 AM
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
  `CourseImage` varchar(255) DEFAULT NULL,
  `CourseName` varchar(60) DEFAULT NULL,
  `ShortDes` varchar(120) DEFAULT NULL,
  `StudentCount` int(6) DEFAULT NULL,
  `Price` int(7) DEFAULT NULL,
  `SalePrice` int(6) DEFAULT -1,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SubCategoryID` int(10) DEFAULT NULL,
  `View` int(4) DEFAULT NULL,
  `Description` varchar(1500) DEFAULT NULL,
  `CreatedAt` date DEFAULT NULL,
  `isCompleted` int(11) NOT NULL,
  `isDisabled` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`CourseID`, `CourseImage`, `CourseName`, `ShortDes`, `StudentCount`, `Price`, `SalePrice`, `UpdatedAt`, `SubCategoryID`, `View`, `Description`, `CreatedAt`, `isCompleted`, `isDisabled`) VALUES
(1, 'images/courses/1/main.jpg', 'Flutter & Dart - The Complete Guide [2020 Edition]', 'A Complete Guide to the Flutter SDK & Flutter Framework for building native iOS and Android apps', 111900, 3000000, 300000, '2020-01-11 13:56:47.000000', 1, 1000, '<p>The entire course&nbsp;<strong>was completely re-recorded and updated&nbsp;</strong>- it\'s totally \r\nup-to-date with the latest version of Flutter!</p>\r\n<p>With the latest update, I&nbsp;also added&nbsp;<strong>Push Notifications</strong>&nbsp;and&nbsp;<strong>Image Upload</strong>!</p>\r\n<p>---</p>\r\n<p><strong>Join the most comprehensive &amp;&nbsp;bestselling Flutter course and learn how to build amazing iOS&nbsp;and Android apps!</strong></p>\r\n<p><strong>You don\'t need to learn Android/&nbsp;Java and iOS/&nbsp;Swift&nbsp;to build real native mobile apps!</strong></p>\r\n<p>Flutter - a framework developed by Google - allows you to learn one language&nbsp;(Dart) and build \r\nbeautiful native mobile apps in no time. Flutter is a SDK&nbsp;providing the tooling to compile&nbsp;Dart code into native code and it also gives you a rich set of pre-built and pre-styled UI&nbsp;elements (so called widgets)&nbsp;which you can use to compose your user interfaces.</p>\r\n<p><strong>Flutter is extremely&nbsp;trending</strong>&nbsp;and gets used for major Google apps like their Adwords app - it\'s now marked as \"ready for production\", hence now is the time to jump in and learn it!</p>\r\n<p>This course will teach Flutter &amp; Dart from scratch, NO&nbsp;prior knowledge of either of the two is required!&nbsp;And you certainly don\'t need any Android or iOS&nbsp;development experience since \r\nthe whole idea behind Flutter is to only learn one language.</p>\r\n<p>You\'ll learn Flutter not only in theor', '2021-01-14', 1, 0),
(2, 'images/courses/2/main.jpg', 'The Complete 2020 Flutter Development Bootcamp with Dart', 'Officially created in collaboration with the Google Flutter team.', 84899, 3000000, 300000, '2020-12-15 13:57:41.000000', 1, 2000, '<p>Welcome to the&nbsp;<strong>Complete Flutter App Development Bootcamp with Dart&nbsp;</strong>- created in collaboration with the Google Flutter team.</p> <p><strong>Now includes a brand new module on Flutter State Management!</strong></p> <p>Covering all the fundamental concepts for Flutter development, this is the&nbsp;<strong>most comprehensive</strong>&nbsp;Flutter course available online.</p> <p>We built this course over months, perfecting the curriculum together with the Flutter team to teach you Flutter<strong>&nbsp;from scratch</strong>&nbsp;and make you into&nbsp; a&nbsp;<strong>skilled Flutter developer</strong>&nbsp;with a&nbsp;<strong>strong portfolio</strong>&nbsp;of beautiful Flutter  apps.</p> <p>Our complete Flutter development bootcamp teaches you how to code using&nbsp;<strong>Dart</strong>&nbsp;and&nbsp;build&nbsp;<em>beautiful, fast, native-quality</em>&nbsp;iOS and Android apps. Even if you have&nbsp;<strong>ZERO</strong>&nbsp;programming experience.</p> <p>I\'ll take you step-by-step through engaging and fun video tutorials and teach you everything you need to know to succeed as a Flutter developer.</p> <p>The course includes&nbsp;<strong>28+ hours</strong>&nbsp;of HD video tutorials and builds your programming knowledge while making real world apps. e.g. Whatsapp, QuizUp and&nbsp;Yahoo Weather.</p>      <p>By the end of this course, you will be&nbsp;<strong>fluently</strong>&nbsp;programming in&nbsp;<strong>Dart</strong>&nbsp;and be ready to build you', '2020-08-12', 1, 0),
(3, 'images/courses/3/main.jpg', 'Dart and Flutter: The Complete Developer\'s Guide', 'Everything you need to know for building mobile apps with Flutter and Dart, including RxDart and Animations!', 20074, 3000000, 300000, '2020-12-10 13:57:55.000000', 1, 2000, '<p>If you\'re tired of spinning your wheels learning Swift or Android, this is the course for you.</p> \r\n<p><strong>Animations</strong>? You will learn it.&nbsp;&nbsp;<strong>Architectural Patterns</strong>? Included.&nbsp;&nbsp;<strong>Navigation</strong>? Of course!</p>\r\n<p>Flutter is a newcomer to the mobile development scene.&nbsp;&nbsp;<strong>Strongly supported by Google</strong>, it is already viewed as an ideal platform for replacing native Swift and Android development.&nbsp; Thanks to its amazing&nbsp;<strong>standard library</strong>&nbsp;of widgets,&nbsp;<strong>fast compile times</strong>, and&nbsp;<strong>amazing documentation</strong>, developers are falling \r\nin love with Flutter!&nbsp;&nbsp;</p>\r\n<p><em>This course supports MacOS and Windows - develop Android and iOS&nbsp;apps easily!</em></p>    \r\n<p>Flutter apps are created using the language&nbsp;<strong>Dart.&nbsp;&nbsp;</strong>No problem if you\'re not already familiar with Dart; this course includes a lightning fast introduction to Dart at the beginning, along with&nbsp;<strong>hours of bonus lectures</strong>&nbsp;at the end of the course solely focused on Dart and its advanced features.&nbsp; If you come from a background working with Java, \r\nRuby, or Javascript,&nbsp;<strong>you\'ll feel right at home with Dart</strong>&nbsp;- the syntax is nearly identical, only a few core concepts need to be learned.&nbsp; Dart is a strongly typed language - but don\'t be discouraged if you\'re not a fan of strong type', '2020-08-12', 1, 0),
(4, 'images/courses/4/main.jpg', 'Flutter & Dart - The Complete Flutter App Development Course', 'Build Flutter iOS and Android Apps with a Single Codebase: Learn Google\'s Flutter Mobile Development Framework & Dart', 17851, 3000000, 300000, '2020-06-10 13:58:09.000000', 1, 2500, '<p><strong>Flutter Development is here to stay!</strong></p>\r\n<p>Welcome to&nbsp;<strong>The Complete Flutter App Development Course (The World\'s First Complete Dart and Flutter Course). Now with a Full Course Update [2020].</strong></p>\r\n<p><strong>Flutter</strong>&nbsp;is the new&nbsp;<strong>Cross-platform Mobile Development Framework&nbsp;</strong>created by Google, allowing developers to build Android and iOS Apps with&nbsp;<strong>one single codebase!</strong></p>\r\n<p>Flutter is the&nbsp;<strong>BEST&nbsp;</strong>way to create cross-platform apps that otherwise would require two distinct mobile development teams to create.</p>\r\n<p><strong>Why is Flutter a BIG Deal?</strong></p>\r\n<p>Flutter is a big deal because any developer (or anyone who wants to learn mobile development) can now build native Android and iOS apps with one codebase ONLY! This means, instead of having to learn Objective-C or Swift to build iOS apps, and Java, or Kotlin to build Android apps, you can now use Flutter Mobile Development Framework to build apps that run natively on both iOS and Android devices using \r\nthe&nbsp;<strong>General-purpose Dart Programming Language.</strong></p>\r\n<p><strong>By learning Flutter App Development, you\'ll be able to build iOS and Android apps with a single codebase!&nbsp;&nbsp;</strong>This course is the ultimate&nbsp;<strong>Flutter tutorial&nbsp;</strong>created for those who want to build cross-platform iOS and Android mobile apps using the Dart Programming langua', '2020-08-12', 1, 0),
(5, 'images/courses/5/main.png', 'Flutter & Firebase: Build a Complete App for iOS & Android', 'Learn Dart, Flutter & Firebase by Google, and build a real-world, production ready app', 7642, 3000000, 300000, '2020-12-11 13:58:16.000000', 1, 2500, '<p><strong>Want to learn how to build native mobile apps with Flutter?</strong></p>\r\n<p>Then you are in the right place.&nbsp;</p>\r\n<p>Flutter is a mobile framework by Google for building&nbsp;<strong>beautiful and fast native apps</strong>. Flutter is very productive and offers a rich set of widgets that makes building apps a breeze. Once you experience&nbsp;<strong>hot-reload</strong>&nbsp;and everything else Flutter has to offer, you will never want to go back.</p>\r\n<p>In this course you will build a&nbsp;<strong>complete, real-world application</strong>&nbsp;for iOS and Android, by using&nbsp;<strong>Dart, Flutter and Firebase</strong>.</p>\r\n<p>This course&nbsp;<strong>starts from the basics</strong>, and includes a&nbsp;<strong>full introduction</strong>&nbsp;to Dart and Flutter. This means that&nbsp;<strong>NO prior experience</strong>&nbsp;with Dart and mobile app development is needed.</p>\r\n<p>As you make progress, the course will introduce more advanced topics, with special emphasis on writing&nbsp;<strong>production-ready code</strong>, so that you can&nbsp;<strong>learn how to build robust applications that scale</strong>.</p>\r\n<p>And by learning Firebase as well, you will understand how to make&nbsp;<strong>modern reactive apps</strong>, and see why Flutter and Firebase are a great combination.</p>\r\n<p>Important concepts are explained with clear diagrams. You will always learn&nbsp;<strong>what</strong>&nbsp;you will be building and&nbsp;<strong>why</strong>, and ', '2020-08-12', 1, 0),
(6, 'images/courses/6/main.jpg', 'The Complete Flutter UI Masterclass | iOS, Android, & Web', 'Learn how to build beautiful and responsive iOS, Android, and Web user interfaces using Flutter and Dart!', 2023, 1200000, -1, '2020-10-14 13:58:37.000000', 1, 3000, '<p><strong><em>Looking to learn how to build beautiful Android and iOS&nbsp;apps with Flutter and Dart or having trouble building out mobile designs?</em></strong></p>\r\n<p>This course will teach you how to<strong>&nbsp;build the UI of five amazing mobile apps!</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Food Delivery App</strong></p>\r\n</li>\r\n<li>\r\n<p><strong>Budget App</strong></p>\r\n</li>\r\n<li>\r\n<p><strong>Social Media App</strong></p>\r\n</li>\r\n<li>\r\n<p><strong>Facebook App&nbsp;</strong>and<strong>&nbsp;Web</strong></p>\r\n</li>\r\n<li>\r\n<p><strong>Netflix App&nbsp;</strong>and<strong>&nbsp;Web</strong></p>\r\n</li>\r\n</ol>\r\n<p>As a mobile app developer, you understand the importance of implementing&nbsp;<strong>clean and intuitive UI</strong>. It is&nbsp;<strong>essential&nbsp;</strong>to crafting the&nbsp;<strong>best user \r\nexperience</strong>&nbsp;possible. With Flutter, we have the power to build&nbsp;<strong>responsive interfaces</strong>&nbsp;<strong>for mobile and web with a single codebase</strong>.</p>\r\n<p><strong><em>You will learn how to:</em></strong></p>\r\n<ul>\r\n<li>\r\n<p>Implement basic and advanced Flutter widgets (Ex: ListViews, GridViews, Slivers, Custom&nbsp;Painters, Custom Clippers, Drawers, etc.)</p>\r\n</li>\r\n<li>\r\n<p>Write your own custom widgets</p>\r\n</li>\r\n<li>\r\n<p>Visualize data with charts</p>\r\n</li>\r\n<li>\r\n<p>Animate widgets</p>\r\n</li>\r\n<li>\r\n<p>Use stack-based screen navigation</p>\r\n</li>\r\n<li>\r\n<p>Debug your code</p>\r\n</li>\r\n<li>\r\n<p>Build responsive user interfa', '2020-08-12', 1, 0),
(7, 'images/courses/7/main.jpg', 'Master Flutter - Learn Dart & Flutter by Developing 5 Apps', 'Learn Google Flutter & Dart by Developing 5 Real Life & Enterprise Apps including UI, App Dashboard and API', 1373, 3000000, 300000, '2020-10-14 13:58:41.000000', 1, 3000, '<p>Welcome to the&nbsp;<strong>Master Flutter - Learn Dart &amp; Flutter by Developing 5 Apps</strong>. You will&nbsp;<strong>Learn Google Flutter &amp; Dart by Developing 20 Real Life &amp; Enterprise Apps including UI, App Dashboard and API</strong>&nbsp;and become&nbsp;<strong>Full Stack Mobile App Developer.</strong></p>\r\n<p>This is the only course based on&nbsp;<strong>Real Life &amp; Enterprise Apps including UI, App Dashboard and API</strong>. In course, you will learn not only developing&nbsp;<strong>Mobile Apps using \r\nFlutter</strong>&nbsp;but also learn how to&nbsp;<strong>design beautiful UI</strong>&nbsp;and develop&nbsp;<strong>App Dashboard and API</strong>. using market\'s most popular framework like :&nbsp;<strong>Laravel(PHP/MySQL), ExpressJS(NodeJS/MySQL)</strong>.</p>\r\n<p>In this course you will learn how to develop Android and iOS app using Flutter &amp; Dart and publish to PlayStore and AppStore and earn real money from your app.</p>\r\n<p>You will learn how to design beautiful looking Mobile UI\'s using Flutter &amp; Dart</p>\r\n<p>Nevertheless, you will learn how to develop API using Laravel and NodeJS/ExpressJS . You will learn how to host those API and connect with your mobile apps.</p>\r\n<p>You will learn different kinds of Design Patterns.</p>\r\n<p>You will learn how to design an enterprise mobile app and you will learn to develop sell-able</p>', '2021-01-14', 1, 0),
(8, 'images/courses/8/main.jpg', 'The Complete Android N Developer Course', 'Learn Android App Development with Android 7 Nougat by building real apps including Uber, Whatsapp and Instagram!', 147909, 3000000, 300000, '2019-08-13 13:59:09.000000', 2, 1800, '<p><strong><em>Please note support for this course has now stopped, and that&nbsp;there is a newer version of the course (The Complete Android Oreo Developer Course) available.</em></strong></p>\r\n<p><em>In this Android N&nbsp;version of the&nbsp;course I use Android Studio versions 2.0 and 2.1.2, \r\nand recommend students do the same.</em></p>\r\n<p>&nbsp;</p>\r\n<p>So you want to build your own apps?</p>\r\n<p>And you want to build them&hellip; from the comfort of your home&hellip; in your own time&hellip; without having to attend class&hellip; or wade through endless textbooks (or online guides).&nbsp;<em>Am I right?</em></p>\r\n<p>And let me guess: you&nbsp;<em>only</em>&nbsp;want the latest technology, software and techniques&mdash;because you&rsquo;ve got big plans, big ideas&mdash;and let&rsquo;s be honest&hellip; you&rsquo;re impatient and you want to jump the queue?</p>\r\n<p>My name&rsquo;s Rob Percival, creator of the world&rsquo;s best-selling online coding courses&hellip; andI&rsquo;ve designed<strong>&nbsp;The Complete Android N&nbsp;Developer Course</strong>, especially for YOU.</p>\r\n<p>Building on last year&rsquo;s runaway success: The Complete Android Developer Course (Udemy&rsquo;s best-ever-selling Android course, with over 50,000 happy students),&nbsp;<strong>The Complete Android N&nbsp;Developer Course</strong>&nbsp;has been refined, honed and microscopically polished to deliver even more valuable content, all designed for the latest Android 7.&nbsp;</p>\r\n<p>A huge r', '2020-08-12', 1, 0),
(9, 'images/courses/9/main.jpg', 'The Complete Android Oreo Developer Course - Build 23 Apps!', 'Learn Android O App Development using Java & Kotlin - build real apps including Super Mario Run, Whatsapp and Instagram!', 68517, 3000000, 300000, '0000-00-00 00:00:00.000000', 2, 1800, '<p><strong>The Complete Android 8.0 Oreo Developer Course by Rob Percival and Nick Walter</strong></p><p><strong><em>Learn Android App Development with Android 8.0 Oreo by building real apps including Twitter, Instagram&nbsp;and Super Mario Run.</em></strong></p>\r\n<p>----</p>\r\n<p><strong><em>Please note:&nbsp;The most recent Android OS version is Android 11.&nbsp; If you want to learn Android 11 development, check out our brand new The Complete Android 11 Developer Course: Build AMAZING&nbsp;Apps (taught by the brilliant Mashrur Hossain).</em></strong></p>\r\n<p><em>In this Oreo course I use the older Android Studio 3.0.1 version throughout as it\'s a great introduction to the development environment. For a smooth learning experience I\'d recommend you use the same as me, but students can still use the latest Android Studio version available if they prefer!</em></p>\r\n<p>----</p>\r\n<p>Wish&nbsp;<em>you&rsquo;d</em>&nbsp;thought of Whatsapp/Instagram/Google Maps?</p>\r\n<p>Me too.</p>\r\n<p>But until I work out how to build a time machine.</p>\r\n<p>Here&rsquo;s the next best thing.&nbsp;</p>\r\n<p><strong>The Complete Android O Developer Course</strong></p>\r\n<p>Kicking things up a notch from my smash-hit The Complete Android N Developer Course (59,000 students + 8,500 five star ratings) -- my latest course is your fast-track, skip-the-queue ticket to building high-calibre Android apps.</p>\r\n<p>Because, let&rsquo;s face it&hellip; you&rsquo;re busy. You want results. And you don&rsquo;t hav', '2020-08-12', 1, 0),
(10, 'images/courses/10/main.jpg', 'Android Java Masterclass - Become an App Developer', 'Improve your career options by learning Android app Development. Master Android Studio and build your first app today', 56288, 2300000, 230000, '2020-06-14 13:59:22.000000', 2, 2300, '<p>There&rsquo;s no getting around it.</p>\r\n<p>Android accounts for 81.7% of all smartphones sold, but not all come packed with the very latest Android Nougat.</p>\r\n<p>That won&rsquo;t worry you because after completing this course, the apps you build will perform brilliantly on Android Nougat or any older Android operating system.</p>\r\n<p>Now that&rsquo;s something most courses don&rsquo;t teach you!</p>\r\n<p><strong>So, you want to be an Android 7 Nougat programmer? &nbsp;Or you are interested in Android 8 Oreo?</strong></p>\r\n<p>Well, I&rsquo;m Tim Buchalka, one of your instructors, and I&rsquo;ve designed the Android 7 Nougat App and Android 8 Orea&nbsp;Masterclass just for you! &nbsp;Yes one, course covering both version!</p>\r\n<p>Choosing a course that&rsquo;s perfect for you can be damn hard. You need Instructors:</p>\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Who are passionate about what they do.</p>\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Keep their courses continually updated.</p>\r\n<p>&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; And most important, provide outstanding support and follow up to your questions.</p>\r\n<p>That&rsquo;s what I do. And that&rsquo;s the reason why I made it into the&nbsp;<strong>Top 10 List of Outstanding Instructors in the 2015 Udemy Instructor Awards</strong>.</p>\r\n<p>Know that you&rsquo;re exactly in the right place to&nbsp;<strong>MASTER</strong>&nbsp;Android 7 Nougat app programming as well as Android 8 Oreo!</p>\r\n<p><strong>Yes, we are in th', '2021-01-14', 1, 0),
(11, 'images/courses/11/main.jpg', 'The Comprehensive Android Development Masterclass', 'Master New Android API\'s like ROOM Database, ML Kit Face Recognition, Firestore, Firebase, Maps and Android Studio IDE', 11872, 3000000, 300000, '2020-04-01 13:59:29.000000', 2, 2300, '<p><strong>[December 30th Update]:&nbsp;</strong>Updated&nbsp;<strong>12 Sections!!&nbsp;</strong>And \r\nmore to come.</p>\r\n<p><strong>[November 2020 Update]:&nbsp;</strong>Added&nbsp;<strong>11 Coding Exercises</strong>;&nbsp;<strong>Added two new lectures</strong>; added&nbsp;<strong>19 quizzes!</strong></p>\r\n<p>--------------------------</p>\r\n<p><strong>Android App Development&nbsp;</strong>will open many doors for you since Android is the most popular operating system in the World.</p>\r\n<p>You may have many reasons as to why you want to learn Android development - maybe you have lots of \r\napp ideas but don\'t know where to start?&nbsp; Or maybe it\'s time for a career change, and Android Development picked your interest?&nbsp; Or perhaps you want to be more valuable at your company... whatever the reason, you\'re are on the right path by being here!</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Build a strong foundation in Android Development, Android Studio, and object-oriented Java \r\nProgramming with this Complete, Up-to-date course.&nbsp; This is the Android Development Bootcamp you\'ll ever need to learn Android Development from scratch!</strong></p>\r\n<p>In this Android App Development Bootcamp course, you will be:</p>\r\n<ul>\r\n<li>\r\n<p>Building Android apps from scratch using Android Studio and&nbsp;<strong>Java</strong>&nbsp;<strong>Programming</strong>&nbsp;<strong>Language</strong></p>\r\n</li>\r\n<li>\r\n<p>Fully learn the&nbsp;<strong>Java Programming Language,</strong>&nbsp;which is used ', '2020-08-12', 1, 0),
(12, 'images/courses/12/main.jpg', 'Android O & Java - The Complete Android Development Bootcamp', 'Learn Android O app development from beginning to end. Learn to code in Java while building fun Android O projects.', 34714, 3000000, 300000, '2020-11-16 13:59:34.000000', 2, 1450, '', '2020-08-12', 1, 0),
(13, 'images/courses/13/main.jpg', 'Android App Development Masterclass using Kotlin', 'Learn Kotlin Android App Development And Become an Android Developer. Incl. Kotlin Tutorial and Android Tutorial Videos', 26759, 2300000, 230000, '2020-12-22 13:59:41.000000', 2, 1450, '', '2020-08-12', 1, 0),
(14, 'images/courses/14/main.jpg', 'The Complete Android R + Java Developer Course™ : 2020', 'In this course, you\'ll learn Android Development and get to build your own Android R apps by using Java.', 31225, 3000000, 300000, '2020-12-15 13:59:45.000000', 2, 1203, '', '2020-08-12', 1, 0),
(15, 'images/courses/15/main.jpg', 'The Complete JavaScript Course 2020: From Zero to Expert!', 'The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!', 384225, 3000000, 300000, '2020-10-21 13:59:49.000000', 3, 1203, '', '2020-08-12', 1, 0),
(16, 'images/courses/16/main.jpg', 'JavaScript: Understanding the Weird Parts', 'An advanced JavaScript course for everyone! Scope, closures, prototypes, \'this\', build your own framework, and more.', 155488, 3000000, 300000, '2020-11-10 13:59:53.000000', 3, 1100, '', '2020-08-12', 1, 0),
(17, 'images/courses/17/main.jpg', 'Modern JavaScript From The Beginning', 'Learn and build projects with pure JavaScript (No frameworks or libraries)', 75217, 3000000, 300000, '2020-12-22 13:59:56.000000', 3, 1100, '', '2021-01-14', 1, 0),
(18, 'images/courses/18/main.jpg', 'JavaScript - The Complete Guide 2021 (Beginner + Advanced)', 'Modern JavaScript from the beginning - all the way up to JS expert level! THE must-have JavaScript resource in 2020.', 61438, 3000000, 300000, '2020-11-09 13:59:59.000000', 3, 2300, '', '2020-08-12', 1, 0),
(19, 'images/courses/19/main.jpg', 'The Modern JavaScript Bootcamp', 'Learn JavaScript by building real-world apps. Includes 3 real-world projects, 80 programming challenges, and ES6/ES7!', 40753, 3000000, 300000, '2020-11-26 14:00:03.000000', 3, 2300, '', '2020-08-12', 1, 0),
(20, 'images/courses/20/main.jpg', 'JavaScript: The Advanced Concepts', 'Learn modern advanced JavaScript practices and be in the top 10% of JavaScript developers', 37959, 3000000, 300000, '2020-12-30 14:00:07.000000', 3, 3100, '', '2020-08-12', 1, 0),
(21, 'images/courses/21/main.jpg', 'The Modern Javascript Bootcamp Course (2020)', 'The most up-to-date JS resource online! Master Javascript by building a beautiful portfolio of projects!', 32327, 3000000, 300000, '2020-11-11 14:00:11.000000', 3, 3100, '', '2020-08-12', 1, 0),
(22, 'images/courses/22/main.jpg', 'React - The Complete Guide (incl Hooks, React Router, Redux)', 'Dive in and learn React.js from scratch! Learn Reactjs, Hooks, Redux, React Routing, Animations, Next.js and way more!', 99032, 3000000, 300000, '2020-11-25 14:00:14.000000', 4, 3200, '', '2020-08-12', 1, 0),
(23, 'images/courses/23/main.jpg', 'Modern React with Redux [2020 Update]', 'Master React v16.6.3 and Redux with React Router, Webpack, and Create-React-App. Includes Hooks!', 217685, 3000000, 300000, '2020-11-19 14:00:18.000000', 4, 3200, '', '2020-08-12', 1, 0),
(24, 'images/courses/24/main.jpg', 'Advanced React and Redux', 'Walkthroughs on advanced React v16.6.3 and Redux v4.0.0 - Authentication, Testing, Middlewares, HOC\'s, and Deployment', 68806, 3000000, 300000, '2020-12-09 14:00:20.000000', 4, 2800, '', '2020-08-12', 1, 0),
(25, 'images/courses/25/main.jpg', 'Node with React: Fullstack Web Development', 'Build and deploy fullstack web apps with NodeJS, React, Redux, Express, and MongoDB.', 69067, 3000000, 300000, '2020-12-09 14:00:23.000000', 4, 2800, '', '2020-08-12', 1, 0),
(26, 'images/courses/26/main.jpg', 'The Complete React Developer Course (w/ Hooks and Redux)', 'Learn how to build and launch React web applications using React, Redux, Webpack, React-Router, and more!', 65012, 3000000, 300000, '2021-01-01 16:56:16.000000', 4, 2900, '<p><strong>This course was just&nbsp;updated to support React v16, React Hooks, the Context API, and more!</strong></p>\r\n<p><strong>--</strong></p>\r\n<p><strong>Have you tried to learn React before?</strong></p>\r\n<p>It&rsquo;s easy to go down the rabbit hole of libraries and tools only to come out of it not knowing how to build and launch a real-world React application. You get things configured, but you&rsquo;re \r\nnot sure how the libraries fit together (or if you&rsquo;re even using the right one).</p>\r\n<p>Sound familiar?</p>\r\n<p><strong>I built this course to show you how you can build and launch real-world React web applications.</strong></p>\r\n<p>The Complete React Web Developer Course 2 starts with the fundamentals and covers everything you&rsquo;ll need to build and launch React web apps.</p>\r\n<p>You&rsquo;ll see what it takes to build and launch a React app, from the first line of code to the \r\nfinal production deployment.</p>\r\n<p>This course was designed around one goal: turning you into a professional React developer capable of developing, testing, and deploying real-world production applications.</p>\r\n<p><strong>You&rsquo;ll learn React by doing, not watching.</strong></p>\r\n<p>From the first videos you&rsquo;ll be building out each project as well as completing programming challenges I&rsquo;ve designed to test and reinforce what you&rsquo;ve learned.</p>\r\n<p>Throughout the course you&rsquo;ll build two React web apps:</p>\r\n<ol>\r\n<li>\r\n<p>The first app, a decision-ma', '2020-08-12', 1, 0),
(27, 'images/courses/27/main.jpg', 'GraphQL with React: The Complete Developers Guide', 'Learn and master GraphQL by building real web apps with React and Node', 42339, 3000000, 300000, '2020-12-24 16:56:16.000000', 4, 2900, '<p><em>Note: This course assumes you are familiar with React!</em></p>\r\n<p>If you\'re tired of spinning your wheels trying to figure out what type of backend server to use, this is the course for you.</p>\r\n<p><strong>Authentication?</strong>&nbsp;You will learn it. &nbsp;<strong>Apollo Data?&nbsp;</strong>Included. &nbsp;<strong>Integration with React?&nbsp;</strong>Of course!</p>\r\n<p>This course will get you up and running with GraphQL&nbsp;quickly, and teach you the core knowledge you need to deeply understand and build React applications quickly.</p>\r\n<p><strong>Both OSX and Windows supported.</strong></p>\r\n<p>We\'ll start by mastering the fundamentals of GraphQL, including data types, schemas, and integration with Express and React. Source code is provided for each lecture, so you will always stay up-to-date with the course pacing. &nbsp;Special attention has been paid to creating code that you\'ll be able to make use of on your own fantastic projects.</p>\r\n<p>If you are new to GraphQL, or if you\'ve been working to learn it but sometimes feel like you still \r\ndon\'t quite \'get it\', this is the GraphQL course for you! To learn GraphQL you have to understand it.</p>\r\n<ul>\r\n<li>Learn how to use GraphQL\'s schema to define relations between your data objects</li>\r\n<li>Learn the process of combining a backend server with a front end React</li>\r\n<li>Master the process of thinking about your applications data in terms of a graph structure</li>    \r\n<li>Grasp the difference between Gr', '2020-08-12', 1, 0),
(28, 'images/courses/28/main.jpg', 'The Modern React Bootcamp (Hooks, Context, NextJS, Router)', 'Just published! Follow the same curriculum I teach my students in SF. 10+ projects including one HUGE application!', 23345, 3000000, 300000, '2021-01-04 16:56:16.000000', 4, 3000, '<p><strong>EXPANDED and UPDATED in June 2019 to include new sections on Next JS and Server-Side Rendering!</strong></p>\r\n<p>Welcome to the best online resource for learning React!&nbsp;<strong>Published in</strong>&nbsp;<strong>April 2019</strong>, this course is&nbsp;<strong>brand new</strong>&nbsp;and covers the latest in React.&nbsp; This course follows the exact same React curriculum my&nbsp;<strong>in-person bootcamp students</strong>&nbsp;<strong>follow in&nbsp;San Francisco</strong>, where students have gone on to get jobs at places like&nbsp;<strong>Google, Apple, Pinterest, &amp; Linkedin</strong>.&nbsp; This is the most polished React course online, and it\'s the only course that is based on REAL bootcamp curriculum that has been<strong>&nbsp;tried and tested in the classroom.</strong></p>\r\n<p>This course builds up concepts one at a time, cementing each new topic with an expertly designed exercise or project to test your knowledge. It includes a huge variety of beautiful exercises, projects, and games that we create together from scratch.&nbsp; Sometimes we mix things up and give you a broken React app and ask you to fix it or optimize the code. Check out the promo video to see a couple of the course exercises. The course culminates in one huge capstone project, which is the&nbsp;<strong>largest project I\'ve ever built for any of my online courses.</strong>&nbsp; I\'m really excited about it \r\n:)&nbsp;</p>\r\n<p>React is the&nbsp;<strong>most popular JS library</strong>', '2020-08-12', 1, 0),
(29, 'images/courses/29/main.jpg', 'Build Responsive Real World Websites with HTML5 and CSS3', 'The easiest way to learn modern web design, HTML5 and CSS3 step-by-step from scratch. Design AND code a huge project.', 210654, 3000000, 300000, '2020-12-31 16:56:16.000000', 5, 3000, '<p><strong><em>***&nbsp;The #1 HTML5 and CSS3 course in the official Udemy rankings! ***</em></strong></p>\r\n<p><em>\"Having gone through other related courses on other platforms, I can say this course is the most practical and readily applicable course on web design and development I have taken.\" &mdash;</em>&nbsp;Bernie Pacis</p>\r\n<p>&nbsp;</p>\r\n<p>Are you looking for the best way to learn how to build&nbsp;beautiful websites with HTML5 and CSS3? That even&nbsp;look great on your phone?</p>\r\n<p>Have you taken other HTML and CSS courses, but still wonder how to code a real-world website, not just some basic examples?</p>\r\n<p>If your answer is a big YES...&nbsp;Then this is exactly the course you are looking for!</p>       \r\n<p>&nbsp;</p>\r\n<p><strong><em>So why is this course so unique and popular?</em></strong></p>\r\n<p><strong>Reason #1:&nbsp;The&nbsp;course is completely project-based</strong></p>\r\n<p>Together we&nbsp;hand-code&nbsp;a beautiful and responsive landing page for a fictional company that I made up just for the course. Step-by-step, you will learn more and more&nbsp;HTML5 and&nbsp;CSS3&nbsp;features, from beginner to advanced. These are the latest web technologies, used by every website \r\nin the world.&nbsp;And&nbsp;we even added some jQuery to the mix.</p>\r\n<p>This huge project will teach you all the real-world&nbsp;skills to build real-world HTML5 and CSS3&nbsp;websites.&nbsp;This will allow you to build any website you can imagine...&nbsp;From complete scratch.', '2020-08-12', 1, 0),
(30, 'images/courses/30/main.jpg', 'Advanced CSS and Sass: Flexbox, Grid, Animations and More!', 'The most advanced and modern CSS course on the internet: master flexbox, CSS Grid, responsive design, and so much more.', 119791, 3000000, 300000, '2020-12-16 16:56:17.000000', 5, 3100, '<p>Have you been coding CSS for some time, but want to take your game to the next level? Do you feel confused with CSS jargon like inheritance, specificity or the cascade?</p>\r\n<p>What if there was one resource, one place, where you could learn all the advanced and modern CSS techniques and properties you\'ve been reading about?</p>\r\n<p><strong>Good news: there is!</strong></p>\r\n<p><em>Welcome to \"Advanced CSS and Sass\", the most advanced, the most modern, and the most complete CSS course on the internet. It\'s everything you want in an advanced CSS course, and more.</em></p>     \r\n<p>You will learn complex CSS animations, advanced responsive&nbsp;design techniques, flexbox layouts, Sass, CSS architecture, fundamental CSS concepts, and so much more.</p>\r\n<p>Like in all my courses, you will build beautiful and carefully designed projects, that will make you proud of yourself and leave you ready to build complex projects on your own.</p>\r\n<p>After finishing this course, you will:</p>\r\n<p><strong>1)</strong>&nbsp;Be up to speed with the most modern and advanced CSS properties and techniques;</p>\r\n<p><strong>2)</strong>&nbsp;Have mastered the cutting-edge layout technologies Flexbox and CSS Grid;</p>\r\n<p><strong>3)</strong>&nbsp;Be ready to build responsive layouts for all kind of devices and situations;</p>\r\n<p><strong>4)</strong>&nbsp;Truly understand how CSS&nbsp;works behind the scenes;</p>\r\n<p><strong>5)</strong>&nbsp;Be able to architect large CSS codebases for reusability an', '2021-01-14', 1, 0),
(31, 'images/courses/31/main.jpg', 'Web Design for Beginners: Real World Coding in HTML & CSS', 'Launch a career as a web designer by learning HTML5, CSS3, responsive design, Sass and more!', 51798, 3000000, 350000, '2020-12-23 16:56:17.000000', 5, 3100, '<p>You can launch a new career in web development today by learning HTML &amp; CSS. You don\'t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust. I\'ve taught HTML and CSS to countless coworkers and held training \r\nsessions for fortune 100 companies.&nbsp;<strong>I am that teacher you can trust</strong>.&nbsp;</p>  \r\n<p>Don\'t limit yourself by creating websites with some cheesy &ldquo;site-builder\" tool. This course teaches you how to take 100% control over your webpages by using the same concepts that every professional website is created with.</p>\r\n<p>This course does not assume any prior experience. We start at square one and learn together bit by \r\nbit. By the end of the course you will have created (by hand) a website that looks great on phones, tablets, laptops, and desktops alike.</p>\r\n<p>In the summer of 2020 the course has received a new section where we push our website live up onto \r\nthe web using the free GitHub Pages service; this means you\'ll be able to share a link to what you\'ve \r\ncreated with your friends, family, colleagues and the world!</p>\r\n<p><strong><em>I have helped over 100,000 students and have received the following feedback:&nbsp;&nbsp;</em></strong>&nbsp;</p>\r\n<p>&ldquo;&hellip;A fantastic course&hellip; clear, definite and engaging.\"</p>\r\n<p>&ldquo;&hellip;Presentation is concise without being tedious&hellip; you honestly feel that you have a thorough und', '2020-08-12', 1, 0),
(32, 'images/courses/32/main.jpg', 'CSS - The Complete Guide 2021 (incl. Flexbox, Grid & Sass)', 'Learn CSS for the first time or brush up your CSS skills and dive in even deeper. EVERY web developer has to know CSS.', 47246, 3000000, 300000, '2021-01-01 16:56:17.000000', 5, 1750, '<p>CSS&nbsp;- short for&nbsp;<strong>C</strong>ascading&nbsp;<strong>S</strong>tyle&nbsp;<strong>S</strong>heets - is a \"programming language\" you use to turn your raw HTML&nbsp;pages into real beautiful \r\nwebsites.</p>\r\n<p><strong>This course covers it all&nbsp;</strong>- we start at the very basics (What is CSS?&nbsp;How does it work?&nbsp;How do you use it)?&nbsp;and gradually dive in deeper and deeper. And we do this \r\nby showing both practical examples as well as the theory behind it.</p>\r\n<p>Getting started with CSS&nbsp;might look easy but there actually is a&nbsp;<strong>lot of depth to \r\nCSS</strong>&nbsp;- hence this course provides different \"Tracks\"&nbsp;or \"Entry points\"&nbsp;to exactly meet your demands and&nbsp;<strong>reflect you current knowledge level</strong>:</p>\r\n<ul>\r\n<li>\r\n<p><strong>The Basics Track</strong>:&nbsp;Start from scratch, learn CSS&nbsp;from the ground up. You \r\nstart with lecture 1 and simply follow through to the end.</p>\r\n</li>\r\n<li>\r\n<p><strong>The Advanced Track</strong>:&nbsp;You already know the CSS&nbsp;basics, you know what selectors are and how it works but you want to dive in deeper and learn some advanced features and usages.</p>\r\n</li>\r\n<li>\r\n<p><strong>The Expert Track</strong>:&nbsp;You got the advanced knowledge, too, but you want to dive into things like Flexbox, CSS&nbsp;Grid, CSS&nbsp;Variables or Sass. This track is for you.</p>        \r\n</li>\r\n</ul>\r\n<p>Of course this course offers the theory and practical examples - we', '2020-08-12', 1, 0),
(33, 'images/courses/33/main.jpg', 'Modern HTML & CSS From The Beginning (Including Sass)', 'Build modern responsive websites & UIs with HTML5, CSS3 & Sass! Learn Flex & CSS Grid', 45455, 3000000, 300000, '2021-01-02 16:56:17.000000', 5, 1750, '<p>This course is for both beginners and seasoned developers that want to learn how to build responsive websites and user interfaces with modern HTML5 and CSS3+ technologies like Flexbox and CSS Grid as well as the Sass pre-compiler. This course includes hours of both learning &amp; studying sections along with real life projects. Stop having to rely on frameworks like Bootstrap for your user interface and learn how to create your own layouts and utility classes to build custom responsive websites and app UIs.</p>\r\n<p>The first few sections are tailored for beginners so even if you have never built anything before, \r\nyou will learn all of the basics. If you already have experience with basic HTML &amp; CSS, just move \r\nto section 3 or 4 and get started.</p>\r\n<p><strong>Things We Cover</strong></p>\r\n<ul>\r\n<li>\r\n<p>How Websites Work</p>\r\n</li>\r\n<li>\r\n<p>Visual Studio&nbsp;Code Setup, Shortcuts, Live Server &amp;&nbsp;Emmet</p>\r\n</li>\r\n<li>\r\n<p>HTML5 Semantic Layout</p>\r\n</li>\r\n<li>\r\n<p>CSS Fundamentals</p>\r\n</li>\r\n<li>\r\n<p>Responsive Design With Media Queries</p>\r\n</li>\r\n<li>\r\n<p>CSS Units - rem, em, vh, vw, etc</p>\r\n</li>\r\n<li>\r\n<p>Flexbox</p>\r\n</li>\r\n<li>\r\n<p>CSS&nbsp;Grid</p>\r\n</li>\r\n<li>\r\n<p>Animation with Keyframes &amp; Transitions</p>\r\n</li>\r\n<li>\r\n<p>CSS&nbsp;Variables</p>\r\n</li>\r\n<li>\r\n<p>Sass Pre-compiler with portfolio project</p>\r\n</li>\r\n<li>\r\n<p>Full Projects &amp; Mini Projects</p>\r\n</li>\r\n<li>\r\n<p>Website Deployment to Shared Hosting &amp; Netlify With Git</p>\r\n<', '2020-08-12', 1, 0),
(34, 'images/courses/34/main.jpg', 'Build Websites from Scratch with HTML & CSS', 'Learn Web Development Essentials and Become a Web Developer From Scratch in this Complete HTML & CSS Beginner\'s Course', 64924, 3000000, 300000, '2021-01-03 16:56:17.000000', 5, 1908, '<p>HTML and CSS are the two most important languages for a new web developer to learn. They are also the easiest. If you&rsquo;ve always wanted to build webpages, but were intimidated by the code, this course will help you learn your first two languages quickly and easily.</p>\r\n<p>Taking a step-by-step approach, this course will have you learning by doing, building several mini-websites from scratch.</p>\r\n<h4>Learn the Two Most Important Languages to Web Design Quickly and Easily.</h4>\r\n<ul>\r\n<li>HTML Foundations</li>\r\n<li>Parent/Child Structure</li>\r\n<li>CSS Foundations</li>\r\n<li>ID Selectors</li>\r\n<li>Coding and Styling</li>\r\n<li>What Web Pages are Built Of</li>\r\n</ul>\r\n<p>Every webpage that you see on the net is built using a language or code. There are many different programming languages that can make your website do various things, but the two most important to learn are HTML and CSS. In fact, even people who plan on allowing someone else to build their website should have a basic grasp of both languages. This way you can tweak things behind the scenes, or change some of your formatting without having to always rely on others.</p>\r\n<h4>Contents and Overview</h4>\r\n<p>This course of more than 77 lectures and 8 hours of content gives you a basic, yet thorough understanding of both HTML and CSS. The course focuses on having you begin writing code right away so you can learn through doing, and build your own completely functional HTML and CSS webpage at the end.</p>   \r\n<p>Y', '2020-08-12', 1, 0),
(35, 'images/courses/35/main.jpg', '50 Projects In 50 Days - HTML, CSS & JavaScript', 'Sharpen your skills by building 50 quick, unique & fun mini projects', 9489, 3000000, 300000, '2021-01-04 16:56:17.000000', 5, 1809, '<p>This is a purely project-based course. It is geared toward beginners, but intermediate developers can also enjoy creating new things. This course includes 50 mini projects in HTML, CSS &amp; JavaScript that relate to the DOM (Document Object Model). Here is a list of what we will create in this course:</p>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li>\r\n<p>Expanding Cards</p>\r\n</li>\r\n<li>\r\n<p>Progress Steps</p>\r\n</li>\r\n<li>\r\n<p>Rotating Navigation Animation</p>\r\n</li>\r\n<li>\r\n<p>Hidden Search Widget</p>\r\n</li>\r\n<li>\r\n<p>Blurry Loading</p>\r\n</li>\r\n<li>\r\n<p>Scroll Animation</p>\r\n</li>\r\n<li>\r\n<p>Split Landing Page</p>\r\n</li>\r\n<li>\r\n<p>Form Wave</p>\r\n</li>\r\n<li>\r\n<p>Sound Board</p>\r\n</li>\r\n<li>\r\n<p>Dad Jokes</p>\r\n</li>\r\n<li>\r\n<p>Event Keycodes</p>\r\n</li>\r\n<li>\r\n<p>Faq Collapse</p>\r\n</li>\r\n<li>\r\n<p>Random Choice Picker</p>\r\n</li>\r\n<li>\r\n<p>Animated Navigation</p>\r\n</li>\r\n<li>\r\n<p>Incrementing Counter</p>\r\n</li>\r\n<li>\r\n<p>Drink Water</p>\r\n</li>\r\n<li>\r\n<p>Movie App</p>\r\n</li>\r\n<li>\r\n<p>Background Slider</p>\r\n</li>\r\n<li>\r\n<p>Theme Clock</p>\r\n</li>\r\n<li>\r\n<p>Button Ripple Effect</p>\r\n</li>\r\n<li>\r\n<p>Drag N Drop</p>\r\n</li>\r\n<li>\r\n<p>Drawing App</p>\r\n</li>\r\n<li>\r\n<p>Kinetic Loader</p>\r\n</li>\r\n<li>\r\n<p>Content Placeholder</p>\r\n</li>\r\n<li>\r\n<p>Sticky Navbar</p>\r\n</li>\r\n<li>\r\n<p>Double Vertical Slider</p>\r\n</li>\r\n<li>\r\n<p>Toast Notification</p>\r\n</li>\r\n<li>\r\n<p>Github Profiles</p>\r\n</li>\r\n<li>\r\n<p>Double Click Heart</p>\r\n</li>\r\n<li>\r\n<p>Auto Text Effect</p>\r\n</li>\r\n<li>\r\n<p>Password Generator</p>\r\n</li>\r\n<l', '2020-08-12', 1, 0);

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
-- Cấu trúc bảng cho bảng `joincourse`
--

CREATE TABLE `joincourse` (
  `UserID` int(10) NOT NULL,
  `CourseID` int(10) NOT NULL,
  `JoinDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `joincourse`
--

INSERT INTO `joincourse` (`UserID`, `CourseID`, `JoinDate`) VALUES
(1, 1, '2020-12-23'),
(1, 2, '2021-01-04'),
(1, 3, '2021-01-04'),
(1, 12, '2021-01-05'),
(1, 14, '2021-01-01'),
(1, 25, '2021-01-02'),
(2, 2, '2021-01-01'),
(2, 12, '2021-01-01'),
(2, 23, '2020-12-09'),
(2, 25, '2021-01-02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lecture`
--

CREATE TABLE `lecture` (
  `LectureID` int(10) NOT NULL,
  `LectureName` varchar(76) DEFAULT NULL,
  `Preview` int(1) DEFAULT NULL,
  `VideoLink` varchar(255) DEFAULT NULL,
  `ContentID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lecture`
--

INSERT INTO `lecture` (`LectureID`, `LectureName`, `Preview`, `VideoLink`, `ContentID`) VALUES
(1, 'What is Flutter ?', 1, 'Vid-course-1.mp4', 1),
(2, 'Flutter MacOS Setup', 1, 'Vid-course-2.mp4', 1),
(3, 'Flutter Windows Setup', 1, 'Vid-course-3.mp4', 1),
(4, 'Module Introduction', 1, 'Vid-course-4.mp4', 2),
(5, 'Creating a new project', 1, 'Vid-course-5.mp4', 2),
(6, 'An Overview of the Generated Files & Folders', 0, '', 2),
(7, 'Module Introduction', 1, 'Vid-course-6.mp4', 3),
(8, 'Running the App on a Real Android Device', 0, '', 3),
(9, 'Running the App on an iOS Emulator', 0, '', 3),
(10, 'What is Flutter ?', 1, 'Vid-course-4.mp4', 4),
(11, 'Why is Flutter ?', 0, 'Vid-course-5.mp4', 4),
(12, 'Overview of the Process', 1, 'Vid-course-5.mp4', 5),
(13, 'Windows Setup Step 1 - Install the Flutter SDK', 1, 'Vid-course-6.mp4', 5),
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
(26, 'Creating a New Flutter Project from Scratch', 1, 'Vid-course-1.mp4', 6),
(27, 'A quick note about Hot Reload', 1, 'Vid-course-2.mp4', 6),
(28, 'Scaffolding a Flutter App', 0, '', 6),
(29, 'Working with Assets in Flutter & the Pubspec file', 0, '', 6),
(30, 'How to Add App Icons to the iOS and Android Apps', 0, '', 6),
(31, 'How to Ace this Course', 0, '', 6),
(32, 'How to Get Help', 1, 'Vid-course-3.mp4', 7),
(33, 'Course Organization', 1, 'Vid-course-4.mp4', 7),
(34, 'Dart Overview', 1, 'Vid-course-5.mp4', 8),
(35, 'The Dartpad Editor', 1, 'Vid-course-6.mp4', 8),
(36, 'Our First program', 0, '', 8),
(37, 'For Loops', 1, 'Vid-course-1.mp4', 9),
(38, 'Adding Elements to Lists', 1, 'Vid-course-2.mp4', 9),
(39, 'More on Variable Initialization', 0, '', 9),
(40, 'The Learning Path of This Course', 1, 'Vid-course-3.mp4', 10),
(41, 'Why Flutter Development ?', 1, 'Vid-course-4.mp4', 11),
(42, 'Important Message', 1, 'Vid-course-5.mp4', 11),
(43, 'Introduction to Classes and Objects', 1, 'Vid-course-1.mp4', 12),
(44, 'Introduction to Class Creation and Instance Variables', 1, 'Vid-course-2.mp4', 12),
(45, 'Adding Methods to Classes', 0, '', 12),
(46, 'Course Introduction', 1, 'Vid-course-3.mp4', 13),
(47, 'Course Content', 1, 'Vid-course-4.mp4', 13),
(48, 'App Overview', 0, '', 13),
(49, 'The Dart Language', 1, 'Vid-course-5.mp4', 14),
(50, 'Introduction to Dartpad', 1, 'Vid-course-6.mp4', 14),
(51, 'String interpolation', 0, '', 14),
(52, 'Flutter setup on macOS', 1, 'Vid-course-1.mp4', 15),
(53, 'Setting the PATH variable', 1, 'Vid-course-2.mp4', 15),
(54, 'Flutter doctor', 0, '', 15),
(55, 'Introduction', 0, '', 16),
(56, 'Search Bar', 1, 'Vid-course-3.mp4', 17),
(57, 'Recent Orders', 1, 'Vid-course-4.mp4', 17),
(58, 'Nearby Restaurant', 0, '', 17),
(59, 'Home Screen', 1, 'Vid-course-5.mp4', 18),
(60, 'Sliver App Bar and Sliver List', 1, 'Vid-course-6.mp4', 18),
(61, 'Bar Chart', 0, '', 18),
(62, 'Before you take this course', 1, 'Vid-course-1.mp4', 19),
(63, 'What is flutter for', 0, '', 19),
(64, 'Installing the flutter sdk', 1, 'Vid-course-2.mp4', 20),
(65, 'Installing android studio', 1, 'Vid-course-3.mp4', 20),
(66, 'Setting up emulator', 0, '', 20),
(67, 'Create and run the application', 1, 'Vid-course-4.mp4', 21),
(68, 'Create and run the application using android studio', 1, 'Vid-course-5.mp4', 21),
(69, 'Writing from scratch', 0, '', 21),
(70, 'What does the course cover ?', 1, 'Vid-course-6.mp4', 22),
(71, 'How To Get All The Free Stuff', 1, 'Vid-course-1.mp4', 22),
(72, 'Frequently Asked Questions', 0, '', 22),
(73, 'Asking Great Questions & Debugging Your Code', 0, '', 22),
(74, 'Introduction', 1, 'Vid-course-2.mp4', 23),
(75, 'Installing Anndroid Studio On MacOS', 1, 'Vid-course-3.mp4', 23),
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
(93, 'Hello World With Java', 1, 'Vid-course-4.mp4', 24),
(94, 'Hello World With Java (Java files)', 1, 'Vid-course-5.mp4', 24),
(95, 'Variables', 0, '', 24),
(96, 'Variables (Java files)', 0, '', 24),
(97, 'Arrays And Maps', 0, '', 24),
(98, 'Arrays And Maps (Java files)', 0, '', 24),
(99, 'If Statements', 0, '', 24),
(100, 'If Statements (Java Files)', 0, '', 24),
(101, 'What does the course cover ?', 1, 'Vid-course-1.mp4', 25),
(102, 'How To Get All The Free Stuff', 1, 'Vid-course-2.mp4', 25),
(103, 'Frequently Asked Questions', 0, '', 25),
(104, 'Asking Great Questions & Debugging Your Code', 0, '', 25),
(105, 'Introduction', 1, 'Vid-course-3.mp4', 26),
(106, 'Installing Anndroid Studio On MacOS', 1, 'Vid-course-4.mp4', 26),
(107, 'Installing Anndroid Studio On Windows', 1, 'Vid-course-5.mp4', 26),
(108, 'Android Studio Overview', 1, 'Vid-course-6.mp4', 26),
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
(124, 'Hello World With Java', 1, 'Vid-course-1.mp4', 27),
(125, 'Hello World With Java (Java files)', 1, 'Vid-course-2.mp4', 27),
(126, 'Variables', 0, '', 27),
(127, 'Variables (Java files)', 0, '', 27),
(128, 'Arrays And Maps', 0, '', 27),
(129, 'Arrays And Maps (Java files)', 0, '', 27),
(130, 'If Statements', 0, '', 27),
(131, 'If Statements (Java Files)', 0, '', 27),
(132, 'Interface Overview', 1, 'Vid-course-3.mp4', 28),
(133, 'Introduction to Android', 1, 'Vid-course-4.mp4', 28),
(134, 'FAQ', 0, '', 28),
(135, 'Windows - Install Android Studio', 1, 'Vid-course-5.mp4', 29),
(136, 'Mac - Install Android Studio', 1, 'Vid-course-6.mp4', 29),
(137, 'Linux - Install Android Studio', 0, '', 29),
(138, 'Hello World', 1, 'Vid-course-1.mp4', 30),
(139, 'Tour of Android Studio', 1, 'Vid-course-2.mp4', 30),
(140, 'Setting Up a Virtual Device', 0, '', 30),
(141, 'Learning Path', 1, 'Vid-course-3.mp4', 31),
(142, 'Important Message', 0, '', 31),
(143, 'WINDOWS USERS ONLY] Download Android Studio for Windows', 1, 'Vid-course-4.mp4', 32),
(144, '[OPTIONAL - WINDOWS USERS ONLY]VTX Emulator Issues Fixes on Windows', 0, '', 32),
(145, '[MAC USERS ONLY] Download and Install Android Studio on MAC', 1, 'Vid-course-1.mp4', 33),
(146, 'Configure Android Studio for Productivity: Themes, Auto-Import & SDKs', 1, 'Vid-course-2.mp4', 34),
(147, 'How to Set Up an Android Emulator with Hardware Acceleration', 1, 'Vid-course-3.mp4', 34),
(148, 'How to Get All the Free Stuff', 0, '', 34),
(149, 'Working with the Layout Editor, Strings, and App Themes', 1, 'Vid-course-4.mp4', 35),
(150, 'Adding Graphics to a Project and using ImageViews', 0, '', 35),
(151, 'What is XML and How Does it Work ?', 1, 'Vid-course-5.mp4', 35),
(152, 'What are the Coding Challenges?', 1, 'Vid-course-1.mp4', 36),
(153, 'What You Will Create', 1, 'Vid-course-2.mp4', 36),
(154, 'Step 1: Importing Projects from GitHub and Opening them in Android Studio ⭐️', 0, '', 36),
(155, 'Introduction', 0, '', 37),
(156, 'The Udemy Interface', 1, 'Vid-course-3.mp4', 37),
(157, 'Introduction To Android', 1, 'Vid-course-4.mp4', 37),
(158, 'Mac - Install Android Studio', 1, 'Vid-course-1.mp4', 38),
(159, 'Linux - Install Android Studio', 0, '', 38),
(160, 'Configure Android SDK on all Three Platforms', 1, 'Vid-course-2.mp4', 38),
(161, 'Your Programming Careers Questions Answered', 1, 'Vid-course-3.mp4', 39),
(162, 'Access to Programming Career Q&A', 1, 'Vid-course-4.mp4', 39),
(163, 'Introduction', 0, '', 39),
(164, 'What is a Programming Language', 1, 'Vid-course-5.mp4', 40),
(165, 'Lots of Programming Languages. Why?', 1, 'Vid-course-6.mp4', 40),
(166, 'What is Java?', 0, '', 40),
(167, 'Learning Objectives', 1, 'Vid-course-1.mp4', 41),
(168, 'Enter the world of android application development!', 1, 'Vid-course-2.mp4', 41),
(169, 'Download & Install Android Studio', 0, '', 41),
(170, 'Learning Objectives', 1, 'Vid-course-3.mp4', 42),
(171, 'Take a look at Java Code!', 1, 'Vid-course-4.mp4', 42),
(172, 'Take a look at XML Code!', 0, '', 42),
(173, 'Watch Before You Start!', 1, 'Vid-course-5.mp4', 43),
(174, 'Read Before You Start!', 1, 'Vid-course-6.mp4', 43),
(175, 'Migration Guide to v2 + Old Course', 0, '', 43),
(176, 'Section Intro', 1, 'Vid-course-1.mp4', 44),
(177, 'Hello World!', 1, 'Vid-course-2.mp4', 44),
(178, 'A Brief Introduction to JavaScript', 0, '', 44),
(179, 'Section Intro', 1, 'Vid-course-3.mp4', 45),
(180, 'Activating Strict Mode', 1, 'Vid-course-4.mp4', 45),
(181, 'Functions', 0, '', 45),
(182, 'Introduction and The Goal of this Course', 1, 'Vid-course-5.mp4', 46),
(183, 'Setup', 1, 'Vid-course-6.mp4', 46),
(184, 'Big Words and Javascript', 0, '', 46),
(185, 'What About Asunchronous Callbacks?', 1, 'Vid-course-1.mp4', 47),
(186, 'The Scope Chain', 1, 'Vid-course-2.mp4', 47),
(187, 'Scope, ES6, and let', 0, '', 47),
(188, 'Primitive Types', 1, 'Vid-course-3.mp4', 48),
(189, 'Conceptual Aside : Operators', 1, 'Vid-course-4.mp4', 48),
(190, 'Operator Precedence and Associaivity', 0, '', 48),
(191, 'Welcome To The Course', 1, 'Vid-course-5.mp4', 49),
(192, 'Project Files & Questions', 1, 'Vid-course-6.mp4', 49),
(193, 'Projects Github Repo', 0, '', 49),
(194, 'Type Conversion', 1, 'Vid-course-1.mp4', 50),
(195, 'Numbers & The Math Object', 1, 'Vid-course-2.mp4', 50),
(196, 'String Methods & Concatenation', 0, '', 50),
(197, 'What is the DOM ?>', 1, 'Vid-course-3.mp4', 51),
(198, 'DOM Selectors For Multiple Elements', 1, 'Vid-course-4.mp4', 51),
(199, 'Traversing The DOM', 0, '', 51),
(200, 'Introduction', 1, 'Vid-course-1.mp4', 52),
(201, 'What is JavaScript?', 1, 'Vid-course-2.mp4', 52),
(202, 'JavaScript In Action', 0, '', 52),
(203, 'Adding JavaScript to the Website', 1, 'Vid-course-3.mp4', 53),
(204, 'Introducing Variables & Constants', 1, 'Vid-course-4.mp4', 53),
(205, 'Declaring & Defining Variables', 0, '', 53),
(206, 'Module Introduction', 1, 'Vid-course-5.mp4', 54),
(207, 'Efficient Development & Debugging - An Overview', 1, 'Vid-course-6.mp4', 54),
(208, 'Configuring the IDE Look & Feel', 0, '', 54),
(209, 'Welcome!', 1, 'Vid-course-1.mp4', 55),
(210, 'Grab the PDF Guide', 0, '', 55),
(211, 'Installing VSCode', 1, 'Vid-course-2.mp4', 56),
(212, 'Install cmder', 1, 'Vid-course-3.mp4', 56),
(213, 'Installing Node.js', 0, '', 56),
(214, 'Logical \"And\" and \"Or\" Operators', 1, 'Vid-course-4.mp4', 57),
(215, 'Variable Scope: Part I', 1, 'Vid-course-5.mp4', 57),
(216, 'Variable Scope: Part II', 0, '', 57),
(217, 'How To Succeed In This Course', 1, 'Vid-course-6.mp4', 58),
(218, 'Join Our Online Classroom', 1, 'Vid-course-1.mp4', 58),
(219, 'Exercise: Meet The Community!', 0, '', 58),
(220, 'Inside the V8 Engine', 1, 'Vid-course-2.mp4', 59),
(221, 'Comparing Other Languages', 1, 'Vid-course-3.mp4', 59),
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
  `LecturerName` varchar(37) DEFAULT NULL,
  `UserID` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lecturer`
--

INSERT INTO `lecturer` (`LecturerID`, `LecturerName`, `UserID`) VALUES
(1, 'Academind by Maximilian Schwarzmüller', 0),
(2, 'Maximilian Schwarzmüller', 0),
(3, 'Dr. Angela Yu', 0),
(4, 'Stephen Grider', 4),
(5, 'Paulo Dichone', 0),
(6, 'Andrea Bizzotto', 0),
(7, 'Marcus Ng', 0),
(8, 'Lutfor Rahman', 0),
(9, 'Rob Percival', 0),
(10, 'Marc Stock', 0),
(11, 'Codestars by Rob Percival', 0),
(12, 'Nick Walter', 0),
(13, 'Tim Buchalka', 0),
(14, 'Jean-Paul Roberts', 0),
(15, 'Philipp Muellauer', 0),
(16, 'Morteza Kordi', 0),
(17, 'Jonas Schmedtmann', 0),
(18, 'Anthony Alicea', 0),
(19, 'Brad Traversy', 0),
(20, 'Andrew Mead', 0),
(21, 'Andrei Neagoie', 0),
(22, 'Colt Steele', 0),
(23, 'Brad Schiff', 0),
(24, 'Manuel Lorenz', 0),
(25, 'Brad Hussey', 0),
(26, 'Code College', 0),
(27, 'Florin Pop', 0);

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
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `ReviewID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `CourseID` int(10) NOT NULL,
  `Rate` int(6) NOT NULL,
  `Comment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `review`
--

INSERT INTO `review` (`ReviewID`, `UserID`, `CourseID`, `Rate`, `Comment`) VALUES
(1, 1, 16, 5, 'This course was chill. I would absolutely have dro'),
(2, 1, 9, 5, 'This course was fascinating. I would completely ma'),
(3, 2, 23, 4, 'This course was stupid. I would definitely recomme'),
(4, 2, 7, 4, 'This course was so post-modern. I would definitely'),
(5, 2, 24, 5, 'This course was not very fun. I would absolutely t'),
(6, 3, 11, 5, 'This course was not very useful. I would certainly'),
(7, 3, 24, 4, 'This course was not very fun. I would certainly no'),
(8, 2, 27, 5, 'This course was chill. I would definitely not reco'),
(9, 3, 14, 5, 'This course was so post-modern. I would not be wri'),
(10, 3, 35, 4, 'This course was the reason I woke up in the mornin'),
(11, 1, 32, 4, 'This course was chill. I would absolutely have dro'),
(12, 2, 18, 5, 'This course was fascinating. I would completely ma'),
(13, 2, 35, 5, 'This course was stupid. I would definitely recomme'),
(14, 1, 35, 5, 'This course was so post-modern. I would definitely'),
(15, 1, 7, 5, 'This course was not very fun. I would absolutely t'),
(16, 1, 6, 5, 'This course was not very useful. I would certainly'),
(17, 2, 4, 4, 'This course was not very fun. I would certainly no'),
(18, 1, 18, 5, 'This course was chill. I would definitely not reco'),
(19, 3, 29, 4, 'This course was so post-modern. I would not be wri'),
(20, 2, 29, 4, 'This course was the reason I woke up in the mornin'),
(21, 1, 24, 4, 'This course was chill. I would absolutely have dro'),
(22, 3, 15, 4, 'This course was fascinating. I would completely ma'),
(23, 3, 13, 4, 'This course was stupid. I would definitely recomme'),
(24, 1, 26, 4, 'This course was so post-modern. I would definitely'),
(25, 2, 18, 4, 'This course was not very fun. I would absolutely t'),
(26, 1, 9, 5, 'This course was not very useful. I would certainly'),
(27, 1, 24, 5, 'This course was not very fun. I would certainly no'),
(28, 3, 29, 4, 'This course was chill. I would definitely not reco'),
(29, 2, 17, 4, 'This course was so post-modern. I would not be wri'),
(30, 2, 3, 4, 'This course was the reason I woke up in the mornin'),
(31, 2, 8, 4, 'This course was chill. I would absolutely have dro'),
(32, 1, 23, 5, 'This course was fascinating. I would completely ma'),
(33, 1, 20, 4, 'This course was stupid. I would definitely recomme'),
(34, 3, 30, 5, 'This course was so post-modern. I would definitely'),
(35, 2, 22, 4, 'This course was not very fun. I would absolutely t'),
(36, 3, 22, 4, 'This course was not very useful. I would certainly'),
(37, 3, 30, 4, 'This course was not very fun. I would certainly no'),
(38, 1, 19, 5, 'This course was chill. I would definitely not reco'),
(39, 1, 17, 5, 'This course was so post-modern. I would not be wri'),
(40, 1, 5, 5, 'This course was the reason I woke up in the mornin'),
(41, 3, 2, 4, 'This course was chill. I would absolutely have dro'),
(42, 1, 12, 5, 'This course was fascinating. I would completely ma'),
(43, 2, 17, 4, 'This course was stupid. I would definitely recomme'),
(44, 3, 24, 5, 'This course was so post-modern. I would definitely'),
(45, 3, 22, 5, 'This course was not very fun. I would absolutely t'),
(46, 2, 12, 5, 'This course was not very useful. I would certainly'),
(47, 3, 17, 4, 'This course was not very fun. I would certainly no'),
(48, 1, 6, 4, 'This course was chill. I would definitely not reco'),
(49, 2, 4, 4, 'This course was so post-modern. I would not be wri'),
(50, 2, 3, 4, 'This course was the reason I woke up in the mornin'),
(51, 3, 19, 4, 'This course was chill. I would absolutely have dro'),
(52, 1, 8, 4, 'This course was fascinating. I would completely ma'),
(53, 1, 17, 4, 'This course was stupid. I would definitely recomme'),
(54, 3, 13, 5, 'This course was so post-modern. I would definitely'),
(55, 1, 24, 4, 'This course was not very fun. I would absolutely t'),
(56, 3, 5, 5, 'This course was not very useful. I would certainly'),
(57, 2, 21, 4, 'This course was not very fun. I would certainly no'),
(58, 1, 3, 5, 'This course was chill. I would definitely not reco'),
(59, 3, 15, 5, 'This course was so post-modern. I would not be wri'),
(60, 2, 24, 4, 'This course was the reason I woke up in the mornin'),
(61, 1, 30, 5, 'This course was chill. I would absolutely have dro'),
(62, 3, 29, 5, 'This course was fascinating. I would completely ma'),
(63, 2, 33, 4, 'This course was stupid. I would definitely recomme'),
(64, 1, 12, 5, 'This course was so post-modern. I would definitely'),
(65, 1, 1, 4, 'This course was not very fun. I would absolutely t'),
(66, 2, 15, 5, 'This course was not very useful. I would certainly'),
(67, 3, 3, 4, 'This course was not very fun. I would certainly no'),
(68, 1, 25, 4, 'This course was chill. I would definitely not reco'),
(69, 3, 9, 4, 'This course was so post-modern. I would not be wri'),
(70, 2, 17, 4, 'This course was the reason I woke up in the mornin'),
(71, 2, 19, 5, 'This course was chill. I would absolutely have dro'),
(72, 2, 5, 5, 'This course was fascinating. I would completely ma'),
(73, 1, 21, 5, 'This course was stupid. I would definitely recomme'),
(74, 3, 17, 4, 'This course was so post-modern. I would definitely'),
(75, 1, 3, 5, 'This course was not very fun. I would absolutely t'),
(76, 1, 33, 5, 'This course was not very useful. I would certainly'),
(77, 2, 2, 5, 'This course was not very fun. I would certainly no'),
(78, 3, 6, 5, 'This course was chill. I would definitely not reco'),
(79, 3, 35, 5, 'This course was so post-modern. I would not be wri'),
(80, 2, 12, 4, 'This course was the reason I woke up in the mornin'),
(81, 2, 13, 4, 'This course was chill. I would absolutely have dro'),
(82, 2, 10, 4, 'This course was fascinating. I would completely ma'),
(83, 2, 16, 4, 'This course was stupid. I would definitely recomme'),
(84, 2, 30, 5, 'This course was so post-modern. I would definitely'),
(85, 2, 14, 5, 'This course was not very fun. I would absolutely t'),
(86, 3, 4, 5, 'This course was not very useful. I would certainly'),
(87, 1, 7, 5, 'This course was not very fun. I would certainly no'),
(88, 3, 4, 5, 'This course was chill. I would definitely not reco'),
(89, 2, 33, 4, 'This course was so post-modern. I would not be wri'),
(90, 3, 33, 4, 'This course was the reason I woke up in the mornin'),
(91, 1, 12, 4, 'This course was chill. I would absolutely have dro'),
(92, 3, 6, 4, 'This course was fascinating. I would completely ma'),
(93, 2, 22, 4, 'This course was stupid. I would definitely recomme'),
(94, 2, 18, 5, 'This course was so post-modern. I would definitely'),
(95, 2, 18, 4, 'This course was not very fun. I would absolutely t'),
(96, 2, 32, 4, 'This course was not very useful. I would certainly'),
(97, 1, 20, 4, 'This course was not very fun. I would certainly no'),
(98, 3, 32, 5, 'This course was chill. I would definitely not reco'),
(99, 2, 34, 5, 'This course was so post-modern. I would not be wri'),
(100, 2, 2, 4, 'This course was the reason I woke up in the mornin'),
(101, 2, 11, 5, 'This course was chill. I would absolutely have dro'),
(102, 1, 9, 4, 'This course was fascinating. I would completely ma'),
(103, 1, 27, 4, 'This course was stupid. I would definitely recomme'),
(104, 2, 15, 5, 'This course was so post-modern. I would definitely'),
(105, 2, 18, 4, 'This course was not very fun. I would absolutely t'),
(106, 1, 2, 5, 'This course was not very useful. I would certainly'),
(107, 3, 8, 5, 'This course was not very fun. I would certainly no'),
(108, 2, 9, 4, 'This course was chill. I would definitely not reco'),
(109, 3, 11, 4, 'This course was so post-modern. I would not be wri'),
(110, 2, 2, 4, 'This course was the reason I woke up in the mornin'),
(111, 3, 12, 5, 'This course was chill. I would absolutely have dro'),
(112, 1, 9, 4, 'This course was fascinating. I would completely ma'),
(113, 2, 28, 5, 'This course was stupid. I would definitely recomme'),
(114, 3, 14, 5, 'This course was so post-modern. I would definitely'),
(115, 2, 17, 5, 'This course was not very fun. I would absolutely t'),
(116, 3, 24, 5, 'This course was not very useful. I would certainly'),
(117, 2, 26, 5, 'This course was not very fun. I would certainly no'),
(118, 3, 12, 4, 'This course was chill. I would definitely not reco'),
(119, 1, 30, 5, 'This course was so post-modern. I would not be wri'),
(120, 1, 15, 5, 'This course was the reason I woke up in the mornin'),
(121, 1, 30, 5, 'This course was chill. I would absolutely have dro'),
(122, 2, 30, 5, 'This course was fascinating. I would completely ma'),
(123, 3, 24, 4, 'This course was stupid. I would definitely recomme'),
(124, 3, 8, 5, 'This course was so post-modern. I would definitely'),
(125, 2, 26, 4, 'This course was not very fun. I would absolutely t'),
(126, 1, 18, 4, 'This course was not very useful. I would certainly'),
(127, 3, 13, 5, 'This course was not very fun. I would certainly no'),
(128, 2, 14, 4, 'This course was chill. I would definitely not reco'),
(129, 2, 17, 4, 'This course was so post-modern. I would not be wri'),
(130, 3, 35, 4, 'This course was the reason I woke up in the mornin'),
(131, 3, 10, 4, 'This course was chill. I would absolutely have dro'),
(132, 2, 21, 5, 'This course was fascinating. I would completely ma'),
(133, 3, 2, 4, 'This course was stupid. I would definitely recomme'),
(134, 3, 31, 4, 'This course was so post-modern. I would definitely'),
(135, 2, 24, 4, 'This course was not very fun. I would absolutely t'),
(136, 3, 8, 5, 'This course was not very useful. I would certainly'),
(137, 2, 21, 5, 'This course was not very fun. I would certainly no'),
(138, 1, 10, 5, 'This course was chill. I would definitely not reco'),
(139, 2, 12, 4, 'This course was so post-modern. I would not be wri'),
(140, 3, 18, 5, 'This course was the reason I woke up in the mornin'),
(141, 2, 27, 5, 'This course was chill. I would absolutely have dro'),
(142, 1, 34, 5, 'This course was fascinating. I would completely ma'),
(143, 2, 16, 5, 'This course was stupid. I would definitely recomme'),
(144, 1, 12, 4, 'This course was so post-modern. I would definitely'),
(145, 3, 1, 5, 'This course was not very fun. I would absolutely t'),
(146, 2, 18, 4, 'This course was not very useful. I would certainly'),
(147, 3, 22, 5, 'This course was not very fun. I would certainly no'),
(148, 3, 12, 4, 'This course was chill. I would definitely not reco'),
(149, 2, 11, 4, 'This course was so post-modern. I would not be wri'),
(150, 2, 1, 5, 'This course was the reason I woke up in the mornin'),
(151, 2, 5, 4, 'This course was chill. I would absolutely have dro'),
(152, 2, 6, 4, 'This course was fascinating. I would completely ma'),
(153, 1, 8, 5, 'This course was stupid. I would definitely recomme'),
(154, 3, 20, 5, 'This course was so post-modern. I would definitely'),
(155, 1, 32, 4, 'This course was not very fun. I would absolutely t'),
(156, 1, 5, 4, 'This course was not very useful. I would certainly'),
(157, 2, 3, 5, 'This course was not very fun. I would certainly no'),
(158, 2, 20, 4, 'This course was chill. I would definitely not reco'),
(159, 2, 2, 5, 'This course was so post-modern. I would not be wri'),
(160, 3, 29, 5, 'This course was the reason I woke up in the mornin'),
(161, 3, 3, 5, 'This course was chill. I would absolutely have dro'),
(162, 2, 31, 4, 'This course was fascinating. I would completely ma'),
(163, 3, 11, 4, 'This course was stupid. I would definitely recomme'),
(164, 3, 2, 5, 'This course was so post-modern. I would definitely'),
(165, 3, 14, 5, 'This course was not very fun. I would absolutely t'),
(166, 3, 31, 4, 'This course was not very useful. I would certainly'),
(167, 2, 24, 5, 'This course was not very fun. I would certainly no'),
(168, 3, 24, 4, 'This course was chill. I would definitely not reco'),
(169, 1, 1, 4, 'This course was so post-modern. I would not be wri'),
(170, 3, 18, 4, 'This course was the reason I woke up in the mornin'),
(171, 1, 21, 5, 'This course was chill. I would absolutely have dro'),
(172, 1, 22, 5, 'This course was fascinating. I would completely ma'),
(173, 2, 20, 4, 'This course was stupid. I would definitely recomme'),
(174, 1, 2, 5, 'This course was so post-modern. I would definitely'),
(175, 1, 16, 4, 'This course was not very fun. I would absolutely t'),
(176, 3, 2, 5, 'This course was not very useful. I would certainly'),
(177, 2, 29, 5, 'This course was not very fun. I would certainly no'),
(178, 2, 21, 5, 'This course was chill. I would definitely not reco'),
(179, 2, 31, 5, 'This course was so post-modern. I would not be wri'),
(180, 3, 13, 4, 'This course was the reason I woke up in the mornin'),
(181, 1, 35, 5, 'This course was chill. I would absolutely have dro'),
(182, 2, 1, 5, 'This course was fascinating. I would completely ma'),
(183, 1, 17, 5, 'This course was stupid. I would definitely recomme'),
(184, 1, 21, 5, 'This course was so post-modern. I would definitely'),
(185, 1, 26, 4, 'This course was not very fun. I would absolutely t'),
(186, 3, 11, 4, 'This course was not very useful. I would certainly'),
(187, 1, 12, 5, 'This course was not very fun. I would certainly no'),
(188, 2, 3, 5, 'This course was chill. I would definitely not reco'),
(189, 2, 16, 5, 'This course was so post-modern. I would not be wri'),
(190, 2, 32, 4, 'This course was the reason I woke up in the mornin'),
(191, 1, 13, 5, 'This course was chill. I would absolutely have dro'),
(192, 1, 9, 4, 'This course was fascinating. I would completely ma'),
(193, 2, 31, 4, 'This course was stupid. I would definitely recomme'),
(194, 3, 16, 5, 'This course was so post-modern. I would definitely'),
(195, 3, 18, 5, 'This course was not very fun. I would absolutely t'),
(196, 1, 4, 5, 'This course was not very useful. I would certainly'),
(197, 3, 35, 5, 'This course was not very fun. I would certainly no'),
(198, 3, 20, 5, 'This course was chill. I would definitely not reco'),
(199, 3, 1, 4, 'This course was so post-modern. I would not be wri'),
(200, 3, 12, 5, 'This course was the reason I woke up in the mornin'),
(201, 2, 33, 5, 'This course was chill. I would absolutely have dro'),
(202, 1, 30, 5, 'This course was fascinating. I would completely ma'),
(203, 3, 32, 4, 'This course was stupid. I would definitely recomme'),
(204, 2, 21, 5, 'This course was so post-modern. I would definitely'),
(205, 1, 24, 5, 'This course was not very fun. I would absolutely t'),
(206, 3, 8, 5, 'This course was not very useful. I would certainly'),
(207, 2, 7, 4, 'This course was not very fun. I would certainly no'),
(208, 2, 9, 5, 'This course was chill. I would definitely not reco'),
(209, 1, 2, 5, 'This course was so post-modern. I would not be wri'),
(210, 1, 30, 5, 'This course was the reason I woke up in the mornin'),
(211, 1, 22, 5, 'This course was chill. I would absolutely have dro'),
(212, 2, 14, 4, 'This course was fascinating. I would completely ma'),
(213, 1, 20, 5, 'This course was stupid. I would definitely recomme'),
(214, 1, 15, 5, 'This course was so post-modern. I would definitely'),
(215, 1, 10, 4, 'This course was not very fun. I would absolutely t'),
(216, 2, 23, 5, 'This course was not very useful. I would certainly'),
(217, 2, 26, 5, 'This course was not very fun. I would certainly no'),
(218, 1, 3, 4, 'This course was chill. I would definitely not reco'),
(219, 3, 2, 5, 'This course was so post-modern. I would not be wri'),
(220, 1, 29, 4, 'This course was the reason I woke up in the mornin'),
(221, 2, 17, 4, 'This course was chill. I would absolutely have dro'),
(222, 1, 20, 4, 'This course was fascinating. I would completely ma'),
(223, 3, 27, 4, 'This course was stupid. I would definitely recomme'),
(224, 2, 19, 5, 'This course was so post-modern. I would definitely'),
(225, 3, 16, 5, 'This course was not very fun. I would absolutely t'),
(226, 2, 13, 5, 'This course was not very useful. I would certainly'),
(227, 3, 17, 4, 'This course was not very fun. I would certainly no'),
(228, 1, 17, 5, 'This course was chill. I would definitely not reco'),
(229, 3, 27, 5, 'This course was so post-modern. I would not be wri'),
(230, 2, 22, 4, 'This course was the reason I woke up in the mornin'),
(231, 2, 10, 5, 'This course was chill. I would absolutely have dro'),
(232, 3, 23, 5, 'This course was fascinating. I would completely ma'),
(233, 2, 18, 5, 'This course was stupid. I would definitely recomme'),
(234, 1, 8, 5, 'This course was so post-modern. I would definitely'),
(235, 3, 22, 4, 'This course was not very fun. I would absolutely t'),
(236, 3, 4, 5, 'This course was not very useful. I would certainly'),
(237, 3, 16, 4, 'This course was not very fun. I would certainly no'),
(238, 2, 31, 4, 'This course was chill. I would definitely not reco'),
(239, 3, 35, 5, 'This course was so post-modern. I would not be wri'),
(240, 1, 2, 4, 'This course was the reason I woke up in the mornin'),
(241, 2, 30, 5, 'This course was chill. I would absolutely have dro'),
(242, 2, 7, 5, 'This course was fascinating. I would completely ma'),
(243, 2, 14, 5, 'This course was stupid. I would definitely recomme'),
(244, 2, 13, 4, 'This course was so post-modern. I would definitely'),
(245, 3, 2, 4, 'This course was not very fun. I would absolutely t'),
(246, 3, 5, 5, 'This course was not very useful. I would certainly'),
(247, 1, 8, 5, 'This course was not very fun. I would certainly no'),
(248, 2, 34, 4, 'This course was chill. I would definitely not reco'),
(249, 6, 25, 5, 'This course was so post-modern. I would not be wri'),
(250, 6, 25, 5, 'This course was the reason I woke up in the mornin'),
(251, 6, 18, 4, 'This course was chill. I would absolutely have dro'),
(252, 5, 13, 4, 'This course was fascinating. I would completely ma'),
(253, 5, 14, 5, 'This course was stupid. I would definitely recomme'),
(254, 6, 12, 4, 'This course was so post-modern. I would definitely'),
(255, 5, 31, 5, 'This course was not very fun. I would absolutely t'),
(256, 5, 21, 5, 'This course was not very useful. I would certainly'),
(257, 5, 1, 5, 'This course was not very fun. I would certainly no'),
(258, 5, 15, 4, 'This course was chill. I would definitely not reco'),
(259, 6, 4, 4, 'This course was so post-modern. I would not be wri'),
(260, 6, 12, 5, 'This course was the reason I woke up in the mornin'),
(261, 6, 10, 4, 'This course was chill. I would absolutely have dro'),
(262, 5, 17, 4, 'This course was fascinating. I would completely ma'),
(263, 5, 16, 5, 'This course was stupid. I would definitely recomme'),
(264, 6, 21, 5, 'This course was so post-modern. I would definitely'),
(265, 6, 18, 5, 'This course was not very fun. I would absolutely t'),
(266, 6, 33, 4, 'This course was not very useful. I would certainly'),
(267, 5, 34, 4, 'This course was not very fun. I would certainly no'),
(268, 5, 2, 5, 'This course was chill. I would definitely not reco'),
(269, 5, 16, 5, 'This course was so post-modern. I would not be wri'),
(270, 5, 22, 4, 'This course was the reason I woke up in the mornin'),
(271, 6, 8, 5, 'This course was chill. I would absolutely have dro'),
(272, 5, 7, 5, 'This course was fascinating. I would completely ma'),
(273, 6, 9, 4, 'This course was stupid. I would definitely recomme'),
(274, 6, 31, 5, 'This course was so post-modern. I would definitely'),
(275, 6, 30, 4, 'This course was not very fun. I would absolutely t'),
(276, 6, 2, 5, 'This course was not very useful. I would certainly'),
(277, 6, 11, 4, 'This course was not very fun. I would certainly no'),
(278, 6, 6, 4, 'This course was chill. I would definitely not reco'),
(279, 5, 18, 4, 'This course was so post-modern. I would not be wri'),
(280, 6, 2, 5, 'This course was the reason I woke up in the mornin'),
(281, 5, 27, 5, 'This course was chill. I would absolutely have dro'),
(282, 6, 5, 4, 'This course was fascinating. I would completely ma'),
(283, 6, 32, 4, 'This course was stupid. I would definitely recomme'),
(284, 5, 32, 5, 'This course was so post-modern. I would definitely'),
(285, 6, 16, 4, 'This course was not very fun. I would absolutely t'),
(286, 5, 30, 4, 'This course was not very useful. I would certainly'),
(287, 6, 14, 5, 'This course was not very fun. I would certainly no'),
(288, 5, 13, 5, 'This course was chill. I would definitely not reco'),
(289, 6, 24, 4, 'This course was so post-modern. I would not be wri'),
(290, 6, 3, 5, 'This course was the reason I woke up in the mornin'),
(291, 5, 22, 5, 'This course was chill. I would absolutely have dro'),
(292, 5, 10, 4, 'This course was fascinating. I would completely ma'),
(293, 6, 22, 4, 'This course was stupid. I would definitely recomme'),
(294, 6, 16, 5, 'This course was so post-modern. I would definitely'),
(295, 5, 33, 4, 'This course was not very fun. I would absolutely t'),
(296, 5, 29, 5, 'This course was not very useful. I would certainly'),
(297, 6, 12, 5, 'This course was not very fun. I would certainly no'),
(298, 6, 1, 5, 'This course was chill. I would definitely not reco'),
(299, 5, 19, 5, 'This course was so post-modern. I would not be wri'),
(300, 5, 7, 5, 'This course was the reason I woke up in the mornin'),
(301, 6, 31, 5, 'This course was chill. I would absolutely have dro'),
(302, 5, 35, 5, 'This course was fascinating. I would completely ma'),
(303, 6, 33, 5, 'This course was stupid. I would definitely recomme'),
(304, 5, 17, 4, 'This course was so post-modern. I would definitely'),
(305, 5, 1, 4, 'This course was not very fun. I would absolutely t'),
(306, 6, 2, 5, 'This course was not very useful. I would certainly'),
(307, 5, 6, 4, 'This course was not very fun. I would certainly no'),
(308, 6, 7, 4, 'This course was chill. I would definitely not reco'),
(309, 5, 4, 4, 'This course was so post-modern. I would not be wri'),
(310, 6, 27, 5, 'This course was the reason I woke up in the mornin'),
(311, 6, 11, 4, 'This course was chill. I would absolutely have dro'),
(312, 6, 30, 5, 'This course was fascinating. I would completely ma'),
(313, 5, 20, 5, 'This course was stupid. I would definitely recomme'),
(314, 5, 29, 5, 'This course was so post-modern. I would definitely'),
(315, 5, 6, 4, 'This course was not very fun. I would absolutely t'),
(316, 6, 6, 5, 'This course was not very useful. I would certainly'),
(317, 6, 24, 4, 'This course was not very fun. I would certainly no'),
(318, 6, 29, 4, 'This course was chill. I would definitely not reco'),
(319, 6, 23, 4, 'This course was so post-modern. I would not be wri'),
(320, 6, 8, 4, 'This course was the reason I woke up in the mornin'),
(321, 6, 29, 5, 'This course was chill. I would absolutely have dro'),
(322, 6, 32, 5, 'This course was fascinating. I would completely ma'),
(323, 5, 32, 4, 'This course was stupid. I would definitely recomme'),
(324, 5, 19, 5, 'This course was so post-modern. I would definitely'),
(325, 6, 29, 5, 'This course was not very fun. I would absolutely t'),
(326, 5, 6, 5, 'This course was not very useful. I would certainly'),
(327, 6, 24, 4, 'This course was not very fun. I would certainly no'),
(328, 6, 10, 5, 'This course was chill. I would definitely not reco'),
(329, 5, 6, 4, 'This course was so post-modern. I would not be wri'),
(330, 5, 2, 5, 'This course was the reason I woke up in the mornin'),
(331, 5, 32, 4, 'This course was chill. I would absolutely have dro'),
(332, 5, 4, 5, 'This course was fascinating. I would completely ma'),
(333, 6, 6, 4, 'This course was stupid. I would definitely recomme'),
(334, 6, 18, 5, 'This course was so post-modern. I would definitely'),
(335, 6, 11, 5, 'This course was not very fun. I would absolutely t'),
(336, 5, 1, 5, 'This course was not very useful. I would certainly'),
(337, 6, 21, 4, 'This course was not very fun. I would certainly no'),
(338, 6, 2, 5, 'This course was chill. I would definitely not reco'),
(339, 6, 18, 5, 'This course was so post-modern. I would not be wri'),
(340, 5, 13, 4, 'This course was the reason I woke up in the mornin'),
(341, 5, 20, 4, 'This course was chill. I would absolutely have dro'),
(342, 6, 9, 5, 'This course was fascinating. I would completely ma'),
(343, 6, 15, 5, 'This course was stupid. I would definitely recomme'),
(344, 5, 26, 4, 'This course was so post-modern. I would definitely'),
(345, 5, 22, 4, 'This course was not very fun. I would absolutely t'),
(346, 6, 2, 5, 'This course was not very useful. I would certainly'),
(347, 6, 20, 5, 'This course was not very fun. I would certainly no'),
(348, 5, 35, 5, 'This course was chill. I would definitely not reco'),
(349, 6, 14, 4, 'This course was so post-modern. I would not be wri'),
(350, 5, 20, 4, 'This course was the reason I woke up in the mornin'),
(351, 5, 2, 5, 'This course was chill. I would absolutely have dro'),
(352, 5, 14, 5, 'This course was fascinating. I would completely ma'),
(353, 6, 34, 5, 'This course was stupid. I would definitely recomme'),
(354, 6, 14, 4, 'This course was so post-modern. I would definitely'),
(355, 5, 23, 4, 'This course was not very fun. I would absolutely t'),
(356, 6, 23, 4, 'This course was not very useful. I would certainly'),
(357, 5, 27, 4, 'This course was not very fun. I would certainly no'),
(358, 5, 16, 5, 'This course was chill. I would definitely not reco'),
(359, 6, 33, 5, 'This course was so post-modern. I would not be wri'),
(360, 6, 18, 5, 'This course was the reason I woke up in the mornin'),
(361, 5, 15, 5, 'This course was chill. I would absolutely have dro'),
(362, 5, 19, 5, 'This course was fascinating. I would completely ma'),
(363, 6, 9, 4, 'This course was stupid. I would definitely recomme'),
(364, 6, 35, 4, 'This course was so post-modern. I would definitely'),
(365, 6, 35, 4, 'This course was not very fun. I would absolutely t'),
(366, 6, 7, 5, 'This course was not very useful. I would certainly'),
(367, 5, 31, 4, 'This course was not very fun. I would certainly no'),
(368, 6, 6, 5, 'This course was chill. I would definitely not reco'),
(369, 5, 4, 4, 'This course was so post-modern. I would not be wri'),
(370, 6, 20, 4, 'This course was the reason I woke up in the mornin'),
(371, 5, 15, 5, 'This course was chill. I would absolutely have dro'),
(372, 5, 5, 5, 'This course was fascinating. I would completely ma'),
(373, 5, 13, 4, 'This course was stupid. I would definitely recomme'),
(374, 5, 5, 5, 'This course was so post-modern. I would definitely'),
(375, 5, 32, 5, 'This course was not very fun. I would absolutely t'),
(376, 5, 27, 4, 'This course was not very useful. I would certainly'),
(377, 5, 4, 5, 'This course was not very fun. I would certainly no'),
(378, 6, 26, 5, 'This course was chill. I would definitely not reco'),
(379, 6, 25, 5, 'This course was so post-modern. I would not be wri'),
(380, 6, 33, 5, 'This course was the reason I woke up in the mornin'),
(381, 6, 35, 5, 'This course was chill. I would absolutely have dro'),
(382, 6, 17, 5, 'This course was fascinating. I would completely ma'),
(383, 6, 17, 5, 'This course was stupid. I would definitely recomme'),
(384, 5, 29, 5, 'This course was so post-modern. I would definitely'),
(385, 6, 6, 4, 'This course was not very fun. I would absolutely t'),
(386, 6, 17, 5, 'This course was not very useful. I would certainly'),
(387, 5, 18, 5, 'This course was not very fun. I would certainly no'),
(388, 6, 34, 5, 'This course was chill. I would definitely not reco'),
(389, 6, 18, 4, 'This course was so post-modern. I would not be wri'),
(390, 6, 27, 4, 'This course was the reason I woke up in the mornin'),
(391, 6, 25, 5, 'This course was chill. I would absolutely have dro'),
(392, 6, 9, 5, 'This course was fascinating. I would completely ma'),
(393, 6, 13, 4, 'This course was stupid. I would definitely recomme'),
(394, 5, 26, 4, 'This course was so post-modern. I would definitely'),
(395, 5, 34, 4, 'This course was not very fun. I would absolutely t'),
(396, 6, 34, 5, 'This course was not very useful. I would certainly'),
(397, 5, 21, 5, 'This course was not very fun. I would certainly no'),
(398, 6, 26, 4, 'This course was chill. I would definitely not reco'),
(399, 6, 17, 4, 'This course was so post-modern. I would not be wri'),
(400, 6, 22, 4, 'This course was the reason I woke up in the mornin'),
(401, 6, 5, 4, 'This course was chill. I would absolutely have dro'),
(402, 5, 27, 5, 'This course was fascinating. I would completely ma'),
(403, 5, 2, 5, 'This course was stupid. I would definitely recomme'),
(404, 5, 14, 4, 'This course was so post-modern. I would definitely'),
(405, 5, 35, 5, 'This course was not very fun. I would absolutely t'),
(406, 6, 19, 4, 'This course was not very useful. I would certainly'),
(407, 5, 29, 5, 'This course was not very fun. I would certainly no'),
(408, 6, 30, 4, 'This course was chill. I would definitely not reco'),
(409, 6, 23, 4, 'This course was so post-modern. I would not be wri'),
(410, 6, 34, 5, 'This course was the reason I woke up in the mornin'),
(411, 6, 28, 5, 'This course was chill. I would absolutely have dro'),
(412, 6, 12, 5, 'This course was fascinating. I would completely ma'),
(413, 6, 6, 4, 'This course was stupid. I would definitely recomme'),
(414, 6, 11, 5, 'This course was so post-modern. I would definitely'),
(415, 5, 28, 4, 'This course was not very fun. I would absolutely t'),
(416, 6, 10, 4, 'This course was not very useful. I would certainly'),
(417, 5, 21, 5, 'This course was not very fun. I would certainly no'),
(418, 6, 21, 4, 'This course was chill. I would definitely not reco'),
(419, 5, 25, 5, 'This course was so post-modern. I would not be wri'),
(420, 5, 28, 5, 'This course was the reason I woke up in the mornin'),
(421, 6, 9, 4, 'This course was chill. I would absolutely have dro'),
(422, 5, 30, 4, 'This course was fascinating. I would completely ma'),
(423, 6, 21, 4, 'This course was stupid. I would definitely recomme'),
(424, 6, 3, 5, 'This course was so post-modern. I would definitely'),
(425, 6, 15, 4, 'This course was not very fun. I would absolutely t'),
(426, 6, 9, 4, 'This course was not very useful. I would certainly'),
(427, 6, 28, 5, 'This course was not very fun. I would certainly no'),
(428, 5, 12, 5, 'This course was chill. I would definitely not reco'),
(429, 6, 26, 4, 'This course was so post-modern. I would not be wri'),
(430, 6, 11, 4, 'This course was the reason I woke up in the mornin'),
(431, 5, 13, 4, 'This course was chill. I would absolutely have dro'),
(432, 6, 7, 5, 'This course was fascinating. I would completely ma'),
(433, 5, 23, 4, 'This course was stupid. I would definitely recomme'),
(434, 5, 28, 4, 'This course was so post-modern. I would definitely'),
(435, 6, 32, 4, 'This course was not very fun. I would absolutely t'),
(436, 6, 3, 5, 'This course was not very useful. I would certainly'),
(437, 5, 34, 4, 'This course was not very fun. I would certainly no'),
(438, 6, 24, 4, 'This course was chill. I would definitely not reco'),
(439, 6, 30, 5, 'This course was so post-modern. I would not be wri'),
(440, 6, 1, 5, 'This course was the reason I woke up in the mornin'),
(441, 5, 19, 4, 'This course was chill. I would absolutely have dro'),
(442, 5, 23, 4, 'This course was fascinating. I would completely ma'),
(443, 6, 7, 4, 'This course was stupid. I would definitely recomme'),
(444, 5, 30, 5, 'This course was so post-modern. I would definitely'),
(445, 6, 12, 4, 'This course was not very fun. I would absolutely t'),
(446, 5, 35, 5, 'This course was not very useful. I would certainly'),
(447, 6, 32, 4, 'This course was not very fun. I would certainly no'),
(448, 6, 34, 5, 'This course was chill. I would definitely not reco'),
(449, 6, 12, 5, 'This course was so post-modern. I would not be wri'),
(450, 5, 23, 5, 'This course was the reason I woke up in the mornin'),
(451, 5, 3, 5, 'This course was chill. I would absolutely have dro'),
(452, 5, 24, 5, 'This course was fascinating. I would completely ma'),
(453, 6, 23, 5, 'This course was stupid. I would definitely recomme'),
(454, 6, 26, 5, 'This course was so post-modern. I would definitely'),
(455, 6, 7, 4, 'This course was not very fun. I would absolutely t'),
(456, 6, 23, 4, 'This course was not very useful. I would certainly'),
(457, 5, 18, 5, 'This course was not very fun. I would certainly no'),
(458, 5, 2, 4, 'This course was chill. I would definitely not reco'),
(459, 6, 18, 5, 'This course was so post-modern. I would not be wri'),
(460, 6, 34, 5, 'This course was the reason I woke up in the mornin'),
(461, 5, 31, 5, 'This course was chill. I would absolutely have dro'),
(462, 6, 10, 5, 'This course was fascinating. I would completely ma'),
(463, 5, 35, 4, 'This course was stupid. I would definitely recomme'),
(464, 6, 32, 5, 'This course was so post-modern. I would definitely'),
(465, 5, 5, 4, 'This course was not very fun. I would absolutely t'),
(466, 6, 11, 4, 'This course was not very useful. I would certainly'),
(467, 6, 7, 4, 'This course was not very fun. I would certainly no'),
(468, 5, 35, 4, 'This course was chill. I would definitely not reco'),
(469, 5, 30, 4, 'This course was so post-modern. I would not be wri'),
(470, 6, 16, 5, 'This course was the reason I woke up in the mornin'),
(471, 6, 3, 5, 'This course was chill. I would absolutely have dro'),
(472, 6, 8, 5, 'This course was fascinating. I would completely ma'),
(473, 6, 25, 5, 'This course was stupid. I would definitely recomme'),
(474, 6, 27, 4, 'This course was so post-modern. I would definitely'),
(475, 6, 19, 5, 'This course was not very fun. I would absolutely t'),
(476, 6, 35, 5, 'This course was not very useful. I would certainly'),
(477, 6, 15, 5, 'This course was not very fun. I would certainly no'),
(478, 6, 5, 4, 'This course was chill. I would definitely not reco'),
(479, 6, 29, 5, 'This course was so post-modern. I would not be wri'),
(480, 5, 21, 5, 'This course was the reason I woke up in the mornin'),
(481, 5, 21, 5, 'This course was chill. I would absolutely have dro'),
(482, 5, 22, 4, 'This course was fascinating. I would completely ma'),
(483, 5, 31, 4, 'This course was stupid. I would definitely recomme'),
(484, 5, 12, 5, 'This course was so post-modern. I would definitely'),
(485, 5, 19, 4, 'This course was not very fun. I would absolutely t'),
(486, 6, 35, 4, 'This course was not very useful. I would certainly'),
(487, 5, 2, 5, 'This course was not very fun. I would certainly no'),
(488, 6, 28, 5, 'This course was chill. I would definitely not reco'),
(489, 5, 22, 5, 'This course was so post-modern. I would not be wri'),
(490, 6, 26, 5, 'This course was the reason I woke up in the mornin'),
(491, 6, 27, 5, 'This course was chill. I would absolutely have dro'),
(492, 5, 1, 4, 'This course was fascinating. I would completely ma'),
(493, 6, 19, 5, 'This course was stupid. I would definitely recomme'),
(494, 6, 34, 4, 'This course was so post-modern. I would definitely'),
(495, 6, 25, 4, 'This course was not very fun. I would absolutely t'),
(496, 5, 18, 4, 'This course was not very useful. I would certainly'),
(497, 5, 8, 4, 'This course was not very fun. I would certainly no'),
(498, 6, 26, 5, 'This course was chill. I would definitely not reco'),
(499, 6, 20, 5, 'This course was so post-modern. I would not be wri');

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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tokens`
--

CREATE TABLE `tokens` (
  `UserID` int(11) DEFAULT NULL,
  `Token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tokens`
--

INSERT INTO `tokens` (`UserID`, `Token`) VALUES
(1, 'ac5642f52950fe5b9fc38dad3fdeeabf'),
(2, '04f88e8dac6d0b49f75540a2d75dee78'),
(3, 'cf867a3c203a6021a37190c354bc4157'),
(4, 'be3bd7addea2318c7c3460fc2d51465d'),
(5, '7f5efcc42526e9adeb38884bb251d419');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(10) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Permission` int(6) DEFAULT NULL,
  `Verification` int(6) DEFAULT NULL,
  `isLocked` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `Email`, `Password`, `UserName`, `Permission`, `Verification`, `isLocked`) VALUES
(0, 'anhkhoatranle30@gmail.com', '$2a$07$Iuq9U9hLly8xb7sR3B5o5.t2IqrhJ/BCDwOlaAXsnLEjrcceXWfXC', 'admin', 2, 1, 0),
(1, 'test@gmail.com', '$2a$07$JgdV9dkD1OCwxqYNUuuimObOSReFRreIzm2LJFcFdjf5SGy4TucNq', 'India Adkins', 0, 1, 0),
(2, 'anhkhoatran330@gmail.com', '$2a$07$dwQShdhTtqQB.IP/HDBk4O3R0cHbQIDuA6YXXQuFs7SCCVRj7.Tsu', 'Laith Woodcock', 0, 1, 0),
(3, 'test_user3@gmail.com', '1', 'Jad Dominguez', 0, 1, 0),
(4, 'hoanglecturer@gmail.com', '$2a$07$TEjN86NYvv5dLqE4ZNVE6uwf1naJohSyOekfvlp7fzsCXyy.koOWG', 'Stephen Grider', 1, 1, 0),
(5, 'test_user5@gmail.com', '1', 'Kara Horne', 0, 1, 0),
(6, 'test_user6@gmail.com', '1', 'Aliza Smith', 0, 1, 1),
(7, 'test_lecturer7@gmail.com', '1', 'Paulo Dichone', 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `watched_lecture`
--

CREATE TABLE `watched_lecture` (
  `UserID` int(10) NOT NULL,
  `CourseID` int(10) NOT NULL,
  `CurrentLecture` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `UserID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
ALTER TABLE `course` ADD FULLTEXT KEY `CourseName` (`CourseName`);

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
-- Chỉ mục cho bảng `joincourse`
--
ALTER TABLE `joincourse`
  ADD PRIMARY KEY (`UserID`,`CourseID`);

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
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`);

--
-- Chỉ mục cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`SubcategoryID`);
ALTER TABLE `subcategory` ADD FULLTEXT KEY `SubcategoryName` (`SubcategoryName`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

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
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT cho bảng `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `SubcategoryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
