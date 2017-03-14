<%-- 
    Document   : quizSelction
    Created on : 21-Feb-2017, 16:12:52
    Author     : Adam
--%>

<%@page import="java.util.List"%>
<%@page import="AgileQuiz.stores.LoggedIn"%>
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
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

            List<List<String>> quiz = (List<List<String>>) session.getAttribute("quiz");
            List<String> questions = quiz.get(0);
            List<String> answers = quiz.get(1);
            
            if (quiz == null) {
        %>
        <p> Quiz failed to load </p>
        <%  } else {
            int marker=0;
            for(int i=0; i<questions.size(); i++){
                String Question = questions.get(i);
                //display question
                %>
                <p><%=i%>. <%=Question%><p>
                <%
                for (int u=marker; u<(marker+5); u++){
                //display answer option
                String answer = answers.get(u).toString();
                %>
                <p><%=u%>. <%=answer%><p>
                <%
                
                }
                marker +=5;

            }
         }
            
            

        %>
    </body>
</html>
