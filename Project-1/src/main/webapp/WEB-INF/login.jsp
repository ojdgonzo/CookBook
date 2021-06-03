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
    <link rel="stylesheet" href="/css/login.css" />
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
                            
                            
                             <h2 style="color: #00B3B3;">Login</h2>
					        	<p class="errors"><c:out value="${error}" /></p>
				        			<form method="post" action="/loggingon">
                                
                    <!-- email -->
                    <div class="form-floating mb-3">
                        <label for="email">Email</label>
				        <input type="text" id="email" name="email" class="form-control" id="floatingInput"/>
                    </div>
                
                    <!-- password -->
                    <div class="form-floating">
                        <label for="password">Password</label>
				        <input type="password" id="password" name="password" class="form-control" id="floatingPassword" />
                    </div>
                    <br>
                          <button name="login" type="submit" class="btn btn-primary btn-md">Login</button>
                            </form>
                            <br>
                            <br>
                            <h6><a href="/register">New User?</a></h6>
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
































