package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.취소관리Dao;
import dto.취소관리Dto;

public class CancelAction implements Project{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		취소관리Dao dao = new 취소관리Dao();
		
		String menu = request.getParameter("menu");
	    String date = request.getParameter("date");
	    String date2 = request.getParameter("date2");
	    String choose = request.getParameter("choose");
	    String name = request.getParameter("name");
	    String pcs = request.getParameter("pcs");

	    long n = 0L;
	    if(request.getParameter("n")!=null)
	    	n = Long.parseLong(request.getParameter("n"));
	    
	    String cancel = request.getParameter("cancel");
	    
	    
	    ArrayList<취소관리Dto> listRet  = null;
	    
// 	    String loginId = (String)session.getAttribute("id");
	    String loginId = "jiyoonjung";
	    
	    if("취소완료".equals(cancel)) {
	    	listRet = dao.get취소상태List(loginId, "취소완료");
	    } else if("취소요청".equals(cancel)) {
	    	listRet = dao.get취소상태List(loginId, "취소요청");
	    } else{
	    	listRet = dao.get취소관리List(menu, date, date2, choose, name, pcs, n);
	    }
	    
	    request.setAttribute("menu", menu);
	    request.setAttribute("date", date);
	    request.setAttribute("date2", date2);
	    request.setAttribute("choose", choose);
	    request.setAttribute("name", name);
	    request.setAttribute("pcs", pcs);
	    request.setAttribute("n", n);
	    request.setAttribute("cancel", cancel);
	    request.setAttribute("listRet", listRet);
	    request.setAttribute("loginId", loginId);
	    System.out.println(menu);
	    RequestDispatcher rd = request.getRequestDispatcher("../MVCProjectPractice.jsp");
	    rd.forward(request, response);
	}

}
