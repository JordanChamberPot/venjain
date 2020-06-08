package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;

public class UpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		req.setCharacterEncoding("utf-8");
		
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
