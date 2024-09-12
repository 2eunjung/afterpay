<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
  <link href="/common/css/style.css" rel="stylesheet" >
  <title>AFTER PAY 마이페이지</title>
</head>
<style>
  h1{
    text-align: center;
  }
  #menu .list-group botton{
    text-decoration: none;
    text-emphasis-color: gray;
  }
</style>
<body>
<%@include file="../common/nav.jsp"%>
<div class="container">
  <div class="row mb-3">
    <div class="col-12">
      <h1>MyPage</h1>
      <hr style="border:solid 1px gray;">
    </div>
  </div>

  <div class="row mb-3">
    <div class="col-3">
      <img src="https://i.pinimg.com/474x/3e/c0/d4/3ec0d48e3332288604e8d48096296f3e.jpg" class="img-thumbnail rounded mx-auto d-block" width="90">
    </div>
    <div class="col-9">
      <table class="table table-borderless">
        <colgroup>
          <col width="10%">
          <col width="20%">
          <col width="*">
        </colgroup>
        <tr>
          <th class="text-end">아이디</th><td>홍홍홍</td>
          <td rowspan="2" class="align-middle text-end">
            <button class="btn btn-primary" type="submit">정보 수정</button>
          </td>
        </tr>
        <tr>
          <th class="text-end">등급</th><td>골드</td>
        </tr>
      </table>
    </div>
  </div>

  <hr style="border:solid 1px gray;" />

  <div class="row mb-3 ">
    <div class="col-12">
      <div class="btn-group  btn-group-lg w-100" role="group" aria-label="Basic outlined example">
        <a type="button" class="btn btn-outline-secondary">
          적립금<br/>
          30,000 원
        </a>
        <a type="button" class="btn btn-outline-secondary">
          후기<br/>
          3 건
        </a>
      </div>
    </div>
  </div>

  <div class="row mb-3">
    <div class="col-12">
      <div class="list-group">
        <a href="#" class="fs-5 mb-2 list-group-item list-group-item-action p-3 btn btn-outline-secondary">
          주문 내역
        </a>
        <a href="#" class="fs-5 mb-2 list-group-item list-group-item-action p-3 btn btn-outline-secondary">
          취소/반품/교환 내역
        </a>
        <a href="#" class="fs-5 mb-2 list-group-item list-group-item-action p-3 btn btn-outline-secondary">
          장바구니
        </a>
        <a href="#" class="fs-5 mb-2 list-group-item list-group-item-action p-3 btn btn-outline-secondary">
          위시리스트
        </a>
        <a href="#" class="fs-5 mb-2 list-group-item list-group-item-action p-3 btn btn-outline-secondary">
          상품 문의 내역
        </a>
        <a href="#" class="fs-5 mb-2 list-group-item list-group-item-action p-3 btn btn-outline-secondary">
          공지사항
        </a>
        <a href="#" class="fs-5 mb-2 list-group-item list-group-item-action p-3 btn btn-outline-secondary">
          로그아웃
        </a>
      </div>
    </div>
  </div>

  </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>