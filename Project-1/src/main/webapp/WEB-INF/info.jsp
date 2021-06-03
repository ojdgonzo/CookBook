<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>My Name a Chef</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

	<nav class="navbar navbar-expand-md navbar-light" style="background-color: #00B3B3;" >
  <div class="container-fluid">
    <a class="navbar-brand" >Let's Cook!!</a>
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
	
<body id="body-3">
        
        <div class="container" id="bg">
        <h1><c:out value="${recipes.rname}"/></h1>
        <div class="container-sm">
        	<p>Description: <c:out value="${recipes.description}"/>
        	</p>
        	<p> Created by: <c:out value="${recipes.chef.username}"/>
        	</p>
        </div>
        </div>
        	
 <footer id="bottom">
	<div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from 
	<a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
</footer>
</body>
</html>