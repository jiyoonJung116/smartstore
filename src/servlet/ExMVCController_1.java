package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action_1;
import action.CalculateAction_1;
import action.ResultAction_1;

@WebServlet("/Controller_1")
public class ExMVCController_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		Action_1 action = null;
		switch(command) {
		case "plus" :
			action = new CalculateAction_1();
			break;
		case "result" :
			action = new ResultAction_1();
			break;	
		}
		action.execute(request, response);
	}


}
