<%-- 
    Document   : staffSelect
    Created on : 18-Mar-2017, 21:15:47
    Author     : Brodie
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="AgileQuiz.stores.LoggedIn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
            <%    
            HttpSession Session= request.getSession();
            LoggedIn logged = (LoggedIn) request.getSession().getAttribute("LoggedIn");
            if (logged==null)
            {
           %>
           <jsp:include page="navbar.jsp"/>
           
           <%
               }
            else if(logged.getStaffID()!=0) 
{
               %>
               <jsp:include page="staffnavbar.jsp"/>
               <%
                   }
                   else if (logged.getMatric()!=0)
                           {
                            
                   %>
                       <jsp:include page="studentnavbar.jsp"/>
                       <%
                           }
                           %>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Staff</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Modules</a></li>
                    <li><a href="#">Results</a></li>
                </ul>
            </div>
        </nav>
        <form method="POST" action="GetQuizzes" class = "signin">
            <h2 class = "signin-heading">Enter Module</h2>
            <input type="text" name="ModuleCode" id="ModuleCode" class="form-control" placeholder="Module Code" required="" autofocus="">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Search</button>
            <p id ="output"></p>
        </form>
       
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            List<List<String>> quizList = (List<List<String>>) session.getAttribute("quizList");
            if (quizList == null) {
        %>
        <h2> No Quizzes Available </h2>
        <%  } else {
            String x = "";
            String y = "";
        %>
        <div class ="container"> 
            <h2>Available Quizzes</h2>
        <%    for (int i = 0; i < quizList.get(0).size(); i++) {
                x = quizList.get(0).get(i).toString();
                y = quizList.get(1).get(i).toString();
                //String button_name= "button"+i; 
%>
      <!--  <p> QuizID: <%=x%>  </p>-->
        <h3> Quiz Name: <%=y%>  </h3>
         <form name="gotoedit" method="POST" action="ViewQuiz">
         
         <input type="hidden" name="chosen_id"  value="<%=x%>" >
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="selected_quiz" value="<%=y%>" >Edit This Quiz</button>
        <hr>
        </form>
        </div>
        <%
                }
            }
            session.removeAttribute("quizList");
        %>
       

        <%
        %>


    </body>
</html>