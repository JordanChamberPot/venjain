package model2.board.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;
import board.PageDTO;
import common.ServletUpload;

public class WriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
//		int currentPage = 0;
//		if(req.getParameter("currentPage") ==null) {
//			currentPage = 1;
//		}else {
//			currentPage = Integer.parseInt(req.getParameter("currentPage"));
//		}
//		int currentPageBlock = 0;
//		if(req.getParameter("currentPageBlock")==null) {
//			currentPageBlock = 1;
//			
//		}else {
//			currentPageBlock = Integer.parseInt(req.getParameter("currentPageBlock"));
//		}
//		
//		PageDTO pdto = new PageDTO();
//		pdto.setCurrentPage(currentPage);
//		pdto.setCurrentPageBlock(currentPageBlock);
		
		//writeform에서 보내준 데이터 모두 받기
//		BoardDTO dto = new BoardDTO();
//		BoardDAO dao = BoardDAO.getInstance();
		//num,ref,re_step,re_level
		//writer,subject,content,passwd,email,attachNm
//		dto.setNum(Integer.parseInt(req.getParameter("num")));
//		dto.setRef(Integer.parseInt(req.getParameter("ref")));
//		dto.setRe_step(Integer.parseInt(req.getParameter("re_step")));
//		dto.setRe_level(Integer.parseInt(req.getParameter("re_level")));
//		dto.setWriter(req.getParameter("writer"));
//		dto.setSubject(req.getParameter("subject"));
//		dto.setContent(req.getParameter("content"));
//		dto.setPasswd(req.getParameter("passwd"));
//		dto.setEmail(req.getParameter("email"));
//		dto.setAttachNm(req.getParameter("attachNm"));
//		if(req.getParameter("attachNm")!=null) {
//			String at = req.getParameter("attachNm");
//			System.out.println(at);
//		}else {
//			dto.setAttachNm("");
//		}
//		dao.boardWrite(dto);
		//DAO를 통해서 받은 데이터 저장하기
		Map<String, Object>multiDTO = ServletUpload.uploadEx(req, res);
		BoardDAO dao = BoardDAO.getInstance();
		dao.boardWrite((BoardDTO)multiDTO.get("dto"));
		req.setAttribute("pdto",(PageDTO)multiDTO.get("pdto"));
		
		return "/board2/writePro.jsp";
	}

}
