package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;

public class UpdateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		int num =Integer.parseInt(req.getParameter("num"));
		//DAO를 통해서 해당 글 갖고 오기
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.getArticle(num);
		req.setAttribute("dto",dto);
		
		return "/board2/updateForm.jsp";
	}

}
