package kr.or.sol.board.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.sol.board.dao.BoardDAO;
import kr.or.sol.board.dto.BoardDTO;
import kr.or.sol.board.dto.PageDTO;
import kr.or.sol.board.service.BoardWriteService;
import kr.or.sol.board.web.BoardController;

@Service("BoardWriteService")
public class BoardWriteServiceImpl implements BoardWriteService {
	private static final Logger logger = LoggerFactory.getLogger(BoardWriteServiceImpl.class);
   @Resource
   BoardDAO boardDao;
   // writeForm에 해당되는거, DAO 필요없음
   @Override
   public PageDTO writeArticle(PageDTO pdto) {
      if (pdto.getCurrentPage() == 0) {
         pdto.setCurrentPage(1);
      }
      if (pdto.getCurrentPageBlock() == 0) {
         pdto.setCurrentPageBlock(1);
      }
      return pdto;
   }
   // writePro에 해당, DAO 필요

   @Override
   public void writeProArticle(BoardDTO bdto, HttpServletRequest request, HttpServletResponse response) {
            
       // Map<String, Object> multiDTO = ServletUpload.uploadEx(req, res); // DAO를 통해서
       // 받은 데이터 저장하기 dao.boardWrite((BoardDTO) multiDTO.get("dto"));
       // req.setAttribute("pdto", (PageDTO) multiDTO.get("pdto")); 
       // return null;
       //  number 구하기(새로운 num)
       int number = boardDao.getNewNum(); 
       //   num==0 는 제목글
       // num이 0이 아니면 답글*/      
      if(bdto.getNum()==0) {
         bdto.setNum(number);
         bdto.setRef(number);
         bdto.setRe_level(1);
         bdto.setRe_step(1);
      }else {
         bdto.setNum(number);         
         bdto.setRe_level(bdto.getRe_level()+1);
         bdto.setRe_step(bdto.getRe_step()+1);
      }
      logger.info("writer: "+bdto.getWriter());
      
      boardDao.boardWrite(bdto);
   }
   
   @Override
   public PageDTO updatePro(PageDTO pdto, BoardDTO bdto, HttpServletRequest request, HttpServletResponse response) {
	   //페이지에 대한 처리가 있어야 함
	   if (pdto.getCurrentPage() == 0) {
	         pdto.setCurrentPage(1);
	      }
	      if (pdto.getCurrentPageBlock() == 0) {
	         pdto.setCurrentPageBlock(1);
	      }
	   boardDao.boardUpdate(bdto);
	   return pdto;
   }

@Override
public PageDTO deletePro(PageDTO pdto, int num) {
	if (pdto.getCurrentPage() == 0) {
        pdto.setCurrentPage(1);
     }
     if (pdto.getCurrentPageBlock() == 0) {
        pdto.setCurrentPageBlock(1);
     }
     boardDao.deletePro(num);
	return pdto;
}
   
}