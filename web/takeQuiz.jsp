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
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            List<List<String>> quiz = (List<List<String>>) session.getAttribute("quiz");
            List<String> correctAnswers = new ArrayList<>();
            
            //Extract correct answers into separate array
            for(int i =0; i<quiz.size(); i++){
                String correctAnswer = quiz.get(i).get(1).toString();
                correctAnswers.add(correctAnswer);
            }
            
            if (quiz == null) {
        %>
        <p> Quiz failed to load </p>
        <%  } else {
        %>
        <form name="quiz" method="Post" action="SubmitQuiz"> 
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
        <input type="hidden" id="ansArray" name="ansArray" value="TEST"> 
        <button class="btn btn-lg btn-primary btn-block" onclick="return calculateQuiz();" type="submit"> Submit Quiz </button>
        </form>
        
        <script>
            
            function calculateQuiz(){
                var studentAns = [];
                var amountCorrect = 0;
                var quizLength = <%=quiz.size()%>;
                
                var jsArray = [<% for (int i = 0; i < correctAnswers.size(); i++) { %>"<%= correctAnswers.get(i) %>"<%= i + 1 < correctAnswers.size() ? ",":"" %><% } %>];
                
                //loop every question and pass answer into array
                for(var i = 0; i <quizLength; i++) {
                  var radios = document.getElementsByName("b" + i);
                  
                  for(var j = 0; j < radios.length; j++) {
                    var radio = radios[j];
                    
                    if(radio.checked) {
                       //Add students answerID to array  
                        studentAns.push(radio.value);
                        
                        if(radio.value === jsArray[i]){
                            amountCorrect++;
                        }
                      
                    }
                    
                  }
                  
                }
                //calculate score and add quizlength, score(%) to answers array and return
                var finalscore = Math.round((amountCorrect/quizLength)*100);
                alert("Final score: " + finalscore + "%");
                
                studentAns.push(finalscore);
                
                var ans = JSON.stringify(studentAns);
                document.getElementById("ansArray").value = ans;
                
                
            }
            
        </script>
        
    </body>
</html>