package jspstudy.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jspstudy.domain.MemberVo;
import jspstudy.service.MemberDao;


@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//주소의 풀경로를 추출
		String uri = request.getRequestURI();
		//프로젝트 이름을 추출
		String pj= request.getContextPath();
		//프로젝트 이름을 뺀 나머지 가상경로를 추출
		String command= uri.substring(pj.length());
		System.out.println("command:"+command);
		
		
		
		
		if (command.equals("/member/memberJoinAction.do")) {
			
			//input 객체의 이름을 담은 파라미터를 호출하면 그 객체의 값을 리턴한다
			String memberNick = request.getParameter("memberNick");
			String memberId = request.getParameter("memberId");
			String memberPwd = request.getParameter("memberPwd");
			String memberName = request.getParameter("memberName");
			String memberBirth = request.getParameter("memberName");
			String memberGender = request.getParameter("memberGender");
			String memberPhone = request.getParameter("memberPhone");
			String memberEmail = request.getParameter("memberEmail");
			//여러개의 값을 담은 객체의 이름을 호출하면 배열형태의 값을 리턴한다
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			MemberDao md = new MemberDao();
			int value = md.insertMember(memberNick,memberId,memberPwd,memberName,memberBirth,memberGender,memberPhone,memberEmail,ip);
			
		//	PrintWriter out = response.getWriter();
			if (value==1){
				response.sendRedirect(request.getContextPath()+"/member/memberJoinOk.jsp");
				
			//out.println("<script>alert('회원가입성공');location.href='"+request.getContextPath()+"/MainHome.jsp'</script>");			
			}else{
				response.sendRedirect(request.getContextPath()+"/member/memberJoin.do");
				//out.println("<script>alert('회원가입실패');location.href='./memberjoin.jsp'</script>");
			}	
			
		}else if (command.equals("/member/memberJoin.do")) {
			//회원가입 페이지로 들어오면 처리를 함
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberJoin.jsp");
			rd.forward(request, response);	
		
	    }else if (command.equals("/member/CheckResultNick.do")) {
			
	        String memberNick = request.getParameter("memberNick");
	    	
	    	int nickCheck = new MemberDao().registerCheck1(memberNick);
	    	
	    	request.setAttribute("nickCheck" , nickCheck);
	    	
			RequestDispatcher rd = request.getRequestDispatcher("/member/CheckResultNick.jsp");
			rd.forward(request, response);	
			
	    }else if (command.equals("/member/CheckResultId.do")) {
	    	
	    	String memberId = request.getParameter("memberId");
	    	
	    	int idCheck = new MemberDao().registerCheck2(memberId);
	    	
	    	request.setAttribute("idCheck" , idCheck);
	    	
			RequestDispatcher rd = request.getRequestDispatcher("/member/CheckResultId.jsp");
			rd.forward(request, response);	
			
		}else if (command.equals("/member/memberList.do")) {
			//md에 값을 담는다.
			MemberDao md = new MemberDao();
			ArrayList<MemberVo> alist = md.memberSelectAll();
			
			request.setAttribute("alist", alist);			
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberList.jsp");
			rd.forward(request, response);	
			
		}else if (command.equals("/member/memberLogin.do")) {
						
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberLogin.jsp");
			rd.forward(request, response);	
			
			
		}else if (command.equals("/member/memberLoginAction.do")) {
			
			//1. 넘어온 값을 받는다
			String memberId = request.getParameter("memberId");
			String memberPwd = request.getParameter("memberPwd");
					
			//2.처리
			MemberDao md = new MemberDao();
			MemberVo mv = md.memberLogin(memberId, memberPwd);
			
			HttpSession session = request.getSession();
			
			//3.이동
		  if (mv != null) {
				session.setAttribute("midx", mv.getMidx());	
				session.setAttribute("memberId", mv.getMemberId());
				session.setAttribute("memberNick", mv.getMemberNick());
				session.setAttribute("admin",mv.getadmin());
				
				if (session.getAttribute("saveUrl") != null) {
					response.sendRedirect((String)session.getAttribute("saveUrl"));
				}else{ 
					
				}
				if(memberId.equals("admin")) {
					response.sendRedirect(request.getContextPath()+"/index3.jsp");
					  
				}else {					
					response.sendRedirect(request.getContextPath()+"/index2.jsp");
				}
			
			}else {				
				response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");				
			}
			
	    }else if (command.equals("/member/memberLogout.do")) {
			
	        HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect(request.getContextPath()+"/");
	    }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
