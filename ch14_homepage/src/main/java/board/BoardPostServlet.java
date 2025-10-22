package board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/board/boardPost")
public class BoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); // 한글 깨지지 말라고 넣어줌
		PrintWriter out = response.getWriter();
		
		Board bean = new Board();
		bean.setName(request.getParameter("name"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setPass(request.getParameter("pass"));
		bean.setIp(request.getParameter("ip"));
		
		HttpSession session = request.getSession();
		Board dbBean = (Board)session.getAttribute("temp");
		
		BoardDao bDao = new BoardDao();
		bDao.insertBoard(bean);
		response.sendRedirect("list.jsp");
	}
}
