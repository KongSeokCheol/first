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
	// DB 연결 구문
	public PlatformDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();		
	}
	// 게시판 Wirte시 insert 하는 구문
	public int insertPlatform(String subject, String content, String writer, String ip, int midx, String filename, int view_count) {
		int value=0;
		
		String sql="insert into pc_platform (originbidx, depth, level_, subject, content, writer, ip, midx, filename, view_count)"
				+ " select max(bidx)+1,0,0,?,?,?,?,?,?,0 from  pc_platform";
		
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
	// Search 및 Pageing 하는 구문
	public ArrayList<PlatformVo> PlatformSelectAll(SearchCriteria scri){
		ArrayList<PlatformVo> alist = new ArrayList<PlatformVo>();
		ResultSet rs = null;
		String str ="";
		if (scri.getSearchType().equals("subject")) {
			str = "and subject like concat (?)"; 
		}else {
			str = "and writer like concat (?)";
		}
		
		String sql = "SELECT * FROM pc_platform WHERE delyn='N' "+str+" ORDER BY originbidx DESC, depth asc limit ?,10";
					
		
		try {						
			pstmt =  conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			rs= pstmt.executeQuery();
			
			//�떎�쓬媛믪씠 議댁옱�븯硫� true�씠怨� 洹� �뻾�쑝濡� 而ㅼ꽌媛� �씠�룞�븳�떎
			while(rs.next()) {
				PlatformVo pv = new PlatformVo();
				pv.setBidx(rs.getInt("bidx"));		//rs�뿉 蹂듭궗�맂 bidx瑜� pv�뿉 �삷寃⑤떞�뒗�떎		
				pv.setSubject(rs.getString("subject"));
				pv.setWriter(rs.getString("writer"));
				pv.setWriteday(rs.getString("writeday"));
				pv.setLevel_(rs.getInt("level_"));
				pv.setView_count(rs.getInt("view_count"));
				alist.add(pv);   //媛곴컖�쓽 pv媛앹껜瑜� alist�뿉 異붽��븳�떎
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
		CountUpdate(bidx); //議고쉶�닔 利앷�
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
		return -1;//�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
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
			//�듃�옖�옲�뀡
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
	
