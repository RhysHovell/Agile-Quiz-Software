<%-- 
    Document   : staffLogin
    Created on : 21-Feb-2017, 16:14:27
    Author     : Adam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <meta charset = "utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <link href ="CSS/signin.css" rel ="stylesheet">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        
        <script>

            function validateLogin()
            {
                document.getElementById("output").innerHTML = "";

                var staffid = document.forms["loginform"]["staffid"].value;
                var password = document.forms["loginform"]["password"].value;
                if (staffid == ""){
                    document.getElementById("output").innerHTML = "Staff ID is blank";
                    return false;
                }
                else
                {
                    return true;
                }
                if (password) == ""){
                    document.getElementById("output").innerHTML = "Password is blank";
                    return false;
                }
                else
                {
                    return true;
                }

            }
        </script>
        
        <title>JSP Page</title>
    </head>
        <nav>
            <ul>
                <li class="nav"><a href="createQuiz.jsp">Create A Quiz</a></li>
                <li class="nav"><a href="quizSelection.jsp">Select A Quiz</a></li>
                <li class="nav"><a href="staffLogin.jsp">Staff Login</a></li>
                <li class="nav"><a href="studentLogin.jsp">Student Login</a></li>
                <li class="nav"><a href="startScreen.jsp">Start Screen</a></li>
                <li class="nav"><a href="student.jsp">Student</a></li>
            </ul>
        </nav>
    <body>
        <div class = "container">
            <form method = "POST" action ="Login" class = "signin"name ="loginform" onsubmit="return validateLogin()">
                <h2 class = "signin-heading">Staff Member Login</h2>
                <input type="text" name="staffid" id="staffID" class="form-control" placeholder="Staff ID" required="" autofocus="">
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                <p id ="output"></p>
            </form>
        </div>
    </body>
</html>
