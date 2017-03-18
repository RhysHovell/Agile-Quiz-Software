<%-- 
    Document   : quizSelction
    Created on : 21-Feb-2017, 16:12:52
    Author     : Adam
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
            List<String> studentAnswers = new ArrayList<>();
            
            if (quiz == null) {
        %>
        <p> Quiz failed to load </p>
        <%  } else {
            int marker=0;
            for(int i=0; i<quiz.size(); i++){
                int q = 0;
                String Question = quiz.get(i).get(q);
                //display question
                %>
                <p><%=i%>. <%=Question%><p>
                <%
                for (int u=2; u<quiz.get(i).size(); u++){
                //display answer option
                String answer = quiz.get(i).get(u).toString();
                %>
                    <button type="button" class="b<%=i%>" value="<%=answer%>" onclick="answerchoice(this.value)"><%=answer%></button>    
                                        
                <%
                
                }
                

            }
         }
        %>
        <script type="text/javascript">
            var answercount = 0;
            var answerArr = [];
            
            function answerchoice(answer){
                var answerCount+1;
                arr.push(answer);          
                
                var elems = document.getElementsByClassName("b"+answerCount.toString());
                for (var i=0; i<elems.length; i++){
                    elems[i].disabled = true;
                }
            }
            
        </script>
        
    </body>
</html>