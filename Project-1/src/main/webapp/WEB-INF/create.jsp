<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>New Recipe</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-expand-md navbar-light" style="background-color: #00B3B3;" >
  <div class="container-fluid">
    <a class="navbar-brand" >New Recipe</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link" href="/chef">Home</a>
        <a class="nav-link" href="/cookbook">CookBook</a>
        <a class="nav-link" href="/logout">Logout</a>
      </div>
    </div>
  </div>
</nav>

<body id="body-4">

	<div class="container" id="bg">
        <h1>New Course</h1>
        	 <form:form method="POST" action="/createrecipe" modelAttribute="newRecipe">
        	
	        <p>
	            <form:label path="rname">Recipe Name:</form:label>
	            <form:input type="text" path="rname"/>
	            <form:errors path="rname"/>
	            
	        </p>
	        <p>
	            <form:label path="description">Description:</form:label>
	            <form:textarea path="description"/>
	            <form:errors path="description"/>
	        </p>
	        <form:hidden path="chef" value="${user_id}"/>
	        <input type="submit" value="Create" />
	        </form:form>
        </div>
        
</body>
</html>