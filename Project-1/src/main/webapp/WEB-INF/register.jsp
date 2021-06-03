<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Title Here</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <script type="text/javascript" src="js/login.js"></script>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body id="morph">
        
      <section id="cover" class="min-vh-100">
        <div id="cover-caption">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4">
                        
                        <div id="registerbg">
                        <div class="px-2">
                            <div class="justify-content-center">
                                <h2 style="color: #00B3B3;">Registration</h2>

                                <!-- error messages -->
                               
                    <form:form method="POST" action="/registration" modelAttribute="userObj" >
                                        
                    <!-- email -->
                    <p class="form-floating">
                        <form:label path="email">Email: </form:label>
	        			<form:input type="text" path="email" class="form-control" id="floatingInput" />
	        			<form:errors path="email"/>
	        			
                    </p>

                    <!-- first name -->
                    <div class="form-floating">
                        <form:label path="username">Name: </form:label>
	        			<form:input type="text" path="username" class="form-control" id="floatingInput" />
	        			<form:errors path="username"/>
                    </div>
                
                    <!-- password -->
                    <div class="form-floating">
                        <form:label path="password">Password: </form:label>
	        			<form:input type="password" path="password"  class="form-control" id="floatingPassword" />
	        			<form:errors path="password"/>
	        			
                    </div>

                    <!-- confirm -->
                    <div class="form-floating">
                        <form:label path="passwordConfirmation">Confirm Password: </form:label>
	        			<form:password path="passwordConfirmation" class="form-control" id="floatingPassword" />
	        			<form:errors path="passwordConfirmation"/>
	        			
                    </div>
                    <br>
                    <input type="submit" class="btn btn-primary btn-md" value="Register" />
	        		</form:form>
                            <br>
                            <br>
                            <h6><a href="/login">Already a User?</a></h6>
                            <br>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
        

        
</body>
</html>










































