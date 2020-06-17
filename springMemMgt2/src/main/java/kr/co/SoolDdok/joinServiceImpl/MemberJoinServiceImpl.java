package kr.co.SoolDdok.joinServiceImpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.SoolDdok.DAO.MemberDAO;
import kr.co.SoolDdok.DTO.MemberDTO;
import kr.co.SoolDdok.joinService.MemberJoinService;

@Service("memberJoinService")
public class MemberJoinServiceImpl implements MemberJoinService {
	private static final Logger logger = LoggerFactory.getLogger(MemberJoinServiceImpl.class);
	@Resource
	   MemberDAO memberDao;
	
	@Override
	public MemberDTO joinArticle(MemberDTO mdto) {
		return mdto;
	}

	@Override
	public void joinProArticle(MemberDTO mdto, HttpServletRequest request, HttpServletResponse response) {
		memberDao.getJoin(mdto);
	}
	
	
}
