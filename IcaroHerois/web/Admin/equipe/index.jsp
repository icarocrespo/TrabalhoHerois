<%@page import="modelo.Equipe"%>
<%@page import="dao.EquipeDAO"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp"%>
<%
    EquipeDAO dao = new EquipeDAO();
    List<Equipe> lista; 
    if(request.getParameter("txtFiltro") != null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }
    else{
        lista = dao.listar();
    }    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equipe</title>
    </head>
<link rel="stylesheet" type="text/css" href="estilo.css" />
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
                    <th>Descrição:</th>
                </tr>
                <tr>
                    <%
                        for(Equipe item : lista){
                    %>
                    <td><%=item.getCodigo()%></td>
                    <td><%=item.getNome()%></td>
                    <td><%=item.getDescricao()%></td>
                    
                    
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
