package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import common.dbutil.DBConnection;

public class BoardDAO {
	//DAO: Data Access Object
	//DB에 접근하여 처리하는 작업 모두를 수행하는 객체
	
	//DB 처리해야 할 일이 있으면 DAO인스턴스를 받아서
	//insert, delete 등 모든 작업을 모듈화 해 놓으면
	//다른 객체에서 호출해서 사용
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public int boardWrite(BoardDTO dto) throws NamingException, SQLException {
		Connection conn = DBConnection.getConnection();
		int cnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//글번호를 위한 변수
		int num = dto.getNum();
		int number = 0;
		int ref = dto.getRef();
		int re_step = dto.getRe_step();
		int re_level = dto.getRe_level();
		
		if(conn != null) {
			String sql = "";
				//새로운 글 번호 만들기
			//sql = "select boardnum_seq.nextval num from dual";
				sql = "select max(num)+1 num from board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt("num");
			}
			if(num == 0) {
				num = number;
				ref = num;
				re_step = 1;
				re_level = 1;
			}else if(num != 0) {
				num = number;
				re_step  += 1;
				re_level += 1;
				
			}

			sql = "insert into board(NUM,WRITER,SUBJECT,EMAIL,CONTENT,";
			sql += "PASSWD,REG_DATE,READCNT,REF,RE_STEP,RE_LEVEL, ATTACHNM)";
			sql += "values(?,?,?,?,?,?,";
			sql += "sysdate,0,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPasswd());
			pstmt.setInt(7, ref); //그룹
			pstmt.setInt(8, re_step); //답글의 재답글...
			pstmt.setInt(9, re_level); //답글의 깊이
			pstmt.setString(10, dto.getAttachNm());
			cnt = pstmt.executeUpdate();
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		return cnt;
	}
	
	public List<BoardDTO> getArticles(int sRow, int pageSize) throws NamingException, SQLException{
		String sql = "select a.*";
			   sql +=	"from (select rownum rr, rboard.*";                  
			   sql +=	"		from (select NUM,WRITER,SUBJECT,EMAIL,CONTENT,   ";
			   sql +=	"				PASSWD,REG_DATE,READCNT,REF,             ";
			   sql +=	"						RE_STEP, RE_LEVEL,ATTACHNM       ";
			   sql +=	"				from board                               ";
			   sql +=	"				order by ref desc, re_step asc)rboard) a ";
			   sql +=	"	where a.rr between ? and ?                           ";

		Connection conn = DBConnection.getConnection();
		
		List<BoardDTO> articles = new ArrayList<BoardDTO>(20);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,sRow);
		pstmt.setInt(2,pageSize);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			//하나의 정보를 저장하는 작업
			BoardDTO dto = new BoardDTO();
			dto.setRr(rs.getInt("rr"));
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setSubject(rs.getString("subject"));
			dto.setEmail(rs.getString("email"));
			dto.setContent(rs.getString("content"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setRef(rs.getInt("ref"));
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));
			dto.setAttachNm(rs.getString("attachNm"));
			articles.add(dto);
			
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		return articles;
		
	}
	
	public BoardDTO getArticle(int num) throws NamingException, SQLException {
		//조회수 수정하는 작업
		
		PreparedStatement pstmt = null;
		BoardDTO dto = new BoardDTO();
		ResultSet rs =null;
		//connection 얻기
		try {
		Connection conn = DBConnection.getConnection();
		pstmt = 
		conn.prepareStatement("Update board set readcnt = readcnt+1 where num = ?");
		pstmt.setInt(1,num);
		int i = pstmt.executeUpdate();
		if(i > 0) {
		String sql = "select NUM, WRITER,SUBJECT,";
		       sql += " SUBJECT, EMAIL, CONTENT, ";
		       sql += " PASSWD, REG_DATE, READCNT, ";
		       sql += " REF, RE_STEP, RE_LEVEL, ATTACHNM ";
		       sql += " from board ";
		       sql += " where num = ? ";
		//받은 num에 해당되는 데이터 갖고 오는 작업
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setSubject(rs.getString("subject"));
			dto.setEmail(rs.getString("email"));
			dto.setContent(rs.getString("content"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setRef(rs.getInt("ref"));
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));
			dto.setAttachNm(rs.getString("attachNm"));
		}
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//connection 닫기
		return dto;
		
	}
	
	public int boardUpdate(BoardDTO dto) throws NamingException, SQLException {
		int r = 0;
		PreparedStatement pstmt = null;
//		int num = dto.getNum();
//		int number = 0;
//		int ref = dto.getRef();
//		int re_step = dto.getRe_step();
//		int re_level = dto.getRe_level();
		
		try {
		String sql = "update board set";
			   sql += " SUBJECT=? ";
			   sql += ", EMAIL=? ";
			   sql += ", CONTENT=?";
			   sql += ", PASSWD=? ";
			   sql += ", ATTACHNM=? ";
			   sql += " where num =? ";
			   Connection conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPasswd());
				pstmt.setString(5, dto.getAttachNm());
				pstmt.setInt(6, dto.getNum());
			   r = pstmt.executeUpdate();
		}catch(NamingException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return r;
	}
	
	
	public int deleteArticle(int num) {
		int r = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from board where num =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			r = pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}
	
	public int getAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int allCnt = 0;
		//conn, pstmt, rs
		String sql = "select count(num) cnt from board";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				allCnt = rs.getInt("cnt");
			}
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//rs,pstmt, conn 닫기
		return allCnt;
	}
	
	
	
}
