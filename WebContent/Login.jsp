<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<style type="text/css">
			table{
				border-radius: 30px;
			}
	</style>
</head>
<body>
	<div class="bg">
	<center><div class="col-md-6" style="float:left; padding-top: 125px; padding-bottom: 125px;">
	<form action="LoginServlet">
	<h5><a href="Home.jsp">Home</a></h5>
	<h1 style="color: white">Login Form</h1>
	<table style="text-align: center;">
			<tr>
				<th>User Name  <i class="far fa-user"></i> : </th>
				<td><input type="text" class="form-control form-rounded" name="uname" maxlength="20" placeholder="Enter User Name" autofocus="autofocus" required></td>
			</tr>
			<tr>
				<th>Password  <i class="fas fa-lock-open"></i> : </th>
				<td><input type="password" class="form-control form-rounded" name="pass" minlength="8" maxlength="20" placeholder="Enter Password" required></td>
			</tr>
	</table>
	<input type="submit" name="submit" class="btn btn-success" style="border-radius: 10px; box-shadow: 0px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<input type="reset" name="reset" class="btn btn-danger" style="border-radius: 10px; box-shadow: 0px;">
	</form>
	<h4>New Here? <a href="Register.jsp">Click Here!</a> to Register</h4>

</body>
</html>