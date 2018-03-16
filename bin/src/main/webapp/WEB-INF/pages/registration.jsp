<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 100px">
			<div class="col-md-4 col-md-offset-4">
				<h1 style="text-transform: uppercase">Registration</h1>
				<div class="well">
					<form:form method="POST" modelAttribute="userForm">
						<div class="form-group">
							<label>Username:</label>
							<form:input path="username" cssClass="form-control" />
						</div>
						<div class="form-group">
							<label>Password:</label>
							<form:password path="password" cssClass="form-control" />
						</div>
						<div class="form-group">
							<label>Password Confirm:</label>
							<form:password path="passwordConfirm" cssClass="form-control" />
						</div>
						<input type="submit" value="Register" class="btn btn-primary" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>