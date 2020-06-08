package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;
import board.PageDTO;

public class UpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
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
		
		
		BoardDTO dto = new BoardDTO();	
		BoardDAO dao = BoardDAO.getInstance();
		dto.setSubject(req.getParameter("subject"));
		dto.setEmail(req.getParameter("email"));
		dto.setContent(req.getParameter("content"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setAttachNm(req.getParameter("attachNm"));
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		//DAO를 통해서 받은 데이터 저장하기
		
		dao.boardUpdate(dto);
		req.setAttribute("pdto",pdto);
		
		
		return "/board2/updatePro.jsp";
	}

}

//int num =Integer.parseInt(req.getParameter("num"));
//BoardDAO dao = BoardDAO.getInstance();
//BoardDTO dto = dao.getArticle(num);		
//dto.setSubject(req.getParameter("subject"));
//dto.setEmail(req.getParameter("email"));
//dto.setContent(req.getParameter("content"));
//dto.setPasswd(req.getParameter("passwd"));
//dto.setAttachNm(req.getParameter("attachNm"));
//dto.setNum(Integer.parseInt(req.getParameter("num")));
