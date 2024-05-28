<%
    if (session.getAttribute("logueado") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Punto de venta</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/menu.jsp" >
            <jsp:param name="opcion" value="usuarios" />
        </jsp:include>
        <div class="container">
            <h1>Formulario de Usuarios</h1>   

            <br>
            <form action="UsuarioControlador" method="post">
                <input type="hidden" name="id" value="${usuario.id}">

                <div class="form-group">
                    <label for="" class="form-label">Nombres</label>
                    <input type="text" class="form-control" name="nombres" value="${usuarios.nombres}" placeholder="Escriba su Nombre">

                </div>
                    <div class="form-group">
                    <label for="" class="form-label">Apellidos</label>
                    <input type="text" class="form-control" name="apellidos" value="${usuarios.apellidos}" placeholder="Escriba su Apellido">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Correo Electronico</label>
                    <input type="email" class="form-control" name="correo" value="${usuario.correo}" placeholder="Escriba su correo Electronico">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" value="${usuario.password}" placeholder="Escriba su Password">

                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>   




        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    </body>
</html>