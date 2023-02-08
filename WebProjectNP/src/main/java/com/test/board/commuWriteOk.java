package com.test.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/board/commuWriteOk.do")
public class commuWriteOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
        
        
        //1.
        req.setCharacterEncoding("UTF-8");
        

        MultipartRequest multi = null;
        
     
        String path = req.getRealPath("/asset/pic");
        int size = 1024 * 1024 * 100;
        
        System.out.println(path); //확인용
        
        multi = new MultipartRequest(
                    req,
                    path,
                    size,
                    "UTF-8",
                    new DefaultFileRenamePolicy()
        );
        
        
        String type = multi.getParameter("writeType");
        String title = multi.getParameter("title");
        String txt = multi.getParameter("txt");
        String file = multi.getFilesystemName("file");
        String memSeq = multi.getParameter("memSeq");
        
        if(type.equals("qnaBoard")) {
        	// qna게시판
           String category = multi.getParameter("qnaCategorySeq");
           
           qnaBoardDAO dao = new qnaBoardDAO();
           qnaBoardDTO dto = new qnaBoardDTO();
           
           dto.setQnaCategorySeq(category);
           dto.setQnaBoardTitle(title);
           dto.setQnaBoardTxt(txt);
           dto.setMemberSeq(memSeq);
           dto.setQnaBoardImg(file);
           
           int result = dao.write(dto);
           
           if (result == 1) {
               resp.sendRedirect("/np/community.do");
            } else {
               PrintWriter writer = resp.getWriter();
               writer.print("<script>");
               writer.print("alert('failed');");
               writer.print("history.back();");
               writer.print("</script>");
               writer.close();   
            }
           
        } else {
           
           // 자유게시판
           freeBoardDAO dao = new freeBoardDAO();
           boardDTO dto = new boardDTO();
           
           dto.setFreeBoardTitle(title);
           dto.setFreeBoardTxt(txt);
           //dto.setMemberSeq((String)session.getAttribute("auth"));
           dto.setMemberSeq(memSeq);
           dto.setFreeBoardImage(file);
           
           int result = dao.write(dto);
           
           if (result == 1) {
              resp.sendRedirect("/np/community.do");
           } else {
              PrintWriter writer = resp.getWriter();
              writer.print("<script>");
              writer.print("alert('failed');");
              writer.print("history.back();");
              writer.print("</script>");
              writer.close();   
           }
        }
		
	}

}