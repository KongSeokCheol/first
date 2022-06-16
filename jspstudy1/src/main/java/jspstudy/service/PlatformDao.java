package jspstudy.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import jspstudy.dbconn.Dbconn;
import jspstudy.domain.PlatformVo;
import jspstudy.domain.Criteria;
import jspstudy.domain.SearchCriteria;

public class PlatformDao {
	
	Connection conn;
	PreparedStatement pstmt;
	
	public PlatformDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();		
	}
	
	public int insertPlatform(String subject, String content, String writer, String ip, int midx, String filename, int view_count) {
		int value=0;
		
		String sql="INSERT INTO PC_PLATFORM(bidx,originbidx,depth,level_,subject,content,writer,ip,midx,filename,view_count) "
				+ "VALUES(bidx_b_seq.nextval,bidx_b_seq.nextval,0,0,?,?,?,?,?,?,0)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setString(4, ip);
			pstmt.setInt(5, midx);
			pstmt.setString(6, filename);
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
		}		
		
		return value;
	}
	
	public ArrayList<PlatformVo> PlatformSelectAll(SearchCriteria scri){
		ArrayList<PlatformVo> alist = new ArrayList<PlatformVo>();
		ResultSet rs = null;
		String str ="";
		if (scri.getSearchType().equals("subject")) {
			str = "and subject like concat (?) "; 
		}else {
			str = "and writer like concat (?)";
		}
		
		String sql = "SELECT * FROM PC_PLATFORM ORDER by bidx desc limit 0,15";

					
		
		try {						
			pstmt =  conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			//다음값이 존재하면 true이고 그 행으로 커서가 이동한다
			while(rs.next()) {
				PlatformVo pv = new PlatformVo();
				pv.setBidx(rs.getInt("bidx"));		//rs에 복사된 bidx를 pv에 옮겨담는다		
				pv.setSubject(rs.getString("subject"));
				pv.setWriter(rs.getString("writer"));
				pv.setWriteday(rs.getString("writeday"));
				pv.setLevel_(rs.getInt("level_"));
				pv.setView_count(rs.getInt("view_count"));
				alist.add(pv);   //각각의 pv객체를 alist에 추가한다
			}					
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
						
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
				
		return alist;
	}
		
	public PlatformVo PlatformSelectOne(int bidx) {
		CountUpdate(bidx); //조회수 증가
		PlatformVo pv = null;
		ResultSet rs = null;
		
		String sql="select * from PC_Platform where bidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {				
				pv = new PlatformVo();
				pv.setBidx(rs.getInt("bidx"));
				pv.setOriginbidx(rs.getInt("originbidx"));
				pv.setDepth(rs.getInt("depth"));
				pv.setLevel_(rs.getInt("level_"));
				pv.setSubject(rs.getString("subject"));
				pv.setContent(rs.getString("content"));
				pv.setWriter(rs.getString("writer"));
				pv.setWriteday(rs.getNString("writeday"));
				pv.setFilename(rs.getString("filename"));
				pv.setView_count(rs.getInt("view_count"));

			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		return pv;
	}
	
	public int updatePlatform(String subject,String content,String writer,String ip, int midx, int bidx, int view_count) {
		int value=0;
		
		String sql1="update PC_Platform set subject=?, content=?, writer=?, ip=?, midx=?, writeday=sysdate where bidx=?, view_count";
		
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setString(4, ip);
			pstmt.setInt(5, midx);
			pstmt.setInt(6, bidx);
			pstmt.setInt(7, view_count);
			value= pstmt.executeUpdate();

			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
		}		
		
		return value;
	}
		
	public int CountUpdate(int bidx) {
		String sql = "UPDATE PC_Platform set view_count=view_count+1 where bidx= ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			return pstmt.executeUpdate();		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	    }

	public int deletePlatform(int bidx) {
		int value=0;
		
		String sql="update PC_PLATFORM set delyn='Y', writeday=sysdate where bidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			value= pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
		}		
		
		return value;
	}
	
	public int replyPlatform(PlatformVo pv) {
		
		System.out.println("replyPlatform");
		int value=0;
		
		String sql1="update PC_Platform set depth=depth+1 where originbidx=? and depth > ?";
		
		String sql2="insert into PC_Platform(bidx,originbidx,depth,level_,subject,content,writer,ip,midx,view_count) "
				+ "VALUES(bidx_b_seq.nextval,?,?,?,?,?,?,?,?,?)";
		
		try {
			//트랜잭션
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, pv.getOriginbidx());
			pstmt.setInt(2, pv.getDepth());			
			value = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, pv.getOriginbidx());
			pstmt.setInt(2, pv.getDepth()+1);	
			pstmt.setInt(3, pv.getLevel_()+1);
			pstmt.setString(4, pv.getSubject());
			pstmt.setString(5, pv.getContent());
			pstmt.setString(6, pv.getWriter());
			pstmt.setString(7, pv.getIp());
			pstmt.setInt(8, pv.getMidx());
			pstmt.setInt(9, pv.getView_count());
			value = pstmt.executeUpdate();	
			
			conn.commit();
			
		} catch (SQLException e) {	
			try {
				conn.rollback();
			} catch (SQLException e1) {				
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
		}		
		
		return value;
	}
	
	public int PlatformTotal(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		String str ="";
		if (scri.getSearchType().equals("subject")) {
			str = "and subject like ? "; 
		}else {
			str = "and writer like ?";
		}
		
		String sql = "select count(*) as cnt from PC_Platform where delyn='N' "+str+"";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
			 cnt = 	rs.getInt("cnt");
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			
		}try {
				rs.close();
				pstmt.close();
			//	conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
           return cnt;
    }

	}
	