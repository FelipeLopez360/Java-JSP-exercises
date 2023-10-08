<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page import="com.sun.xml.internal.bind.v2.model.core.ID" %><%--
    Document   : index
    Created on : 6/10/2023, 9:30:05 p. m.
    Author     : FelipeAndresLopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Empleados</title>
    </head>
    <body>
        <%
            Connection connection=null;
            Statement statement=null;
            ResultSet resultSet=null;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">NAME</th>
                            <th scope="col">ADDRESS</th>
                            <th scope="col">CELL PHONE</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp?"+"user=Felipe&password=123456");
                            statement = connection.createStatement();
                            resultSet = statement.executeQuery("SELECT * FROM `empleados`;");
                            while(resultSet.next()){
                                %>
                            <tr>
                                <th scope="row"><%= resultSet.getString(1)%></th>
                                <td><%= resultSet.getString(2)%></td>
                                <td><%= resultSet.getString(3)%></td>
                                <td><%= resultSet.getString(4)%></td>
                            </tr>
                                <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>