<%-- 
    Document   : studentLoginError
    Created on : 24-Feb-2017, 21:05:24
    Author     : petersallai
--%>

<%@page import="AgileQuiz.stores.LoggedIn"%>
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
                    document.getElementById("output").innerHTML = "Student ID is blank";
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
    
        <div class = "container">
            <form method="POST" action="StudentLogin" class = "signin">
                <h2 class = "signin-heading">Student Login</h2>
                <input type="text" name="studentid" id="matricNo" class="form-control" placeholder="Student ID" required="" autofocus="">
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                <p id ="output"></p>
                <p style="color:red;">username or password is wrong, try again</p>
            </form>
        </div>
    </body>
</html>
