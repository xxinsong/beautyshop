package com.qimeng.bs.admin.pay;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class BankServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
		request.setCharacterEncoding("utf-8");//	
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("market/pay/banksend.jsp"); 
		requestDispatcher.forward(request, response); 
	}
}