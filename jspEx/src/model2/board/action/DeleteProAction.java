package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

public class DeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		int num =Integer.parseInt(req.getParameter("num"));
		BoardDAO dao = BoardDAO.getInstance();
		int r = dao.deleteArticle(num);
		req.setAttribute("r", r);
		
		return "/board2/deletePro.jsp";
	}

}
