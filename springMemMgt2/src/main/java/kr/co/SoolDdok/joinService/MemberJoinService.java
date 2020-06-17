package kr.co.SoolDdok.joinService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.SoolDdok.DTO.MemberDTO;



public interface MemberJoinService {
	public MemberDTO joinArticle(MemberDTO mdto);
	public void joinProArticle(MemberDTO mdto, HttpServletRequest request,
             HttpServletResponse response);
}
