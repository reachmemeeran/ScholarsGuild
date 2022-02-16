<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scholar Profile - Guild</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div align="center">
		<br/>
		<h2>Welcome, ${loggedScholar.fullname}</h2>
		<br/>
	
	
		<table class="normal">
			<tr>
				<td><b>E-mail Address:</b></td>
				<td>${loggedScholar.email}</td>
			</tr>
			<tr>
				<td><b>Full Name:</b></td>
				<td>${loggedScholar.fullname}</td>
			</tr>
			<tr>
				<td><b>Phone Number:</b></td>
				<td>${loggedScholar.phone}</td>
			</tr>
			<tr>
				<td><b>Address:</b></td>
				<td>${loggedScholar.address}</td>
			</tr>
			<tr>
				<td><b>City:</b></td>
				<td>${loggedScholar.city}</td>
			</tr>
			<tr>
				<td><b>Zipcode:</b></td>
				<td>${loggedScholar.zipcode}</td>
			</tr>
			<tr>
				<td><b>Country:</b></td>
				<td>${loggedScholar.country}</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<b><a href="edit_profile">Edit My Profile</a></b>
				</td>
			</tr>
		</table>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
</html>