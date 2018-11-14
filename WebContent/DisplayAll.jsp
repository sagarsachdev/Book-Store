<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page errorPage="error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="style1.css">
</head>
<body>
<c:if test="${requestScope.message !=null}">
	NOTE : ${message}
</c:if>
<c:if test="${requestScope.usrList !=null and
 not empty requestScope.usrList}">
<div class="wrapper" style="background-image: url('images/bg-registration-form-2.jpg');">
<div class="inner" style="background-image: url('images/bg-registration-form-2.jpg');">
	<h4 align="center"><a href="Home.jsp">Home</a></h4>
 <h1 align="center">All Users</h1><br>
<table align="center" border="4" cellpadding="3">
	<tr>
		<td>User Name</td>
		<td>Email</td>
		<td>Mobile Number</td>
		<td>Gender</td>
		<td>City</td>
		<td>Password</td>
		<td>Balance</td>
	</tr>
	<c:forEach items="${requestScope.usrList}" var="e"> 		
	<tr>
		<td>${e.uname}</td>
		<td>${e.email}</td>
		<td>${e.number}</td>
		<td>${e.gender}</td>
		<td>${e.city}</td>
		<td>${e.pass}</td>
		<td>${e.balance}</td>
	</tr>
	</c:forEach>
</table>
</c:if>
 </div>
</div>
<%--
<table border="1" cellpadding="3">
<tr>
		<td>User Name</td>
		<td>Email</td>
		<td>Mobile Number</td>
		<td>Gender</td>
		<td>City</td>
		<td>Password</td>
		<td>Balance</td>
</tr>
<%
Object o=request.getAttribute("usrList");
List l=(List)o;
	Iterator<User> itr=l.iterator();
	while(itr.hasNext())
	{
		User r=itr.next();%>
		<tr>
		<td><% r.getUname(); %></td>
		<td><% r.getEmail(); %></td>
		<td><% r.getNumber(); %></td>
		<td><% r.getGender(); %></td>
		<td><% r.getCity(); %></td>
		<td><% r.getPass(); %></td>
		<td><% r.getBalance(); %></td>
		</tr>
		</table>
		<%
	}
%>
 --%>
</body>
</html>