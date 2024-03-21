<%@ page import="java.util.*,org.aguzman.apiservlet.webapp.headers.models.*" %><%--
  Created by IntelliJ IDEA.
  User: alday
  Date: 18/03/2024
  Time: 12:52 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Producto> productos= (List<Producto>) request.getAttribute("productos");
    Optional<String> username = (Optional<String>) request.getAttribute("username");
    String mensajeRequest = (String) request.getAttribute("mensaje");
    String mensajeApp = (String) request.getServletContext().getAttribute("mensaje");
%>
<html lang = "en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>Listado de productos</h1>

<%if (username.isPresent()){%>
<div>Hola <%=username.get()%>, bienvenido!</div>
<p><a href="<%=request.getContextPath()%>/productos/form">crear [+]</a></p>
<% } %>
<table>
    <tr>
        <th>id</th>
        <th>nombre</th>
        <th>tipo</th>
        <%if (username.isPresent()){%>
        <th>precio</th>
        <th>agregar</th>
        <th>editar</th>
        <% } %>
    </tr>
    <% for (Producto p: productos){%>

    <tr>
        <td><%=p.getId()%></td>
        <td><%=p.getNombre()%></td>
        <td><%=p.getCategoria().getNombre()%></td>
        <%if (username.isPresent()){%>
        <td><%=p.getPrecio()%></td>
        <td><a href="<%=request.getContextPath()%>/carro/agregar?id=<%=p.getId()%>">agregar al carro</a></td>
        <td><a href="<%=request.getContextPath()%>/productos/form?id=<%=p.getId()%>">editar</a></td>
        <% } %>
    </tr>
    <%}%>
</table>
<p><%=mensajeApp%></p>
<p><%=mensajeRequest%></p>
</body>
</html>
