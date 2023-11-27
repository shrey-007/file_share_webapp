<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Navbar</title>
    <style>
     body, html {
        height: 100%;
        margin: 0;
    }
    .animation-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .animation {
        width: 100%;
        height:auto;
    }
        .content{
         background-color:#4caf50;
         height:200px;
         border:2px solid black;
         color:#050505;
        }
    </style>
</head>

<body>
<%@include file="navbar.jsp"%>



<div class="animation-container">
        <video class="animation" autoplay loop muted>
            <source src="images/_import_61f228f0a5c801.56310378_preview.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>
    <br>
<br>
<br>




    <div class="content">
            <!-- Your content goes here -->
            <h1>Welcome to our website</h1>

            <p>As a student, we understand the myriad of challenges you face daily – from juggling assignments to
                                   keeping track of exam dates and navigating extracurricular commitments. Our student data organizer is
                                   your comprehensive solution, providing a centralized hub for all your academic information. Imagine a
                                   platform where your course schedules, assignment deadlines, exam dates, and project details are
                                   effortlessly accessible in one intuitive interface. But we go beyond that – our customizable dashboards
                                   adapt to your unique needs, ensuring a personalized experience tailored to your major or interests. Sync
                                   your academic calendar with our organizer for timely reminders, visualize your progress, and
                                   effortlessly collaborate on group projects with our tools. Security and privacy are paramount, assuring
                                   that your academic data remains confidential. Designed by students for students, [Website Name] is your
                                   key to simplifying student life. Join us, take control of your academic journey, and experience a new
                                   level of organization, efficiency, and success.</p>
        </div>



</body>

</html>
