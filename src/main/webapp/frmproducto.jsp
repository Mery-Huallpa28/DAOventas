
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
            <jsp:param name="opcion" value="productos" />
        </jsp:include>

        <div class="container">
            <h1>Formulario de Productos</h1>   

            <br>
            <form action="ProductoControlador" method="post">
                <input type="hidden" name="id" value="${producto.id}">

                <div class="form-group">
                    <label for="" class="form-label">Nombre de Producto</label>
                    <input type="text" class="form-control" name="nombre" value="${producto.nombre}" placeholder="Escriba el nombre">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Descripcion del Producto</label>
                    <input type="text" class="form-control" name="descripcion" value="${producto.descripcion}" placeholder="Descripcion">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Precio</label>
                    <input type="text" class="form-control" name="precio" value="${producto.precio}" placeholder="Escriba el Precio">

                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>   




        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    </body>
</html>