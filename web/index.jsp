<%-- 
    Document   : index
    Created on : 21-Feb-2017, 12:51:48
    Author     : gary-
--%>

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
    </body>
</html>
