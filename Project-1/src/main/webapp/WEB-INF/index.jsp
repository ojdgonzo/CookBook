<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Cookbook Name</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body id="morph">

	<div class="container" >
        	<div>
	        	<div>
	        	
	        		<h1>Register</h1>
	        		<form:form method="POST" action="/registration" modelAttribute="userObj">
	        		<p>
	        			<form:label path="username">Name: </form:label>
	        			<form:input type="text" path="username" />
	        			<form:errors path="username"/>
	        		</p>
	        		<p>
	        			<form:label path="email">Email: </form:label>
	        			<form:input type="text" path="email" />
	        			<form:errors path="email"/>
	        		</p>
	        		<p>
	        			<form:label path="password">Password: </form:label>
	        			<form:input type="password" path="password" />
	        			<form:errors path="password"/>
	        		</p>
	        		<p>
	        			<form:label path="passwordConfirmation">Confirm Password: </form:label>
	        			<form:password path="passwordConfirmation" />
	        			<form:errors path="passwordConfirmation"/>
	        		</p>
	        		<input type="submit" value="Register" />
	        		</form:form>
	        	</div>
	        	<div>
	        	<h1>Login</h1>
	        	<p><c:out value="${error}" /></p>
        			<form method="post" action="/login">
				        <p>
				            <label for="email">Email</label>
				            <input type="text" id="email" name="email"/>
				        </p>
				        <p>
				            <label for="password">Password</label>
				            <input type="password" id="password" name="password"/>
				        </p>
				        <input type="submit" value="Login!"/>
				    </form>
	        	</div>
        	</div>
        </div>
        
</body>
</html>