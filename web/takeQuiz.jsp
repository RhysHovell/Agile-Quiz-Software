<%-- 
    Document   : quizSelction
    Created on : 21-Feb-2017, 16:12:52
    Author     : Adam
--%>

<%@page import="java.util.Collections"%>
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
            
            List<String> studentAnswers = new ArrayList<>();
            List<String> correctAnswers = new ArrayList<>();
            List<String> questions = new ArrayList<>();
            
            
            //Extract and randomize answers into separate array 
             for(int i =0; i> quiz.size(); i++){
                for( int y=2; y<6; y++){
                    String answer = quiz.get(i).get(y).toString();
                    questions.add(answer);
                }                 
            } 
            
            //Extract correct answers into separate array
            for(int i =0; i> quiz.size(); i++){
                String correctAnswer = quiz.get(i).get(1).toString();
                correctAnswers.add(correctAnswer);
            }
                        
                      
            
            if (quiz == null) {
        %>
        <p> Quiz failed to load </p>
        <%  } else {
        %>
        <form name="quiz" method="Post"> 
        <%
            for(int i=0; i<quiz.size(); i++){
                int q = 0;  //questions always held at position 0 in arraylist
                String Question = quiz.get(i).get(q);
                //display question
                %>
                <p><%=(i+1)%>. <%=Question%><p>
                <%
                    //Temp arraylist to store answers to questions & randomise order
                    List<String> options = new ArrayList<>();
                    for (int u=2; u<6; u++){
                        String answer = quiz.get(i).get(u).toString();
                        options.add(answer);
                    }
                    //Randomise question order
                    Collections.shuffle(options);
                    
                    for (int y=0; y<4; y++){
                        //display answers as radio button
                        String answer = options.get(y);
                        %>
                        <!--<button type="button" id="b<%=i%>" class="answerButton" value="<%=answer%>" onclick="myFunction()"><%=answer%></button> -->  
                        <input id="answer" name="b<%=i%>" value="<%=answer%>" type="radio"> <%=answer%> <br>                    
                        <%                                                
                    }

                    //clear options list for next question
                    options.clear();
                
            }
         }
        %>
        <br>
        <button class="btn btn-lg btn-primary btn-block" onclick="" type="submit"> Submit Quiz </button>
        </form>
        <script>
            var answercount = 0;
            var correctArr = [];
            var answerArr = [];
            
            function myFunction(){
                alert("click");
            }
            
            function answerchoice(){
            alert("buttonClick");
                var answerCount+1;
                answerArr.push(answer);          
                
                var elems = document.getElementsByClassName("b"+answerCount.toString());
                for (var i=0; i<elems.length; i++){
                    elems[i].disabled = true;
                }
            };
            
            function correctAnswers(){
                
            }
            
        </script>
        
    </body>
</html>