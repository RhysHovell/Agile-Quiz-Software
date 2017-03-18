<%-- 
    Document   : makeQuiz
    Created on : 21-Feb-2017, 16:02:24
    Author     : rhyshovell
--%>

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
                <script>
            function validateQuestion()
            {
                document.getElementById("question").innerHTML = "";

                var question = document.forms["questionform"]["question_asked"].value;

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
        <script>
            function showQuestions()
            {
                document.getElementById("question").style.display="block";
            }
    </script>
    

        
        <title>JSP Page</title>
    </head>
 
            
   

            
    <body>
               

     <jsp:include page="navbar.jsp"/>
        
             <!--  <h2>Add a Quiz to which Module</h2>
                       <form name="moduleform" form method ="POST" action ="Module" onsubmit="return validateModule()">
                            <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-question-sign"></i></span>
                            <input id = "question" type="text"  name="module" class ="form-control" placeholder="Enter Module Here">
                            <p id = "module"></p>
 
                            </form>
                       </div>-->
    <div class ="container">
        <h2>Create Question</h2>
        <form name="questionform" form method="POST" action="EditQuestion" onsubmit="return validateQuestion()">
        
            
             <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-question-sign"></i></span>
                <input id = "question" type="number"  name="question_number" class ="form-control" placeholder="Enter Question Number Here">
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-question-sign"></i></span>
                <input id = "question" type="text"  name="question_asked" class ="form-control" placeholder="Enter Question Here">
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-ok"role ="button"></i></span>
                <input id="answerOne" type="text" class="form-control" name="correct_answer" placeholder="Enter The Correct Answer Here">
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"role ="button"></i></span>
                <input id="answerTwo" type="text" class="form-control" name="answer_two" placeholder="Enter Answer Two Here">
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-remove"role ="button"></i></span>
                <input id="answerThree" type="text" class="form-control" name="answer_three" placeholder="Enter Answer Three Here">
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-remove" role ="button"></i></span>
                <input id="answerFour" type="text" class="form-control" name="answer_four" placeholder="Enter Answer Four Here">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" name="module">Update Question</button>
            <button class="btn btn-lg btn-primary btn-block" onclick="document.location.href='createQuiz.jsp';" name="stop">Finish Editing Question</button>
            <p id = "question"></p>
            </form>
        </div>
    </body>
</html>
