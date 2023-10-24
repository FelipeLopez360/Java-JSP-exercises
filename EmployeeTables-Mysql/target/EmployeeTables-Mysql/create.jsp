<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.mysql.cj.jdbc.Driver"%>
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
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" required="required">
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Address" required="required">
                </div>
                <div class="form-group">
                    <label for="cellPhone">Cell Phone</label>
                    <input type="text" class="form-control" id="cellPhone" name="cellPhone" placeholder="Cell Phone" required="required">
                </div>
                <button type="save" class="btn btn-primary">Save
                    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V173.3c0-17-6.7-33.3-18.7-45.3L352 50.7C340 38.7 323.7 32 306.7 32H64zm0 96c0-17.7 14.3-32 32-32H288c17.7 0 32 14.3 32 32v64c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V128zM224 288a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                </button>

            </form>
        </div>
    </div>
</div>
    <%
        if(request.getParameter("Save")!=null){
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String cellPhone=request.getParameter("cellPhone");

            try {

                Connection connection=null;
                Statement statement=null;
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection=DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp?user=Felipe&password=123456");
                statement=connection.createStatement();
                //statement.executeUpdate("insert into employee (name,address,cellphone) values ("+name+","+address+","+cellPhone+");");
                statement.executeUpdate("insert into employee (name,address,cellphone) values ('name','address','cellPhone');");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                //request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e){
                out.print(e);
            }
        }
    %>
</body>
</html>
