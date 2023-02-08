package com.test.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.notice.noticeDTO;

@WebServlet("/admin/noticeAddOk.do")
public class NoticeAddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		MultipartRequest multi = null;
		
		
		String path = req.getRealPath("/asset/images");
		int size = 1024*1024*100; //100메가
		
		System.out.println(path);
		
		multi = new MultipartRequest(req,
									path,
									size,
									"UTF-8",
									new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");
		
		noticeDTO dto = new noticeDTO();
		
		dto.setNoticeSubject(title);
		dto.setNoticeContent(content);
		dto.setNoticeImg(img);
		
		AdminDAO dao = new AdminDAO();
		
		int result = dao.addNotice(dto);
		
		if(result==1) {
			resp.sendRedirect("/np/admin/chart.do?type=notice");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('상품등록에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();
		}
		

	}

}