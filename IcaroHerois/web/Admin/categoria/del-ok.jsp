<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
  //verifico se veio codigo por get
if(request.getParameter("codigo") == null){
    response.sendRedirect("index.jsp");
    return; // para a execução aqui
}  
if(request.getParameter("codigo") == null){
    response.sendRedirect("index.jsp");
    return;
}
    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = new Categoria();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    // Buscar a categoria
    obj = dao.buscarPorChavePrimaria(codigo);
    // excluir a categoria buscada
    dao.excluir(obj);
%>

<%@include file="../cabecalho.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletado</title>
    </head>
    <body>
        <h1>Deletado com sucesso!</h1>
        <a href="index.jsp"> Voltar </a>
    </body>
</html>