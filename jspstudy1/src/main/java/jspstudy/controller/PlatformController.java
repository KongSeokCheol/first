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
		
		String uploadPath = "E:\\Open Api(B)\\dev\\jspstudy\\src\\main\\webapp\\";
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
			
			//�뿴嫄곗옄�뿉 ���옣�맆 �뙆�씪�쓣 �떞�뒗 媛앹껜瑜� �깮�꽦�븳�떎
			Enumeration files = multi.getFileNames();
			//�떞湲� �뙆�씪�쓽 媛앹껜�쓽 �뙆�씪 �씠由꾩쓣 �뼸�뒗�떎
			String file = (String)files.nextElement();
			//���옣�릺�뒗 �뙆�씪�씪
			String fileName= multi.getFilesystemName(file);
			//�썝�옒 �뙆�씪�씠由�
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
			System.out.println("�뵆�옯�뤌 由ъ뒪�듃 �뱾�뼱�솕�쓬");
			
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
			//泥섎━			
			PlatformDao pd = new PlatformDao();
			int cnt = pd.PlatformTotal(scri);			
		//	System.out.println("cnt"+cnt);
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);			
			
			ArrayList<PlatformVo> alist = pd.PlatformSelectAll(scri);
			request.setAttribute("alist", alist);   //�뜲�씠�꽣(�옄�썝) 怨듭쑀
			request.setAttribute("pm", pm);
			
			//�씠�룞
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformList.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/Platform/PlatformContent.do")) {
			System.out.println("�궡�슜蹂닿린 �뱾�뼱�솕�쓬");
			//1.�뙆�씪誘명꽣媛� �꽆�뼱�샂
			String bidx = request.getParameter("bidx");
			int bidx_= Integer.parseInt(bidx);
			
			//2. 泥섎━�븿
			PlatformDao pd = new PlatformDao();
			PlatformVo pv = pd.PlatformSelectOne(bidx_);
			
			request.setAttribute("pv", pv);		//�궡遺��쟻�쑝濡� �옄�썝怨듭쑀	
			
			//3.�씠�룞�븿			
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformContent.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/Platform/PlatformModify.do")) {
			
			System.out.println("�닔�젙 �뱾�뼱�솕�쓬");
			//1.�뙆�씪誘명꽣媛� �꽆�뼱�샂
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			//2. 泥섎━�븿
			PlatformDao pd = new PlatformDao();
			PlatformVo pv = pd.PlatformSelectOne(bidx_);
			
			request.setAttribute("pv", pv);		//�궡遺��쟻�쑝濡� �옄�썝怨듭쑀	
			
			//3.�씠�룞�븿			
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
			int bidx_ = Integer.parseInt(bidx);
			
			request.setAttribute("bidx", bidx);
			
			RequestDispatcher rd = request.getRequestDispatcher("/Platform/PlatformDelete.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/Platform/PlatformDeleteAction.do")) {
		
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
						
			PlatformDao pd = new PlatformDao();
			int value = pd.deletePlatform(bidx_); 
			
			if (value ==1) {
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
			//�뙆�씪�씠由꾩쓣 �꽆寃⑤컺�뒗�떎
			String filename = 	request.getParameter("filename");
			//�뙆�씪�쓽 �쟾泥� 寃쎈줈
			String filePath = saveFullPath + File.separator+filename; 			
			Path source = Paths.get(filePath);
			String mimeType = Files.probeContentType(source);
			//�뿤�뜑�젙蹂댁뿉 異붿텧�븳 �뙆�씪�삎�떇�쓣 �떞�뒗�떎 
			response.setContentType(mimeType);
			
			String sEncoding = new String(filename.getBytes("UTF-8"));
			//�뿤�뜑�젙蹂댁뿉 �뙆�씪�씠由꾩쓣 �떞�뒗�떎
			response.setHeader("Content-Disposition" , "attachment;fileName="+sEncoding);
			
			//�빐�떦�쐞移섏뿉 �엳�뒗 �뙆�씪�쓣 �씫�뼱�뱾�씤�떎.
			FileInputStream fileInputStream  = new FileInputStream(filePath);
			//�뙆�씪�벐湲� 
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
	
