package kr.co.SoolDdok.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.SoolDdok.DTO.MemberDTO;

@Repository("memberDao")
public class MemberDAO {
	//database 연결 위해 DI 필요
	@Autowired 
	SqlSession sqlsession; //connection pool의 컨넥션 정보
	
	
	private String prens= "dodoChat.entry.";
	
	public void getJoin(MemberDTO mdto) {
		sqlsession.insert(prens+"getJoin",mdto);
		
	}
	
}
