<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Title Here</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>


<nav class="navbar navbar-expand-md navbar-light" style="background-color: #00B3B3;" >
  <div class="container-fluid">
    <a class="navbar-brand">Cookbook</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link" href="/chef">Home</a>
        <a class="nav-link" href="/logout">Logout</a>
        
      </div>
    </div>
  </div>
</nav>


<body id="body-2">

	
	 <div class="container" id="bg">
        	<h1>Check Out these Recipes!!</h1>
		<table class="table table-striped table-success table-hover ">
			<thead>
				<tr>
			    	<th scope="col">Recipe</th>
			      	<th scope="col">Not sure?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${recipes}" var="r">
				<tr>
				    <td><a href="/recipe/${r.id}"><c:out value="${r.rname}"/></a></td>
				    <td>stuff</td>
				 </tr>
				 </c:forEach>
			 </tbody>
		</table>
		<form action="/testkitchen" method="GET"> 
		<input type="submit" value="Cook up a New Recipe" />
		</form>
        </div>
        </div>

        
<footer id="bottom">
	<div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from 
	<a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
</footer>

</body>
</html>