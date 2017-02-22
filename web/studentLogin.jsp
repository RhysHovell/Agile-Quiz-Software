<%-- 
    Document   : studentLogin
    Created on : 21-Feb-2017, 16:34:03
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
        
        <title>JSP Page</title>
    </head>
        <nav>
        <ul>
                <li class="nav"><a href="makeQuiz.jsp">Create A Quiz</a></li>
                <li class="nav"><a href="quizSelection.jsp">Select A Quiz</a></li>
                <li class="nav"><a href="staffLogin.jsp">Staff Login</a></li>
                <li class="nav"><a href="studentLogin.jsp">Student Login</a></li>
                <li class="nav"><a href="startScreen.jsp">Start Screen</a></li>
                <li class="nav"><a href="student.jsp">Student</a></li>
                <li class="nav"><a href="index.jsp">Home</a></li>
        </ul>
            
    </nav>
    <body>
        <div class = "container">
            <form class = "signin">
                <h2 class = "signin-heading">Student Login</h2>
                <input type="staffid" id="staffID" class="form-control" placeholder="Staff ID" required="" autofocus="">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">

                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
    </body>
</html>