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
  
  <div class ="container">
        <h2>Edit Your Quiz here</h2>
        
             
             <h2>Change This Quiz's Module</h2>
                       <form name="moduleform" form method ="POST" action ="ChangeModule" ">
                            <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                            <input id = "question" type="text"  name="module" class ="form-control" placeholder="Enter New Module Here">
                            </div>
                           <br>
                           <button class="btn btn-lg btn-primary btn-block" type="submit" name="module">Update module</button>
                       </form>                
                     <hr>
                           
                           
                <h2>Change Your Quiz's Name</h2>
                
                            <form name="nameform" form method ="POST" action ="ChangeQuizName" ">
                                <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
                            <input id = "question" type="text"  name="quiz_name" class ="form-control" placeholder="Enter Quiz Name Here">
                            </div>
                <br>
                            <button class="btn btn-lg btn-primary btn-block" type="submit" name="module">Update name </button>
                            </form>
                            
                            <hr>
             
                         
        
        
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
                 <form name="questionedit" form method ="POST" action ="EditQuestion" >
  
                     
                     <input type="hidden" name="current_question" value="<%=question%>">
                     <input type="hidden" name="current_correct" value="<%=correct%>">
                     <input type="hidden" name="current2" value="<%=answer2%>">
                     <input type="hidden" name="current3" value="<%=answer3%>">
                     <input type="hidden" name="current4" value="<%=answer4%>">
                   
                                                        
                     
                     
                     <p> Question: <%=question%></p>
   <div class="input-group">
                  
                   <nbsp></nbsp>
                  <span class="input-group-addon"><i class="glyphicon glyphicon-question-sign"></i></span>
                  <input id = "question" type="text"  name="question_asked" class ="form-control" placeholder="Enter Question Edit Here">
  </div>
   <br>
  
    <p>  Correct Answer: <%=correct%></p>  
   <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-ok"role ="button"></i></span>
                <input id="answerOne" type="text" class="form-control" name="correct_answer" placeholder="Enter The Correct Answer Edit Here">
            </div>
            <br>
            
    <p> Second Answer: <%=answer2%></p>
    <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"role ="button"></i></span>
                <input id="answerTwo" type="text" class="form-control" name="answer_two" placeholder="Enter Answer Two Edit Here">
            </div>
            <br>
            
     <p> Third Answer: <%=answer3%></p>
     <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"role ="button"></i></span>
                <input id="answerThree" type="text" class="form-control" name="answer_three" placeholder="Enter Answer Three Edit Here">
            </div>
            <br>
     
     <p> Fourth Answer: <%=answer4%></p>
         <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-remove" role ="button"></i></span>
                <input id="answerFour" type="text" class="form-control" name="answer_four" placeholder="Enter Answer Four Edit Here">
            </div>
         <br>
         
         <button class="btn btn-lg btn-primary btn-block" type="submit" name="module">Update Question</button>
         <hr>
           
            </form>

       <%
        } 
%>
      <button class="btn btn-lg btn-primary btn-block" onclick="document.location.href='staffSelect.jsp';" name="stop">Finish Editing</button>

<%
}
     %>
  </div>
    </body>
     </html>
