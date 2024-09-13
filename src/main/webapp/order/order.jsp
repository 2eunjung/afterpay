<%@ page import="com.jhta.afterpay.addr.AddrDao" %>
<%@ page import="com.jhta.afterpay.addr.Addr" %>
<%@ page import="com.jhta.afterpay.order.UserDto" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%

    // 쿼리 파라미터
    String address = request.getParameter("address");   // 주소
    String detailAddr = request.getParameter("detailAddress");  // 상세주소
    String tel = request.getParameter("tel");       // 전화번호
    String zipcode = request.getParameter("zipcode");   // 우편번호
    String email = request.getParameter("email");   // 이메일
    String recipient = request.getParameter("recipient");   //수령인

    // 배송지 저장
    AddrDao addrDao = new AddrDao();
    Addr addr = new Addr();
    UserDto user = new UserDto();
    user.setNo(6);
    addr.setUser(user);
    addr.setName("집");
    addr.setAddr1(address);
    addr.setAddr2(detailAddr);
    addr.setTel(tel);
    addr.setZipCode(zipcode);
    addr.setIsAddrHome("Y");

    addrDao.insertAddr(addr);

    response.sendRedirect("../index.jsp");
%>
