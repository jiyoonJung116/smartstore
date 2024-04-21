package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardListDao;
import dto.BoardListDto;

@WebServlet("/NoticeBoardSearchServlet")
public class NoticeBoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("post방식으로 요청이 들어옴!");
		String searchKeyword = request.getParameter("searchWord");
		
		BoardListDao dao = new BoardListDao();
		ArrayList<BoardListDto> listBoard = null;
		
		try {
			listBoard = dao.getBoardListByPageNum(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
	}
	
	

}















