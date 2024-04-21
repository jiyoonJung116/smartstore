package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionFactory1;
import action.DivideAction;
import action.MinusAction;
import action.MultiplyAction;
import action.PlusAction;
import action.ResultAction;

@WebServlet("/Controller") //ExMVC_form에 있는 폼 태그에 있는 이름과 같아야 함. 중요!서블릿 경로 지정.
public class ExMVCController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String command = request.getParameter("command");
//		
//		Action action = null;
//		ActionFactory af = ActionFactory.getInstance();
//		action = af.getAction(command);
//		action.execute(request, response);
//	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		
		Action action = null;
		ActionFactory1 af = ActionFactory1.getInstance();
		action = af.getAction(command);
		action.execute(request, response);
	}


}
