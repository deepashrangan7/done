
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!doctype html>

<html>

<head>
<title>GetMed</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style>
.flip-card {
	background-color: transparent;
	width: 300px;
	height: 200px;
	border: 1px solid #f1f1f1;
	perspective: 1000px;
	/* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
	position: relative;
	width: 100%;
	height: 100%;
	text-align: center;
	transition: transform 0.8s;
	transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
	transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
	position: absolute;
	width: 100%;
	height: 100%;
	-webkit-backface-visibility: hidden;
	/* Safari */
	backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
	background-color: white;
	color: black;
}

/* Style the back side */
.flip-card-back {
	background-color: gray;
	color: white;
	transform: rotateY(180deg);
}
</style>
</head>

<body style="background-color: white;">
	<div style="padding-bottom: 2em;">
		<nav class="navbar navbar-expand-lg navbar-light bg-dark"
			style="color: aliceblue;">
			<img src="logo2.png" alt="logo" width="5%" height="5%"> <a
				class="navbar-brand" href="#" style="color: white;">GetMed</a>
			<button style="color: white;" class="navbar-toggler bg-light"
				type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="/uhome"
						style="color: white;">Home <span class="sr-only">(current)</span></a>
					</li>

				</ul>
				<f:form class="form-inline my-2 my-lg-0" action="viewmedicine"
					method="post" modelAttribute="sb">

					<input class="form-control mr-sm-2" type="search"
						placeholder="Search " aria-label="Search" name="name">
					<div class="col-auto my-1">

						<select class="custom-select mr-sm-2" id="inlineFormCustomSelect"
							name="type">

							<option value="name" selected>Name</option>
							<option value="brand">Brand</option>
						</select>
					</div>
					<!-- 
					<div class="col-auto my-1">

						<f:select class="custom-select mr-sm-2"
							id="inlineFormCustomSelect" path="city" name="city">

							<f:option value="all" selected="true">All</f:option>
							<f:options items="${cities}" />
						</f:select>
					</div>
 -->
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search
						medicine</button>
				</f:form>
			</div>
		</nav>
	</div>
	<br />
	<br />

	<c:choose>
		<c:when test="${fn:length(cart) eq 0}">
			<h2 style="text-align: center">No Medicines In cart</h2>
			<h2 style="text-align: center"><a href="#" class="btn btn-outline-secondary btn-lg">Click Here to Buy Medicine</a></h2>
			
		</c:when>
		<c:otherwise>


			<form action="sort" method="post" >

<p style="float:right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<input type="submit" name="submit" value="sort" style="float:right;" class="btn btn-outline-secondary btn-md">


<div class="col-auto my-1" style="float: right;">


			<br />
			<br />
			<table class="table table-hover" style="padding-top: 5em;">

				<thead>
					<tr>

						<th scope="col">Medicine Name</th>
						<th scope="col">Brand</th>
						<th scope="col">Type</th>
						<th scope="col">Price per unit</th>
						
						<th scope="col">Quantity</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listofmedicine}" var="med">
						<tr>

							<th><c:out value="${med.name}" /></th>
							<td><c:out value="${med.brand}" /></td>
							<td><c:out value="${med.type}" /></td>
							<td><c:out value="${med.price}" /></td>
						
							<td>
							<a href="#"><img src="minus.png" alt="minus" width="2px" height="2px"></a>
								
									
									</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</c:otherwise>
	</c:choose>


</body>

</html>