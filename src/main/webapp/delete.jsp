<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
int regno;

regno=Integer.parseInt(request.getParameter("regno"));
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","abhayraja@123");
String sql = "DELETE From register WHERE regno=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1,regno);
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
