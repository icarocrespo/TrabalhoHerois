<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>

<%
    //Instanciar a DAO
    CategoriaDAO dao = new CategoriaDAO();
    // Verificar se veio o filtro
    // se vier passamos o filtro pra dao 
    // se não traz todos os registros
    List<Categoria> lista; 
    if(request.getParameter("txtFiltro") != null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }
    else{
        // Chama o método que retorna
        // todos registros do banco de dados
        lista = dao.listar();
    }    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria</title>
        <link rel="stylesheet" type="text/css" href="estilo.css" />
    </head>
    <body>
            <table>
                <a href ="add.jsp"> Adicionar </a> <br />
                <form method ="post">
                    <input type="text" name = "txtFiltro" placeholder="digite o texto da pesquisa" />
                    <input type="submit" value="Pesquisar" /> <br />
                </form>
                <tr>
                    <th>Código:</th>
                    <th>Nome:</th>
                </tr>
                <tr>
                    <%
                        for(Categoria item : lista){
                    %>
                    <td><%=item.getCodigo()%></td>
                    <td><%=item.getNome()%></td>
                    
                    <td>
                        <a href ="del-ok.jsp?codigo=<%=item.getCodigo()%>" > Deletar </a>
                        <a href ="upd.jsp?codigo=<%=item.getCodigo()%>" > Modificar </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
    </body>
</html>
