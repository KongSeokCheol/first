package ezen.dev.spring.memberdao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.MemberVo;

@Repository
public class MemberDao {
	
	//MyBatis를 이용해서 DB작업 : sqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.member";
	
	@Autowired
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
  public int joinMember(MemberVo memberVo) {
	  //sqlSession 객체를 이용한 입력작업 : insert(Mapper 파일의 네임스페이스.id값 , 입력값/입력객체)
	  
	  return sqlSession.insert(MAPPER+".joinMember" , memberVo);
  }
  }