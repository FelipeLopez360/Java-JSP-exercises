<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page import="java.util.*"%>
<%--
    Document   : index
    Created on : 6/10/2023, 9:30:05 p. m.
    Author     : FelipeAndresLopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" type="text/css" media="screen" />
</head>
<body>
<%
    Connection connection;
    Statement statement;
    ResultSet resultSet;
%>
<div class="container mt-5">
    <div class="row">
        <div class="col-sm">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col" colspan="4" class="text-center">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M335.5 4l288 160c15.4 8.6 21 28.1 12.4 43.5s-28.1 21-43.5 12.4L320 68.6 47.5 220c-15.4 8.6-34.9 3-43.5-12.4s-3-34.9 12.4-43.5L304.5 4c9.7-5.4 21.4-5.4 31.1 0zM320 160a40 40 0 1 1 0 80 40 40 0 1 1 0-80zM144 256a40 40 0 1 1 0 80 40 40 0 1 1 0-80zm312 40a40 40 0 1 1 80 0 40 40 0 1 1 -80 0zM226.9 491.4L200 441.5V480c0 17.7-14.3 32-32 32H120c-17.7 0-32-14.3-32-32V441.5L61.1 491.4c-6.3 11.7-20.8 16-32.5 9.8s-16-20.8-9.8-32.5l37.9-70.3c15.3-28.5 45.1-46.3 77.5-46.3h19.5c16.3 0 31.9 4.5 45.4 12.6l33.6-62.3c15.3-28.5 45.1-46.3 77.5-46.3h19.5c32.4 0 62.1 17.8 77.5 46.3l33.6 62.3c13.5-8.1 29.1-12.6 45.4-12.6h19.5c32.4 0 62.1 17.8 77.5 46.3l37.9 70.3c6.3 11.7 1.9 26.2-9.8 32.5s-26.2 1.9-32.5-9.8L552 441.5V480c0 17.7-14.3 32-32 32H472c-17.7 0-32-14.3-32-32V441.5l-26.9 49.9c-6.3 11.7-20.8 16-32.5 9.8s-16-20.8-9.8-32.5l36.3-67.5c-1.7-1.7-3.2-3.6-4.3-5.8L376 345.5V400c0 17.7-14.3 32-32 32H296c-17.7 0-32-14.3-32-32V345.5l-26.9 49.9c-1.2 2.2-2.6 4.1-4.3 5.8l36.3 67.5c6.3 11.7 1.9 26.2-9.8 32.5s-26.2 1.9-32.5-9.8z"/></svg>
                        <h3>Employee</h3></th>
                    <th scope="col">
                        <a href="create.jsp">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </a>
                    </th>

                </tr>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">NAME</th>
                    <th scope="col">ADDRESS</th>
                    <th scope="col">CELL PHONE</th>
                    <th scope="col">ACTIONS</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root");
                        //connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp?user=admin&password=1234");
                        statement = connection.createStatement();
                        resultSet = statement.executeQuery("SELECT * FROM employee");
                        while (resultSet.next()) {
                %>
                <tr>
                    <th scope="row"><%= resultSet.getString(1)%></th>
                    <td><%= resultSet.getString(2)%></td>
                    <td><%= resultSet.getString(3)%></td>
                    <td><%= resultSet.getString(4)%></td>
                    <td>
                        <a href="edit.jsp?id=<%= resultSet.getString(1)%>&name=<%= resultSet.getString(2)%>&address=<%= resultSet.getString(3)%>&cellPhone=<%= resultSet.getString(4)%>">
                            <i class="fa fa-pencil" aria-hidden="true"></i>
                        </a>


                        <a href="delete.jsp?id=<%= resultSet.getString(1)%>&name=<%= resultSet.getString(2)%>&address=<%= resultSet.getString(3)%>&cellPhone=<%= resultSet.getString(4)%>">
                            <i class="fa fa-trash" aria-hidden="true"></i>
                        </a>

                    </td>
                </tr>
                <%
                        }
                    }
                    catch (Exception e) {
                        //out.print("Error en mysql" +e)
                            e.printStackTrace();

                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>