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
		<h1>Welcome to the Dashboard <c:out value="${loggedInUser.userName}"/> </h1>
		<a href="/books/new">Add to my shelf</a>
		<a href="/users/logout">logout</a>
		<h1>All Books from Database</h1>
		
		<table class="table table-dark">
		  <thead>
		    <tr>
		      <th scope="col">id</th>
		      <th scope="col">Title</th>
		      <th scope="col">Author</th>
		      <th scope="col">My thoughts</th>
		      <th scope="col">Posted by</th>
		    
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${allBooks}" var="book">
		    <tr>
					<td>${book.id}</td>
					<td><a href="/books/display/${book.id}">${book.title}</a></td>
					<td>${book.author}</td>
					<td>${book.thoughts}</td>
					<td>${book.user.userName}</td>	
		    </tr>
			</c:forEach>
		  </tbody>
		</table>

	 <h2>All Users</h2>
	<table class="table table-dark">
	  <thead>
	    <tr>
	      <th scope="col">id</th>
	      <th scope="col">User Name</th>
	      <th scope="col">Email</th>
	      <th scope="col">Total Books</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach items="${allUsers}" var="user">
	    <tr>
				<td>${user.id}</td>
				<td>${user.userName}</td>
				<td>${user.email}</td>
				<td>${user.books.size()}</td>
	    </tr>
		</c:forEach>
	  </tbody>
	</table> 
</body>
</html> 