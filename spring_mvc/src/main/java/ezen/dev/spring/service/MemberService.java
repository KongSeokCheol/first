package ezen.dev.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ezen.dev.spring.MemberVo;
import ezen.dev.spring.memberdao.MemberDao;

@Service
public class MemberService {
	
	private MemberDao memberDao;
	
	@Autowired
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	//회원가입 처리 메소드
	public int join(MemberVo memberVo) {
		int result=0;
		
		result = memberDao.joinMember(memberVo);
		
		return result;
			
	}

}
