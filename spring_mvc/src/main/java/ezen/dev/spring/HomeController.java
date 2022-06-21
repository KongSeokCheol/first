package ezen.dev.spring;


import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ezen.dev.spring.service.MemberService;

@Controller
public class HomeController {
	
	private MemberService memberService;
	
	@Autowired
	public HomeController(MemberService memberService) {
		this.memberService = memberService;
		
	}
	
	//@RequestMapping("/home.do")//get,post방식 모두 요청 처리
	@GetMapping("/home.do")//get방식 요청 처리
	//@PostMapping("/home.do")
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@GetMapping("/join.do")
	public String join(Locale locale, Model model) {
		return "member/join";
	}
	
	@PostMapping("/joinProcess.do")
	public String joinProcess(MemberVo memberVo, Locale locale, Model model, HttpServletRequest request) {
		//요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		//이러한 객체를 커맨드 객체라고 함.
		
        int result=memberService.join(memberVo);
        
        String viewPage  = "home";
        if(result == 1) {
        	
		System.out.println("member_id: "+memberVo.getMember_id());
		
		//세션을 이용해서 member_id를 home.jsp페이지로 보냄
		HttpSession session = request.getSession();
		session.setAttribute("member_id", memberVo.getMember_id());
		
	    }else{
	    viewPage = "join";
	    }  			
	    return viewPage;
	}  
	
}
