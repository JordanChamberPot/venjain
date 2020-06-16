package kr.or.sol.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.sol.board.dao.BoardDAO;
import kr.or.sol.board.dto.BoardDTO;
import kr.or.sol.board.dto.PageDTO;
import kr.or.sol.board.service.BoardListService;

@Service("boardListService")
public class BoardListServiceImpl implements BoardListService {

   private static final Logger logger = LoggerFactory.getLogger(BoardListServiceImpl.class);

   @Resource
   BoardDAO boardDao;

   @Override
   public int getAllcount() {
      return boardDao.getAllcount();
   }

   @Override
   public List<BoardDTO> getArticles(PageDTO pdto) {
      // 전체 페이지 수 계산
      if (pdto.getAllCount() % pdto.getLinePerPage() == 0) {
         // 몫이 전체 페이지 수
         pdto.setAllPage(pdto.getAllCount() / pdto.getLinePerPage());
      } else {
         // 몫+1이 전체 페이지 수
         pdto.setAllPage(pdto.getAllCount() / pdto.getLinePerPage() + 1);
      }
      // int currentPage =0;

      // 현재 페이지와 페이지 블럭이 0이면 1로 setting
      if (pdto.getCurrentPage() == 0) {
         pdto.setCurrentPage(1);
      }

      if (pdto.getCurrentPageBlock() == 0) {
         pdto.setCurrentPageBlock(1);
      }

      int startPage = 1;
      int endPage = 1;
      // 전체 페이지 수가 블럭보다 작다
      if (pdto.getAllPage() < pdto.getPageBlock()) {
         startPage = 1;
         endPage = pdto.getAllPage();
      } else {
         // 전체 페이지 수가 블럭보다 크다
         // 현재 페이지 블럭에 따라서 바뀜
         startPage = (pdto.getCurrentPageBlock() - 1) * pdto.getPageBlock() + 1;
         endPage = pdto.getCurrentPageBlock() * pdto.getPageBlock() > pdto.getAllPage() ? pdto.getAllPage() : pdto.getPageBlock() * pdto.getCurrentPageBlock();
      }

      pdto.setStartPage(startPage);
      pdto.setEndPage(endPage);

      // 가져올 start레코드와 end레코드
      int start = (pdto.getCurrentPage() - 1) * pdto.getLinePerPage() + 1;
      int end = pdto.getCurrentPage() * pdto.getLinePerPage();
      Map<String, Integer> hmap = new HashMap<String, Integer>();
      hmap.put("start", start);
      hmap.put("end", end);

      List<BoardDTO> list = boardDao.getArticles(hmap);

      // view에서 사용할 결과 값 저장
      return list;
   }

   @Override
   public Map<String, Object> getArticle(BoardDTO bdto, PageDTO pdto) {
      //현재 페이지를 받아오는데 못 받아올 경우 0이므로 1로 세팅
      if (pdto.getCurrentPage() == 0) {
         pdto.setCurrentPage(1);
      }

      if (pdto.getCurrentPageBlock() == 0) {
         pdto.setCurrentPageBlock(1);
      }
      //해당되는 게시글 가져오기(DB)
      BoardDTO bdto2 = boardDao.getArticle(bdto);
      logger.info("writer: "+bdto2.getWriter());
      //처리된 결과를 controller에게 전달하기 위해 담기
      Map<String, Object> cmap = new HashMap<String, Object>();
      cmap.put("pdto", pdto);
      cmap.put("bdto", bdto2);
      return cmap;
   }
}