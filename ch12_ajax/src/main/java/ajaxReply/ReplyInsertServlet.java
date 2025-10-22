package ajaxReply;

import java.io.IOException;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ajaxReply/rinsert.do")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String name = request.getParameter("name");
		
		Reply bean = new Reply();
		bean.setContent(content);
		bean.setName(name);
		bean.setRef(bno);
		
		int result = new ReplyDao().InsertReply(bean);
		
		response.getWriter().print(result);
	}

}












