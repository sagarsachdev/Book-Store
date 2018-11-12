<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<style type="text/css">
		body {
		height: 100%;
	}
	</style>
</head>
<body>
<div class="bg" style="padding-left: 220px;">
<c:if test="${requestScope.message !=null}">
	NOTE : ${message}
</c:if>
<c:if test="${requestScope.usrList !=null and
 not empty requestScope.usrList}">
 <h1 style="padding-left: 300px;">All Users</h1><br>
<table border="4" cellpadding="3">
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
</table></c:if>

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
</div>
</body>
</html>