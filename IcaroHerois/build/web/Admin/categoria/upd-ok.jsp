<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%
    if(request.getParameter("txtNome") == null || request.getParameter("txtCodigo") == null){
        response.sendRedirect("index.jsp");
        return;
    }
    if(request.getParameter("txtNome").isEmpty() || request.getParameter("txtCodigo").isEmpty()){
        response.sendRedirect("index.jsp");
        return;
    }
    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = new Categoria();
    obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
    obj.setNome(request.getParameter("txtNome"));
    dao.alterar(obj);
%>
<%@include file="../cabecalho.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificado</title>
    </head>
    <body>
        <h1>Modificado com sucesso!</h1>
        <a href="index.jsp"> Voltar </a>
    </body>
</html>
