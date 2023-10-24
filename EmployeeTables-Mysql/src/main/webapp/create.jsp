<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%--
  Created by IntelliJ IDEA.
  User: felipe
  Date: 8/10/23
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css"
          integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
    <title>Create</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-sm">
            <form action="create.jsp" method="post">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name"
                           required="required">
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Address"
                           required="required">
                </div>
                <div class="form-group">
                    <label for="cellPhone">Cell Phone</label>
                    <input type="text" class="form-control" id="cellPhone" name="cellPhone" placeholder="Cell Phone"
                           required="required">
                </div>
                <button type="submit" name="Save" class="btn btn-primary">Save <i class="fa fa-floppy-o"
                                                                                  aria-hidden="true"></i></button>

                <a href="index.jsp" class="btn btn-danger">Cancel
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512">
                        <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                        <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                    </svg>
                </a>
            </form>
        </div>
    </div>
</div>
<%
    Connection connection;
    Statement statement;
    ResultSet resultSet;

    if (request.getParameter("save") != null) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String cellPhone = request.getParameter("cellPhone");


        try {


            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root");
            statement = connection.createStatement();
            statement.executeUpdate("insert into employee (name,address,cellphone) values ('" + name + "','" + address + "','" + cellPhone + "');");
            request.getRequestDispatcher("index.jsp").forward(request, response);


        } catch (Exception e) {
            //out.print("Error en mysql" +e)
            e.printStackTrace();
        }
    }
%>
</body>
</html>
