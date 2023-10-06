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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Saludo</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-sm">
            <form action="index.jsp" method="post">
                <div class="form-group">
                    <label>Hola escibe tu nombre!</label>
                    <input type="text" class="form-control" name="nombrePersona" placeholder="Nombre">
                </div>
                <div class="form-group">
                    <label>Escribe tu edad!</label>
                    <input type="text" class="form-control" name="edadPersona" placeholder="Edad">
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-sm">
            <div class="alert alert-primary" role="alert">
                <%
                    String nombre = request.getParameter("nombrePersona");
                    String edad= request.getParameter("edadPersona");
                    if (nombre!=null && edad!=null) {
                        int edadNumero=Integer.parseInt(edad);
                        String mensajeEdad="";
                        if (edadNumero>=1 && edadNumero<=17){
                            mensajeEdad="Eres menor de edad!";
                        }
                        if (edadNumero>=18){
                            mensajeEdad="Eres mayor de edad!";
                        }
                        String saludarPersona = "Hola " + nombre + " tu edad es " + edad + " años y " + mensajeEdad;
                        out.print(saludarPersona);
                    }
                    else {
                        out.print("No se han ingresado datos.");
                    }
                %>
            </div>
        </div>
    </div>

</div>
</body>
</html>
