<%-- 
    Document   : navbar.jsp
    Created on : 18-Mar-2017, 21:26:29
    Author     : Brodie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="#">QuizzyBoy</a>
              </div>
              <ul class="nav navbar-nav">
                <li class="nav"><a href="createQuiz.jsp">Create A Quiz</a></li>
              <!--  <li class="nav"><a href="takeQuiz">Select A Quiz</a></li>-->
                <li class="nav"><a href="staffLogin.jsp">Staff Login</a></li>
                <li class="nav"><a href="studentLogin.jsp">Student Login</a></li>
                <li class="nav"><a href="startScreen.jsp">Start Screen</a></li>
                <li class="nav"><a href="studentSelect.jsp">Student Quiz Select</a></li>
                  <li class="nav"><a href="staffSelect.jsp">Staff Quiz Select</a></li>
                <li class="nav"><a href="index.jsp">Home</a></li>
              </ul>
            </div>
          </nav>
</html>
