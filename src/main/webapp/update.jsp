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
String sql = "UPDATE register SET Fullname=?,EmailAdd=?,MobileNo=?,Gender=?,Department=?,Address=? WHERE regno=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(7,regno);
ps.setString(1,fullname);
ps.setString(2,emailAdd);
ps.setString(3,mobile);
ps.setString(4,gender);
ps.setString(5,department);
ps.setString(6,address);
ps.executeUpdate();
ps.close();
con.close();
%>
<script>
alert("Student Updated Successfully!!");
<%
response.sendRedirect("index.jsp");
%>
</script>
