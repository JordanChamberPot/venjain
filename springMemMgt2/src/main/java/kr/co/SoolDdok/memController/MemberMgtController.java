package kr.co.SoolDdok.memController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.SoolDdok.DTO.MemberDTO;
import kr.co.SoolDdok.joinService.MemberJoinService;

@Controller
public class MemberMgtController {
//controller만들기
private static final Logger logger = LoggerFactory.getLogger(MemberMgtController.class);

//DI(Dependency Injection)
@Autowired
private MemberJoinService memberJoinService; //getArticle(s) : boardList, content
/*
   회원테이블은 memtb 키는 번호(차례대로 변하는 번호), id가 복합키
   회원이름,전화번호,성별,생년월일,가입일
   회원관리
   -->회원가입,idcheck해서 같은 아이디 안되게 할 것임(ajax)
   -->회원탈퇴
   -->회원수정
   -->관리자가 회원정보 -회원리스트
   
   나중에
   -->메뉴ㅘ면 나오고
   -->로그인하면 세션 유지하고 자신의 정보 확인
*/
	@RequestMapping(value="/join.sd")
	public String getJoin(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO mdto	) {
		memberJoinService.joinArticle(mdto);
		model.addAttribute("mdto", mdto);
		return "homepage/join";
	}

	@RequestMapping(value="/joinPro.sd")
	public String joinPro(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO mdto) {
	    memberJoinService.joinProArticle(mdto, request, response);
		model.addAttribute("mdto", mdto);
		return "redirect:/join.sd";
	}
	
}
