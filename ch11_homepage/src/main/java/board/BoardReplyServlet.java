package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/boardReply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Board bean = new Board();
		bean.setName(request.getParameter("name"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setRef(Integer.parseInt(request.getParameter("ref")));
		bean.setPos(Integer.parseInt(request.getParameter("pos")));
		bean.setDepth(Integer.parseInt(request.getParameter("depth")));
		bean.setPass(request.getParameter("pass"));
		bean.setIp(request.getParameter("ip"));
		
		BoardDao vDao = new BoardDao();
		vDao.replyUpBoard(bean.getRef(), bean.getPos());
		vDao.replyBoard(bean);
		
		response.sendRedirect("list.jsp?nowPage="+request.getParameter("nowPage"));
	}
}
