<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Form</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="style1.css">
</head>
<body>

	<div class="wrapper" style="background-image: url('images/bg-registration-form-2.jpg');">
			<div class="inner">
				<form action="RegisterServlet">
					<h3 class="blinking">Registration Form</h3>
						<div class="form-wrapper">
							<label for="">User Name <i class="far fa-user"></i></label>
							<input type="text" class="form-control" name="uname" maxlength="20" placeholder="Enter User Name" required autofocus="autofocus">
						</div>
					<div class="form-wrapper">
						<label for="">Email <i class="far fa-envelope-open"></i></label>
						<input type="email" class="form-control" name="email" placeholder="Enter Email" required>
					</div>
					<div class="form-wrapper">
						<label for="">Mobile Number <i class="fas fa-mobile-alt"></i></label>
						<input type="tel" class="form-control" pattern="[789][0-9]{9}" name="number" minlength="10" maxlength="10" placeholder="Enter Mobile number" required>
					</div>
					
					<div class="form-group">
						<label for="">Gender</label>
						&nbsp&nbsp&nbsp<div class="form-wrapper">
							<input type="radio" name="gender" value="male" checked>&nbsp<i class="fas fa-male"></i>&nbspMale
						</div>
						<div class="form-wrapper">
							<input type="radio" name="gender" value="female">&nbsp<i class="fas fa-female"></i>&nbspFemale
						</div>
					</div>
					
					<div class="form-wrapper">
						<label for="">City <i class="fas fa-city"></i></label>
						<select class="form-control form-rounded" name="city"required >
							<option value="mumbai">Mumbai</option>
							<option value="delhi">Delhi</option>
							<option value="chennai">Chennai</option>
						</select>
						</div>
					<div class="form-wrapper">
						<label for="">Password <i class="fas fa-lock-open"></i></label>
						<input type="password" class="form-control" name="pass" minlength="8" maxlength="20" placeholder="Minimum 8 characters" required>
					</div>
					<div class="form-wrapper">
						<label for="">Balance</label>
						<input type="number" class="form-control" name="balance" placeholder="Minimum 1000" min="1000" max="5000" step="100" required>
					</div>
					<button>Register Now</button><br>
					<h6>Already a user? <a href="Login.jsp">Click Here!</a> to login</h6>
					<h6><a href="Home.jsp">Home</a></h6>
				</form>
			</div>
		</div>







<!-- 
<div class="bg">
	<center><div class="col-md-6" style="float:left; ">
	
	<form action="RegisterServlet">
	<h5><a href="Home.jsp">Home</a></h5>
	<h1 style="color: white">Registration Form</h1>
	<table style="text-align: center;">
			<tr>
				<th>User Name  <i class="far fa-user"></i> : </th>
				<td><input type="text" class="form-control form-rounded" name="uname" maxlength="20" placeholder="Enter User Name" required autofocus="autofocus"></td>
			</tr>
			<tr>
				<th>Email <i class="far fa-envelope-open"></i> : </th>
				<td><input type="email" class="form-control form-rounded" name="email" placeholder="Enter Email" required></td>
			</tr>
			<tr>
				<th>Mobile Number <i class="fas fa-mobile-alt"></i> : </th>
				<td><input type="tel" class="form-control form-rounded" pattern="[789][0-9]{9}" name="number" minlength="10" maxlength="10" placeholder="Enter Mobile number" required></td>
			</tr>
			<tr>
				<th>Gender : </th>
				<td><input type="radio" name="gender" value="male" checked>&nbsp<i class="fas fa-male"></i> Male &nbsp&nbsp
				<input type="radio" name="gender" value="female">&nbsp<i class="fas fa-female"></i> Female</td>
			</tr>
			<tr>
				<th>City <i class="fas fa-city"></i> : </th>
				<td><select class="form-control form-rounded" name="city"required >
					<option value="mumbai">Mumbai</option>
					<option value="delhi">Delhi</option>
					<option value="chennai">Chennai</option>
				</select></td>
			</tr>
			<tr>
				<th>Password  <i class="fas fa-lock-open"></i> : </th>
				<td><input type="password" class="form-control form-rounded" name="pass" minlength="8" maxlength="20" placeholder="Minimum 8 characters" required></td>
			</tr>
			<tr>
				<th>Balance : </th>
				<td><input type="number" class="form-control form-rounded" name="balance" placeholder="Minimum 1000" min="1000" max="5000" step="100" required></td>
			</tr>
	</table>
		<input type="submit" name="submit" class="btn btn-success" style="border-radius: 10px; box-shadow: 0px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="reset" name="reset" class="btn btn-danger" style="border-radius: 10px; box-shadow: 0px;">
	</form>	
	<h6>Already a user? <a href="Login.jsp">Click Here!</a> to login</h6>
	</div>
	 -->
</body>
</html>