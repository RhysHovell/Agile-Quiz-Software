<%-- 
    Document   : editQuiz
    Created on : 19-Mar-2017, 00:27:07
    Author     : Brodie
--%>


<%@page import="java.util.ArrayList"%>
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
  <jsp:include page="navbar.jsp"/>
  
      <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

            List<List<String>> quiz = (List<List<String>>) session.getAttribute("quiz");
    
            
            if (quiz == null) {
                
                
            
        %>
        <p>No Questions in this Quiz</p>
        <% }
        
            else{
                  String question="";
                    String correct="";
                    String answer2="";
                    String answer3="";
                    String answer4="";
                    
for (int i=0; i < quiz.size(); i++) {

         
            question = quiz.get(i).get(0);
            correct = quiz.get(i).get(1);
            answer2 = quiz.get(i).get(3);
            answer3 = quiz.get(i).get(4);
            answer4 = quiz.get(i).get(5);
             
  %>
  
  <p> Question:<%=question%></p>
   <p> Correct Answer:<%=correct%></p>
    <p> Second Answer:<%=answer2%></p>
     <p> Third Answer:<%=answer3%></p>
     <p> Fourth Answer:<%=answer4%></p>
       <p> </p>
    
       <%
        } 
}
     %>
   
    </body>
     </html>
