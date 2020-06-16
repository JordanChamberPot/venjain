package kr.or.sol.board.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.sol.board.dto.BoardDTO;
import kr.or.sol.board.dto.PageDTO;
import kr.or.sol.board.service.BoardListService;
import kr.or.sol.board.service.BoardWriteService;


@Controller
public class BoardController {
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   //DI(Dependency Injection)
   @Autowired
   private BoardListService boardListService; //getArticle(s) : boardList, content
   //write에 해당되는 것
   @Autowired
   private BoardWriteService boardWriteService; //getArticle(s) :
   /*
     DI 방법 어노테이션 |@Autowired    |@inject    |  @Resource     -- 타입이 틀리면 에러남(모두)
                    지원자    |   스프링전용       |자바에서 지원   |  자바에서 지원
            연결방식    | 타입에 맞춰서       |타입에 맞춰서   |  이름으로 연결
            
    */
   
   /*
     @Autowired    
       @Qualifier("BoardWriteServiceImpl")
     private BoardWriteService boardWriteService;
      좀 더 강력해짐(인젝션 기능??? 그냥 그렇다 이말이다 흠)
    */
   
   
   //갱신에 관계 된것, update, delete
   @RequestMapping(value = "/boardList.sp")
   public String boardList(HttpServletRequest request,
                     HttpServletResponse response, Model model, BoardDTO bdto, PageDTO pdto) {

      // service를 DI(Dependency Injection) 하고
      // 해당 service의 메소드를 호출한 후
      // model이나 기타 DTO 저장하여 view로 전달
      // 비즈니스 로직을 적지 않음
      pdto.setAllCount(boardListService.getAllcount());
      logger.info("전체라인레코드: "+pdto.getAllCount());
      List<BoardDTO> list=boardListService.getArticles(pdto);
      model.addAttribute("pdto", pdto);
      model.addAttribute("list", list);
      return "board2/boardList";
   }
   @RequestMapping(value="/content.sp")
   public String content(HttpServletRequest request,
         HttpServletResponse response, 
         Model model, BoardDTO bdto, PageDTO pdto) {
	   Map<String, Object> cmap = boardListService.getArticle(bdto,pdto); // 누군지 모르기 때문에 object로  
		model.addAttribute("bdto",(BoardDTO)cmap.get("bdto"));
		model.addAttribute("pdto",(PageDTO)cmap.get("pdto"));
      return "board2/content";
   }
   
   @RequestMapping(value="/writeForm.sp")
   public String writeForm(HttpServletRequest request,
                     HttpServletResponse response, 
                     Model model, BoardDTO bdto, PageDTO pdto) {
      PageDTO pdto2 = boardWriteService.writeArticle(pdto);
      model.addAttribute("pdto", pdto2);
      model.addAttribute("bdto", bdto); //받아온걸 다시 넣어주기
      return "board2/writeForm";
   }
   @RequestMapping(value="/writePro.sp")
   public String writePro(HttpServletRequest request,
                     HttpServletResponse response, 
                     Model model, BoardDTO bdto, PageDTO pdto) {
      if (pdto.getCurrentPage() == 0) {
         pdto.setCurrentPage(1);
      }
      if (pdto.getCurrentPageBlock() == 0) {
         pdto.setCurrentPageBlock(1);
      }
      
      logger.info("------------",bdto.getWriter());

      boardWriteService.writeProArticle(bdto, request, response);
      model.addAttribute("pdto", pdto);
      return "redirect:/boardList.sp";
//      return "board2/writePro";
   }


	@RequestMapping(value="/idCheck.sp")
	  public String idCheck() {
			return "board2/idCheck";
	}

	@RequestMapping(value="/updateForm.sp")
  	  public String updateForm(HttpServletRequest request,
              HttpServletResponse response, 
              Model model, BoardDTO bdto, PageDTO pdto) {
		 Map<String, Object> cmap = boardListService.getArticle(bdto, pdto);
	      model.addAttribute("pdto", (PageDTO)cmap.get("pdto"));
	      model.addAttribute("bdto", (BoardDTO)cmap.get("bdto"));
		return "board2/updateForm";
	}
	
	//updatePro 처리용
	@RequestMapping(value="/updatePro.sp")
	public String updatePro(HttpServletRequest request, HttpServletResponse response, Model model, BoardDTO bdto, PageDTO pdto) {
		//서비스 호출
		PageDTO pdto2 = boardWriteService.updatePro(pdto, bdto, request, response);
		model.addAttribute("pdto", pdto2);
		return "redirect:/boardList.sp";
		
	}
	
	@RequestMapping(value="/deletePro.sp")
	public String deletePro(HttpServletRequest request, HttpServletResponse response, Model model, BoardDTO bdto, PageDTO pdto) {
		//서비스 호출
		PageDTO pdto2 = boardWriteService.deletePro(pdto, bdto.getNum());
		model.addAttribute("pdto", pdto2);
		return "redirect:/boardList.sp";
		
	}
	
	
}