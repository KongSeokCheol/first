package jspstudy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import jspstudy.domain.PageMaker;
import jspstudy.domain.PlatformVo;
import jspstudy.domain.Criteria;
import jspstudy.domain.SearchCriteria;
import jspstudy.service.PlatformDao;


@WebServlet("/PlatformController")
public class PlatformController extends HttpServlet {
	private static final long serialVersionUID = 1L;     
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String uri = request.getRequestURI();		
		String pj= request.getContextPath();	
		String command= uri.substring(pj.length());
		System.out.println("command:"+command);
		
		String uploadPath = "C:\\Users\\MYCOM\\git\\first\\jspstudy1\\src\\main\\webapp\\";
		String saveFolder ="images";	
		String saveFullPath = uploadPath+saveFolder; 
		
		if (command.equals("/Platform/PlatformWrite.do")){
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformWrite.jsp");
			rd.forward(request, response);
			
		}else if (command.equals("/Platform/PlatformWriteAction.do")) {			
				
			int sizeLimit = 1024*1024*15;		
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(request,saveFullPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy() );
			
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String writer = multi.getParameter("writer");
			
			//????????????????????? ?????????????????? ?????????????????? ???????????? ??????????????? ????????????????????????
			Enumeration files = multi.getFileNames();
			//???????????? ?????????????????? ??????????????? ???????????? ??????????????? ??????????????????
			String file = (String)files.nextElement();
			//???????????????????????? ??????????????????
			String fileName= multi.getFilesystemName(file);
			//???????????? ????????????????????????
			String originFileName = multi.getOriginalFileName(file);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			PlatformDao pd = new PlatformDao();
			int view_count = 0;
			int value = pd.insertPlatform(subject, content, writer, ip, midx, fileName, view_count);
			System.out.println(value);
			if (value ==1) {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformList.do");				
			}else {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformWrite.do");					
			}
			
		}else if (command.equals("/Platform/PlatformList.do")) {
			System.out.println("?????????????????? ?????????????? ????????????????????????");
			
			String page = request.getParameter("page");
			if (page == null) page ="1";
			int pagex= Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if (keyword == null) keyword="";
			String searchType = request.getParameter("searchType");
			if (searchType ==null) searchType= "subject";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			scri.setSearchType(searchType);			
			//?????????			
			PlatformDao pd = new PlatformDao();
			int cnt = pd.PlatformTotal(scri);			
		//	System.out.println("cnt"+cnt);
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);			
			
			ArrayList<PlatformVo> alist = pd.PlatformSelectAll(scri);
			request.setAttribute("alist", alist);   //??????????????????(????????????) ?????????
			request.setAttribute("pm", pm);
			
			//????????????
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformList.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/Platform/PlatformContent.do")) {
			System.out.println("????????????????????? ????????????????????????");
			//1.??????????????????????????? ??????????????????
			String bidx = request.getParameter("bidx");
			int bidx_= Integer.parseInt(bidx);
			
			//2. ???????????????
			PlatformDao pd = new PlatformDao();
			PlatformVo pv = pd.PlatformSelectOne(bidx_);
			
			request.setAttribute("pv", pv);		//?????????????????????????????? ?????????????????????	
			
			//3.??????????????????			
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformContent.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/Platform/PlatformModify.do")) {
			
			System.out.println("???????????? ????????????????????????");
			//1.??????????????????????????? ??????????????????
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			//2. ???????????????
			PlatformDao pd = new PlatformDao();
			PlatformVo pv = pd.PlatformSelectOne(bidx_);
			
			request.setAttribute("pv", pv);		//?????????????????????????????? ?????????????????????	
			
			//3.??????????????????			
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformModify.jsp");					
			rd.forward(request, response);		
			
		}else if (command.equals("/Platform/PlatformModifyAction.do")) {
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			int view_count = 0;
			PlatformDao pd = new PlatformDao();
			int value = pd.updatePlatform(subject, content, writer, ip, midx, bidx_, view_count);
			System.out.println(value);
			if (value ==1) {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformContent.do?bidx="+bidx);				
			}else {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformModify.do?bidx="+bidx);				
			}	
			
		}else if (command.equals("/Platform/PlatformDelete.do")) {
			String bidx = request.getParameter("bidx");
			int bidx1 = Integer.parseInt(bidx);
			
			request.setAttribute("bidx", bidx1);
			
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformDelete.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/Platform/PlatformDeleteAction.do")) {
		
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
						
			PlatformDao pd = new PlatformDao();
			int value = pd.deletePlatform(bidx_); 
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformList.do");				
			}else {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformContent.do?bidx="+bidx);				
			}	
		}else if (command.equals("/Platform/PlatformReply.do")) {
			
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
			
			
			PlatformVo pv = new PlatformVo();
			pv.setBidx(Integer.parseInt(bidx));
			pv.setOriginbidx(Integer.parseInt(originbidx));
			pv.setDepth(Integer.parseInt(depth));
			pv.setLevel_(Integer.parseInt(level_));
			
			
			request.setAttribute("pv", pv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformReply.jsp");					
			rd.forward(request, response);
			
		} else if (command.equals("/Platform/PlatformReplyAction.do")) {
			
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			String ip = InetAddress.getLocalHost().getHostAddress();
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			PlatformVo pv = new PlatformVo();
			pv.setBidx(Integer.parseInt(bidx));
			pv.setOriginbidx(Integer.parseInt(originbidx));
			pv.setDepth(Integer.parseInt(depth));
			pv.setLevel_(Integer.parseInt(level_));
			pv.setSubject(subject);
			pv.setContent(content);
			pv.setWriter(writer);
			pv.setIp(ip);
			pv.setMidx(midx);
			pv.setView_count(midx);
		
			PlatformDao pd = new PlatformDao();
			int value = pd.replyPlatform(pv);
			
			if (value ==1) {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformList.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/Platform/PlatformContent.do?bidx="+bidx);
			}
			
		}else if (command.equals("/Platform/fileDownload.do")) {
			//??????????????????????????? ???????????????????????????
			String filename = 	request.getParameter("filename");
			//?????????????????? ???????????? ?????????
			String filePath = saveFullPath + File.separator+filename; 			
			Path source = Paths.get(filePath);
			String mimeType = Files.probeContentType(source);
			//??????????????????????????? ??????????????? ?????????????????????????????? ?????????????????? 
			response.setContentType(mimeType);
			
			String sEncoding = new String(filename.getBytes("UTF-8"));
			//??????????????????????????? ??????????????????????????? ??????????????????
			response.setHeader("Content-Disposition" , "attachment;fileName="+sEncoding);
			
			//??????????????????????????? ???????????? ?????????????????? ??????????????????????????????.
			FileInputStream fileInputStream  = new FileInputStream(filePath);
			//???????????????????????? 
			ServletOutputStream servletOutStream = response.getOutputStream();
			
			byte[] b = new byte[4096];
			int read= 0;
		    while((read = fileInputStream.read(b, 0, b.length))!= -1) {
		    	servletOutStream.write(b, 0, read);		    	
		    }
			
		    servletOutStream.flush();
		    servletOutStream.close();
		    fileInputStream.close();
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
	
