package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.BoardDao;
import dao.BoardListDao;
import dto.BoardDto;
import dto.BoardListDto;

/**
 * Servlet implementation class BoardServlet2
 */
@WebServlet("/NoticeBoardServlet")
public class NoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("get 요청이 들어옴.");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardListDao dao = new BoardListDao();
		ArrayList<BoardListDto> listBoard = null;
		
		try {
		listBoard = dao.getBoardListByPageNum(pageNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		for(BoardListDto dto :listBoard) {
			JSONObject obj = new JSONObject();
			obj.put("bno",dto.getBno());
			obj.put("title", dto.getTitle());
			obj.put("nickname",dto.getNickname());
			obj.put("hitcount", dto.getHitcount());
			obj.put("writedate", dto.getWritedate());
			array.add(obj);
		}
		out.println(array);
	}


}
