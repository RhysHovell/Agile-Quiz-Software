<%-- 
    Document   : StudentResults
    Created on : 20-Mar-2017, 18:15:59
    Author     : adammanion
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="AgileQuiz.stores.LoggedIn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

   <jsp:include page="navbar.jsp"/>
    <body>
        
         <form method="POST" action="StaffResults" class = "signin">
            <h2 class = "signin-heading">Enter Students Matriculation number</h2>
            <input type="text" name="MatricNo" id="MatricNo" class="form-control" placeholder="MatricNo" required="" autofocus="">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Search</button>
            <p id ="output"></p>
        </form>
        
          <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

            List<List<Integer>> results = (List<List<Integer>>) session.getAttribute("resultList");

            if (results == null) {
        %>
        <p> No Results Available </p>
        <%  } else {


            Integer quizID = null;
            Integer score = null;
            Integer questionNo = null;
            Integer studentAnswer = null;
            Integer answerID = null;

        %>
        <p> Available Results: </p>
        <%      quizID = results.get(0).get(0);
                score = results.get(1).get(0);%>
        <p> Quiz ID: <%=quizID%>  </p>
        <p> Score: <%=score%>  </p>
        <% for (int i = 0; i < results.get(0).size(); i++) {
                quizID = results.get(0).get(i);
                score = results.get(1).get(i);
                questionNo = results.get(2).get(i);
                studentAnswer = results.get(3).get(i);
                answerID = results.get(4).get(i);
        %>
        <p> Question: <%=questionNo%>  </p>
        <p> Student's Answer: <%=studentAnswer%>  Correct Answer: <%=answerID%></p>
       
        <p> </p>
        <%

                }
            }
            session.removeAttribute("resultList");


        %>

        
        
    </body>
</html>
