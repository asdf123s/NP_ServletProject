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

@WebServlet("/admin/noticeEditOk.do")
public class NoticeEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		MultipartRequest multi = null;

		String path = req.getRealPath("/asset/images");
		int size = 1024 * 1024 * 100; // 100메가

		System.out.println(path);

		multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());

		String seq = multi.getParameter("seq");
		String subject = multi.getParameter("title");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("img");

		AdminDAO dao = new AdminDAO();

		noticeDTO dto = new noticeDTO();

		dto.setNoticeSubject(subject);
		dto.setNoticeContent(content);
		dto.setNoticeSeq(seq);
		dto.setNoticeImg(img);

		int result = dao.noticeEdit(dto);

		if (result == 1) {
			resp.sendRedirect("/np/admin/boardViewDetail.do?type=notice&seq=" + seq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>");
			writer.print("alert('수정에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.close();
		}

	}

}