package model2.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;

public class WriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		//한글 확인업을 위해 utf-8로 전환
		req.setCharacterEncoding("utf-8");
		//writeform에서 보내준 데이터 모두 받기
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = BoardDAO.getInstance();
		//num,ref,re_step,re_level
		//writer,subject,content,passwd,email,attachNm
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setRef(Integer.parseInt(req.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		dto.setWriter(req.getParameter("writer"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setEmail(req.getParameter("email"));
		dto.setAttachNm(req.getParameter("attachNm"));
		//DAO를 통해서 받은 데이터 저장하기
		
		dao.boardWrite(dto);
		
		return "/board2/writePro.jsp";
	}

}
