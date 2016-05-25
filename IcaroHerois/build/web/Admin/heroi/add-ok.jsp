<%@page import="modelo.Editora"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Regiao"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%
    request.setCharacterEncoding("UTF-8");
    if (request.getParameter("txtNome") == null || request.getParameter("txtCodinome") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    if (request.getParameter("txtNome").isEmpty() || request.getParameter("txtCodinome").isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }

    HeroiDAO dao = new HeroiDAO();
    Heroi obj = new Heroi();

    obj.setNome(request.getParameter("txtNome"));
    obj.setCodinome(request.getParameter("txtCodinome"));
    obj.setDescricao(request.getParameter("txtDescricao"));
    obj.setProjecaoenergia(Integer.parseInt(request.getParameter("txtProjenergia")));
    obj.setFoto(request.getParameter("txtFoto"));
    obj.setVelocidade(Integer.parseInt(request.getParameter("txtVelocidade")));
    obj.setResistencia(Integer.parseInt(request.getParameter("txtResistencia")));
    obj.setHabilidadedecombate(Integer.parseInt(request.getParameter("txtHabcombate")));
    obj.setInteligencia(Integer.parseInt(request.getParameter("txtInteligencia")));
    obj.setForca(Integer.parseInt(request.getParameter("txtForca")));
    
    Regiao regiao = new Regiao();
    regiao.setCodigo(Integer.parseInt(request.getParameter("selRegiao")));
    obj.setRegiao(regiao);
    
    Categoria categoria = new Categoria();
    categoria.setCodigo(Integer.parseInt(request.getParameter("selCategoria")));
    obj.setCategoria(categoria);
    
    Editora editora = new Editora();
    editora.setCodigo(Integer.parseInt(request.getParameter("selEditora")));
    obj.setEditora(editora);
    
    dao.incluir(obj);
%>
<%@include file="../cabecalho.jsp"%>

<h1>Adicionado com sucesso!</h1>
<a href="index.jsp"> Voltar </a>
</body>
</html>
