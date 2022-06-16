package jspstudy.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jspstudy.dbconn.Dbconn;
import jspstudy.domain.MemberVo;

public class MemberDao {	
	//���ᰴü
	private Connection conn;
	//������ü
	private PreparedStatement pstmt;
	
	public MemberDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	public int insertMember(String memberNick, String memberId, String memberPwd, String memberName, String memberBirth, String memberGender, String memberPhone, String memberEmail, String memberip){
		int value=0;		
		
		String sql="insert into b_member(MIDX,MEMBERNICK,MEMBERID,MEMBERPWD,MEMBERNAME,MEMBERBIRTH,MEMBERGENDER,MEMBERPHONE,MEMBEREMAIL,MEMBERIP)" 
				+ "values(midx_b_seq.nextval,?,?,?,?,?,?,?,?,?)";
			
		//������ �����ϱ� ���� �������� Ŭ������ �����Ѵ�
		try{
		//	Statement stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNick);
			pstmt.setString(2, memberId);
			pstmt.setString(3, memberPwd);
			pstmt.setString(4, memberName);
			pstmt.setString(5, memberBirth);
			pstmt.setString(6, memberGender);
			pstmt.setString(7, memberPhone);
			pstmt.setString(8, memberEmail);
			pstmt.setString(9, memberip);
			value = pstmt.executeUpdate();		
			
		}catch(Exception e){
			e.printStackTrace();
}
		
		return value;
}

	public ArrayList<MemberVo> memberSelectAll(){	
		//��ü����
		ArrayList<MemberVo> alist  = new ArrayList<MemberVo>();
		ResultSet rs = null;
		String sql="select * from b_member where delyn='N' order by midx asc";
		
		try{
			//Connection ��ü�� ���ؼ� ���ڿ��� ����ȭ ��Ų��
			pstmt = conn.prepareStatement(sql);
			//���� �����͸� �״�� �����ؼ� ��� Ŭ���� ResultSet 
			rs = pstmt.executeQuery();
			//�ݺ��� ���� . rs.next()�� ���� �࿡ ���� �ִ��� true ������ false..������ �� ������ �̵�
			while(rs.next()){
				
				//��ü����		
				MemberVo mv = new MemberVo();
				//�Űܴ��
				mv.setMidx(rs.getInt("midx"));
				mv.setMemberNick(rs.getString("membernick"));
				mv.setMemberName(rs.getString("membername"));
				mv.setMemberPhone(rs.getString("memberphone"));
				mv.setMemberEmail(rs.getString("memberemail"));
				mv.setWriteday(rs.getString("writeday"));
				// ���� mv�� alist�� �߰��Ѵ�
				alist.add(mv);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			rs.close();
			pstmt.close();
			conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		
		return alist;
	}
	
	public MemberVo memberLogin(String memberId, String memberPwd) {
		ResultSet rs = null;
		MemberVo mv = null;
		String sql="select * from b_member where delyn='N'and memberid=? and memberpwd=?";
		
	  try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mv = new MemberVo();
				mv.setMidx(rs.getInt("midx"));
				mv.setMemberId(rs.getString("memberId"));	
				mv.setMemberNick(rs.getString("memberNick"));
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
		
		
		return mv;
	}
	public int registerCheck1(String memberNick) {
			int nickCheck= 0; // 0 : �ߺ� �г��� ���� 
			String sql= "select count(*) from b_member where membernick = ?";
			ResultSet rs = null;
					
	try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, memberNick);
			 
			 rs = pstmt.executeQuery();
			 
			 rs.next();
			 
			 nickCheck=rs.getInt(1);
			
	    } catch(SQLException e) {
				 e.printStackTrace();
				 return -1;
		
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();		
			 } catch(SQLException e) {
				 e.printStackTrace();
			
		}
			
		}
		   return nickCheck;
}
	
	public int registerCheck2(String memberId) {
			int idCheck = 0; // 0 : �ߺ� ���̵� ���� 
			String sql= "select count(*) from b_member where memberId = ?";
			ResultSet rs = null;
					
	    try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, memberId);
			 
			 rs = pstmt.executeQuery();
			 
			 rs.next();
			 
			 idCheck=rs.getInt(1);
			
	    } catch(SQLException e) {
				 e.printStackTrace();
				 return -1;
		
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();		
			 } catch(SQLException e) {
				 e.printStackTrace();
			
		}
			
		}
		   return idCheck;
	  }
	
  }
	
	

