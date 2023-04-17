<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
	<a href="/books">Back to the shelves</a>
	<h3><c:out value="${book.title}"/></h3>
	<h1> <c:out value="${book.user.userName}"/>Read<c:out value="${book.title}"/> By <c:out value="${book.author}"/> </h1>
	<h3>Here are <c:out value="${book.user.userName}"/>thoughts:</h3>
	<h3> <c:out value="${book.thoughts}"/></h3>
	<a class="btn btn-outline-warning" href="/books/edit/${book.id}">Edit</a>
	<form action="/books/delete/${book.id}" method="post">
		<input type="hidden" name="_method" value="delete"/>
		<input type="submit" value="Delete" class="btn btn-outline-danger btn-dark"/>
	</form>
</body>
</html>