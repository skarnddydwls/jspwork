package com.study.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.study.dto.Person;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/operation.do")
public class OperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "");
		request.setAttribute("sTow", "");
		request.setAttribute("sThree", "안녕");
		
		request.setAttribute("pOne", new Person("", 20, ""));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> list1 = new ArrayList<>();
		request.setAttribute("aOne", list1);
		
		ArrayList<String> list2 = new ArrayList<>();
		list2.add("더조은아카데미");
		request.setAttribute("aTwo", list2);
		
		request.getRequestDispatcher("views/1_EL/02.elOperation.jsp").forward(request, response); // 이거 뭐임?
	}

}















