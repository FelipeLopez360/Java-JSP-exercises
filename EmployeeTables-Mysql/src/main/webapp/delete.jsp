<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%--
  Created by IntelliJ IDEA.
  User: felipe
  Date: 12/10/23
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<%
    Connection connection;
    Statement statement;
    ResultSet resultSet;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root");
        statement = connection.createStatement();
        statement.executeUpdate("delete from employee where id='"+request.getParameter("id")+"';");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } catch (Exception e) {
        //out.print("Error en mysql" +e)
        e.printStackTrace();

    }
%>
</body>
</html>
