<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create New Scholar</title>
	
	<link rel="stylesheet" href="../css/style.css" >
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${scholar != null}">
				Edit Scholar
			</c:if>
			<c:if test="${scholar == null}">
				Create New Scholar
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${scholar != null}">
			<form action="update_scholar" method="post" id="scholarForm">
			<input type="hidden" name="scholarId" value="${scholar.scholarId}">
		</c:if>
		<c:if test="${scholar == null}">
			<form action="create_scholar" method="post" id="scholarForm">
		</c:if>
		
		<table class="form">
			<tr>
				<td align="right">E-mail:</td>
				<td align="left"><input type="text" id="email" name="email" size="45" value="${scholar.email}" /></td>
			</tr>
			<tr>
				<td align="right">Full Name:</td>
				<td align="left"><input type="text" id="fullname" name="fullname" size="45" value="${scholar.fullname}" /></td>
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" id="password" name="password" size="45" value="${scholar.password}" /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password:</td>
				<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="45" value="${scholar.password}" /></td>
			</tr>			
			<tr>
				<td align="right">Phone Number:</td>
				<td align="left"><input type="text" id="phone" name="phone" size="45" value="${scholar.phone}" /></td>
			</tr>
			<tr>
				<td align="right">Address:</td>
				<td align="left"><input type="text" id="address" name="address" size="45" value="${scholar.address}" /></td>
			</tr>
			<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" id="city" name="city" size="45" value="${scholar.city}" /></td>
			</tr>
			<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" id="zipcode" name="zipcode" size="45" value="${scholar.zipcode}" /></td>
			</tr>
			<tr>
				<td align="right">Country:</td>
				<td align="left"><input type="text" id="country" name="country" size="45" value="${scholar.country}" /></td>
			</tr>																
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>				
		</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#scholarForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				fullname: "required",
				
				<c:if test="${scholar == null}">
				password: "required",
				</c:if>
				
				confirmPassword: {
					<c:if test="${scholar == null}">
					required: true,
					</c:if>
					equalTo: "#password"
				},
				
				phone: "required",								
				address: "required",
				city: "required",
				zipcode: "required",
				country: "required",
			},
			
			messages: {
				email: {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address"
				},
				
				fullname: "Please enter full name",
				
				<c:if test="${scholar == null}">
				password: "Please enter password",
				</c:if>
				
				confirmPassword: {
					<c:if test="${scholar == null}">
					required: "Please confirm password",
					</c:if>
					equalTo: "Confirm password does not match password"
				},
				
				phone: "Please enter phone number",								
				address: "Please enter address",
				city: "Please enter city",
				zipcode: "Please enter zip code",
				country: "Please enter country",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});	
</script>
</html>