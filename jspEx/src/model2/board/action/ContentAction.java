package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;
import board.PageDTO;

public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		int num = Integer.parseInt(req.getParameter("num"));
		int currentPage = 0;
		if(req.getParameter("currentPage") ==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		int currentPageBlock = 0;
		if(req.getParameter("currentPageBlock")==null) {
			currentPageBlock = 1;
			
		}else {
			currentPageBlock = Integer.parseInt(req.getParameter("currentPageBlock"));
		}
		
		PageDTO pdto = new PageDTO();
		pdto.setCurrentPage(currentPage);
		pdto.setCurrentPageBlock(currentPageBlock);
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.getArticle(num);
		
		req.setAttribute("dto",dto);
		req.setAttribute("pdto",pdto);

		
		return "/board2/content.jsp";
	}

}
