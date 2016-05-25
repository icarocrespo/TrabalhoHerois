<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>

<%
    request.setCharacterEncoding("UTF-8");
    if (request.getParameter("txtNome") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    if (request.getParameter("txtNome").isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }

    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = new Categoria();

    obj.setNome(request.getParameter("txtNome"));
    dao.incluir(obj);
%>
<%@include file="../cabecalho.jsp"%>


<h1>Adicionado com sucesso!</h1>
<a href="index.jsp"> Voltar </a>
</body>
</html>
