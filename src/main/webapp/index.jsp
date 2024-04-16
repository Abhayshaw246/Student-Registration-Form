<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP WEB APP</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ page import="java.sql.*"%>
<div class="header">
	<h1>Student <span> Management </span> App</h1>
	<button onclick="toggle()">Add Student <i class="fa-solid fa-plus"></i></button>
</div>
<div class="details">
		<table>
			<thead>
				<tr>
					<th>RegNo</th>
					<th>Full Name</th>
					<th>Email Address</th>
					<th>Mobile No</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					String mySQLUser="root";
					String mySQLPwd="abhayraja@123";
					String serverName="jdbc:mysql://localhost:3306/projectdb";
					Connection con = DriverManager.getConnection(serverName,mySQLUser,mySQLPwd);
					
					PreparedStatement ps=con.prepareStatement("select * from register;");
					ResultSet rs=ps.executeQuery();
					int regno=0;
					String fullname="";
					String emailAdd="";
					String mobile="";
					
					while(rs.next()){
						regno=rs.getInt(1);
						fullname=rs.getString(2);
						emailAdd=rs.getString(3);
						mobile=rs.getString(4);
						
					%>
					<tr>
						<td><%=regno %></td>
						<td><%=fullname %></td>
						<td><%=emailAdd %></td>
						<td><%=mobile %></td>
						<td>
							<a href="studentEdit.jsp?regno=<%=regno%>"><i class="fa-solid fa-pen-to-square"></i></a>
							<a href="delete.jsp?regno=<%=regno%>"><i class="fa-solid fa-trash"></i></a>
						</td>
					</tr>
					<%
				}
				%>
			</tbody>
		</table>
	</div>
<div class="popup" id="popup">
	<div class="title">
		<h2>Add Student</h2>
	</div>
	<form method="post" action="studentAdd.jsp">
		<div class="field">
			<label>Registration No.</label>
			<input type="number" name="regno" required>
		</div>
		<div class="field">
			<label>Full name</label>
			<input type="text" name="fullname" required>
		</div>
		<div class="field">
			<label>Email ID</label>
			<input type="email" name="emailAdd" required>
		</div>
		<div class="field">
			<label>Mobile No</label>
			<input type="number" maxlength="10" name="mobile" required>
		</div>
		<div class="field">
			<label>Gender</label>
			<select name="gender">
				<option value="" selected>Gender</option>
				<option value="Male" selected>Male</option>
				<option value="Female" selected>Female</option>
			</select>
		</div>
		<div class="field">
			<label>Department</label>
			<select name="department">
				<option value="" selected>Department</option>
				<option value="ECE" selected>ECE</option>
				<option value="IT" selected>IT</option>
			</select>
		</div>
		<div class="textarea-field">
			<label>Address</label>
			<textarea name="address"></textarea>
		</div>
		<div class="action-field">
			<input type="submit" value="Add student">
		</div>
	</form>
</div>
<script>
	function toggle(){
		var popup=document.querySelector("#popup")
		if(popup.style.display=='none'){
			popup.style.display='block';
		}
		else{
			popup.style.display='none';
		}
	}
</script>
</body>
</html>