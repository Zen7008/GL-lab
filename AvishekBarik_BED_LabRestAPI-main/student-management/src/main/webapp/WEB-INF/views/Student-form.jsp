<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Save Student Details</title>
</head>

<body>
	<div class="container">
		<div class="row" style="margin-top: 15px;">
			<div class="col-md-11">
				<h3>Student Management</h3>
			</div>
		</div>
		<hr>
		<p class="h4 mb-4">Add Student</p>
		<form class="form-horizontal"
			action="/StudentManagement/students/save" method="POST">

			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${Student.id}" />

			<div class="form-group">
				<label class="control-label col-sm-4" for="firstName">First
					Name:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="firstName"
						value="${Student.firstName}" placeholder="Enter First Name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="lastName">Last
					Name:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="lastName"
						value="${Student.lastName}" placeholder="Enter Last Name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="course">Course:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="course"
						value="${Student.course}" placeholder="Enter Course">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="country">Country:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="country"
						value="${Student.country}" placeholder="Enter Country">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-info">Save</button>
				</div>
			</div>
		</form>
		<hr>
		<a href="/StudentManagement/students/list">Back to Students List</a>
	</div>
</body>

</html>










