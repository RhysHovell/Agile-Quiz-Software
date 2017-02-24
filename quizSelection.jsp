<%-- 
    Document   : quizSelction
    Created on : 21-Feb-2017, 16:12:52
    Author     : Adam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
       <nav class="navbar navbar-inverse">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="#">QuizzyBoy</a>
              </div>
              <ul class="nav navbar-nav">
                <li class="nav"><a href="createQuiz.jsp">Create A Quiz</a></li>
                <li class="nav"><a href="quizSelection.jsp">Select A Quiz</a></li>
                <li class="nav"><a href="staffLogin.jsp">Staff Login</a></li>
                <li class="nav"><a href="studentLogin.jsp">Student Login</a></li>
                <li class="nav"><a href="startScreen.jsp">Start Screen</a></li>
                <li class="nav"><a href="student.jsp">Student</a></li>
                <li class="nav"><a href="index.jsp">Home</a></li>
              </ul>
            </div>
       </nav>
        
                <div class = "container">
               <h2>Search For A Module To See Related Quizzes</h2>
                       <form name="moduleform" form method ="POST" action ="CreateQuiz" onsubmit="return validateModule()">
                            <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                            <input id = "question" type="text"  name="module" class ="form-control" placeholder="Enter Module Here">
                            </div>
                            <button class="btn btn-lg btn-primary btn-block" type="submit" name="module">Confirm</button>
                            <p id = "module"></p>
                            </form>
        </div>
        </div>
    </body>
</html>
