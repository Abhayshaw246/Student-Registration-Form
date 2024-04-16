<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
int regno;
String fullname,emailAdd,mobile,gender,department,address;
regno=Integer.parseInt(request.getParameter("regno"));
fullname=request.getParameter("fullname");
emailAdd=request.getParameter("emailAdd");
mobile=request.getParameter("mobile");
gender=request.getParameter("gender");
department=request.getParameter("department");
address=request.getParameter("address");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","abhayraja@123");
String sql = "INSERT INTO register VALUES(?,?,?,?,?,?,?);";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1,regno);
ps.setString(2,fullname);
ps.setString(3,emailAdd);
ps.setString(4,mobile);
ps.setString(5,gender);
ps.setString(6,department);
ps.setString(7,address);
ps.executeUpdate();
ps.close();
con.close();
%>
<script>
alert("Student Registered Successfully!!");
</script>
<%
response.sendRedirect("index.jsp");
%>