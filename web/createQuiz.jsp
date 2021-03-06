<%-- 
    Document   : makeQuiz
    Created on : 21-Feb-2017, 16:02:24
    Author     : Adam
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

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <script>
            function validateModule()
            {
                document.getElementById("module").innerHTML = "";

                var question = document.forms["moduleform"]["question_asked"].value;

                if (question == "")
                {
                    document.getElementById("question").innerHTML = "Question is Blank";
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
               <h2>Add a Quiz to which Module</h2>
                       <form name="moduleform" form method ="POST" action ="CreateQuiz" onsubmit="return validateModule()">
                            <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                            <input id = "question" type="text"  name="module" class ="form-control" placeholder="Enter Module Here">
                            </div>
 
                <h2>Enter Quiz Name</h2>
                <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
                            <input id = "question" type="text"  name="quiz_name" class ="form-control" placeholder="Enter Quiz Name Here">
                            </div>
                            <button class="btn btn-lg btn-primary btn-block" type="submit" name="module">Confirm</button>
                            <p id = "module"></p>
                            </form>
        </div>
                       
    </body>
</html>
