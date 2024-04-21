<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    LoginDao loginDao = new LoginDao();
    boolean loginSuccess = loginDao.Log(id, pw);
    String LoginError = "로그인 실패. 다시 입력해주세요";
    if (loginSuccess) {
        // 세션에 로그인 정보 저장
        LoginDto dto = new LoginDto(id,pw);
        session.setAttribute("id", dto.getId());
        session.setAttribute("pw", dto.getPw());
        
        // 환영 메시지 출력
        String welcomeMessage = dto.getId() + "님, 환영합니다.";
        
%>
        <script>
            alert("<%= welcomeMessage %>");
            window.location.href = "MainPage.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("<%=LoginError%>");
            window.location.href = "Login.jsp";
        </script>
<%
    }
%>