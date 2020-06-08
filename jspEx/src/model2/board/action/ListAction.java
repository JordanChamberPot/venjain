package model2.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardDTO;
import board.PageDTO;

public class ListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		BoardDAO dao = BoardDAO.getInstance();
		PageDTO pdto = new PageDTO();
		HttpSession session = req.getSession();
		//전체 레코드 수
		int cnt = dao.getAllCount();
		pdto.setAllCount(cnt);
		//전체 페이지 수 계산
		int pageCnt = cnt%pdto.getLinePerPage();
		if(pageCnt == 0) {
			//몫이 전체 페이지 수
			pdto.setAllPage(cnt/pdto.getLinePerPage());
		}else {
			//몫+1이 전체 페이지 수
			pdto.setAllPage(cnt/pdto.getLinePerPage()+1);
		}
		
		int currentPage = 0;
		if(req.getParameter("currentPage") ==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		//현재 블럭 받아오기
		int currentPageBlock = 0;
		if(req.getParameter("currentPageBlock")==null) {
			currentPageBlock = 1;
			
		}else {
			currentPageBlock = Integer.parseInt(req.getParameter("currentPageBlock"));
		}
		
		pdto.setCurrentPage(currentPage);
		pdto.setCurrentPageBlock(currentPageBlock);
		
		int startPage = 1;
		int endPage = 1;
		//전체 페이지 수가 블럭보다 크면 블럭보다 작으면
		if(pdto.getAllPage()<pdto.getPageBlock()) {
			startPage=1;
			endPage = pdto.getAllPage();
		}else {
			//전체페이지 수가 블럭보다 크면
			//현재 페이지 블럭에 따라서 바뀜
			startPage = (currentPageBlock-1)*pdto.getPageBlock()+1;
			endPage = currentPageBlock*pdto.getPageBlock()>pdto.getAllPage()?
						pdto.getAllPage():currentPageBlock*pdto.getPageBlock();
		}
		
		pdto.setStartPage(startPage);
		pdto.setEndPage(endPage);
		//시작 값
	 	int sRow= (currentPage-1)*pdto.getLinePerPage()+1;
	 	List<BoardDTO> list = dao.getArticles(sRow, currentPage*pdto.getLinePerPage());
	 
	 	//view에서 사용할 결과 값 저장
	 	req.setAttribute("list", list);
	 	//페이지 정보도 저장
	 	session.setAttribute("pdto", pdto);
		return "/board2/boardList.jsp";
	}

}