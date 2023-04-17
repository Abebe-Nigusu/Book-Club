<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/main.css"/>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<a href="/books">Back to the shelves</a>
		<h1>create a book</h1>
	    <form:form action="/books/process/new" modelAttribute="book" method="post">
	        <form:input type="hidden" path="user" value="${user_id}"/>
	        <div class="form-group">
	            <form:label path="title" > Title</form:label>
	            <form:input type="text" path="title" class="form-control"/>
	            <form:errors path="title" class="text-danger"/>
	        </div>
	        <div class="form-group">
	            <form:label path="author"> Author</form:label>
	            <form:input type="text" path="author"  class="form-control"/>
	            <form:errors path="author" class="text-danger"/>
	        </div>
	        <div class="form-group">
	            <form:label path="thoughts"  > My thoughts</form:label>
	            <form:input type="text" path="thoughts" class="form-control"/>
	            <form:errors path="thoughts" class="text-danger"/>
	        </div>
	        <input type="submit" value="Submit" class="btn btn-primary"/>
	        </form:form>
        </div>
</body>
</html>