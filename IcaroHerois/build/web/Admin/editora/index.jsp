<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    EditoraDAO dao = new EditoraDAO();
    List<Editora> lista; 
    if(request.getParameter("txtFiltro") != null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }
    else{
        lista = dao.listar();
    }    
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editora</title>
        <link rel="stylesheet" type="text/css" href="estilo.css" />
    </head>
    <body>
            <table>
                <a href ="add.jsp"> Adicionar </a> <br />
                <input type="text" placeholder="digite o texto da pesquisa" />
                <input type="submit" value="Pesquisar" /> <br />
                <tr>
                    <th>Código:</th>
                    <td>Nome:</td>
                    <th>Data de Fundação:</th>
                </tr>
                <tr>
                    <%
                        String data;
                        for(Editora item : lista){
                    %>
                    <td><%=item.getCodigo()%></td>
                    <td><%=item.getNome()%></td>
                    <% 
                        if(item.getDatafundacao() != null){
                            data = formato.format(item.getDatafundacao());
                        }
                        else{
                            data = null;
                        }
                    %>
                    <td><%=data%></td>                    
                    <%%>
                    <td>
                        <a href ="del-ok.jsp?codigo=<%=item.getCodigo()%>" > Deletar </a>
                        <a href ="upd.jsp?codigo=<%=item.getCodigo()%>" > Modificar </a>
                </tr>
                <%
                    }
                %>
            </table>

    </body>
</html>
