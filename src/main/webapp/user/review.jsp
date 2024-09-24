<%@ page import="com.jhta.afterpay.user.ReviewDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.user.Review" %>
<%@ page import="com.jhta.afterpay.util.DaoHelper" %>
<%@ page import="com.jhta.afterpay.util.Utils" %>
<%@ page import="com.jhta.afterpay.util.Pagination" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
  <link href="/common/css/style.css" rel="stylesheet">
  <title>AFTER PAY</title>
</head>
<style>
    h2 {
        text-align: center;
    }

    #check-all {
        margin-left: 15px;
    }

    #check-del {
        margin-right: 20px;
    }
</style>
<body>
<%@include file="../common/nav.jsp" %>
<%
  int userNo = 19;
  ReviewDao reviewDao = new ReviewDao();
  List<Review> reviewUser = reviewDao.getReviewsByUserNo(userNo);
  
  // 요청한 페이지 번호 조회
  int pageNo = Utils.toInt(request.getParameter("page"), 1);
  // 총 데이터 갯수 조회
  int totalRows = reviewDao.getNotDeletedTotalRows();
  // Pagination 객체 생성
  Pagination pagination = new Pagination(pageNo, totalRows);
  int beginPage = pagination.getBegin();
  int endPage = pagination.getEnd();
  List<Review> reviews = reviewDao.getNotDeletedReview(userNo, beginPage, endPage);
  int reviewCnt = pagination.getBegin();
%>
<div class="container">
  <div class="row">
    <div class="col-2"></div>
    <div class="col-10">
      <h2 class="mt-3"><strong>REVIEW</strong></h2>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <%@include file="../common/user-nav.jsp" %>
    </div>
    <div class="col-10">
      <form type="post" action="delete-review.jsp" id="review">
        <hr style="border:solid 1px gray;"/>
        <div class="row mb-3">
          <div class="col-12">
            <table class="table">
              <colgroup>
                <col width="5%">
                <col width="10%">
                <col width="*">
                <col width="15%">
                <col width="15%">
              </colgroup>
              <thead>
              <tr class="text-center">
                <th class="text-center">
                  <input id="check-all" type="checkbox" name="all" onchange="checkAll()" style="zoom:1.5">
                </th>
                <th scope="col">No</th>
                <th scope="col">리뷰 제목</th>
                <th scope="col">작성일</th>
                <th scope="col">별점</th>
              </tr>
              </thead>
              <tbody>
              <%
                if (reviewUser.isEmpty()) {
              %>
              <tr>
                <td colspan="5" class="text-center">
                  작성된 리뷰가 없습니다.
                </td>
              </tr>
              <%
                }
                for (Review review : reviews) {
              %>
              <tr class="text-center">
                <th scope="col">
                  <input type="checkbox" name="reviewNo" value="<%=review.getNo()%>" onchange="checkSelect()"
                         style="zoom:1.5">
                </th>
                <th scope="row"><%=reviewCnt++%>
                </th>
                <td class="text-start">
                  <!-- 상품 상세페이지의 리뷰로 페이지 이동 -->
                  <a href="../product/detail.jsp?" style="text-decoration-line: none">
                    <%=review.getTitle()%>
                  </a>
                </td>
                <td><%=review.getCreatedDate()%>
                </td>
                <td>
                  <%
                    int rating = review.getRating();
                    for (int x = 1; x <= rating; x++) {
                  %>
                  <i class="bi bi-star-fill"></i>
                  <%
                    }
                    for (int y = 0; y < 5 - rating; y++) {
                  %>
                  <i class="bi bi-star"></i>
                  <%
                    }
                  %>
                </td>
              </tr>
              <%
                }
              %>
              </tbody>
            </table>
          </div>
        </div>
        
        <%
          if (!reviewUser.isEmpty()) {
        %>
        <div class="text-start mb-3">
          <button type="submit" class="btn" onclick="deleteQna()">
            <i class="bi bi-trash"></i>
            <span class="fs-6">선택삭제</span>
          </button>
        </div>
        <%
          }
        %>
        
        <%
          if (reviewDao.getReviewCntByUserNo(userNo) > 10) {
            if (pagination.getTotalPages() > 0) {
        %>
        <div>
          <ul class="pagination justify-content-center">
            <li class="page-item <%=pagination.isFirst() ? "disabled" : "" %>">
              <a class="page-link" href="review.jsp?page=<%pagination.getPrev(); %>">
                <i class="bi bi-caret-left-fill"></i>
              </a>
            </li>
            <%
              for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
            %>
            <li class="page-item <%=pageNo == num? "active" : "" %>">
              <a href="review.jsp?page=<%=num %>" class="page-link"><%=num %>
              </a>
            </li>
            <%
              }
            %>
            <li class="page-item <%=pagination.isLast() ? "disabled" : ""%>">
              <a class="page-link" href="review.jsp?page=<%=pagination.getNext() %>">
                <i class="bi bi-caret-right-fill"></i>
              </a>
            </li>
          </ul>
        </div>
        <%
            }
          }
        %>
      </form>
    </div>
    
    <script type="text/javascript">
        function checkAll() {
            let isChecked = document.querySelector("[name=all]").checked;
            console.log('체크여부', isChecked);

            let checkBoxes = document.querySelectorAll("[name=reviewNo]");
            checkBoxes.forEach(function (el) {
                el.checked = isChecked;
            })
        }

        function checkSelect() {
            let checkBoxes = document.querySelectorAll("[name=reviewNo]");
            let checkBoxesLength = checkBoxes.length;
            let checkedLength = 0;

            for (let el of checkBoxes) {
                if (el.checked) {
                    checkedLength++;
                }
            }

            if (checkBoxesLength == checkedLength) {
                document.querySelector("[name=all]").checked = true;
            } else {
                document.querySelector("[name=all]").checked = false;
            }
        }

        function deleteQna() {
            // 체크된 문의번호를 조회
            let checkBoxes = document.querySelectorAll("input[type=checkbox][name=reviewNo]");
            let isChecked = false;
            // 체크된 문의가 한 건이라도 있으면 참 반환
            for (let checkBox of checkBoxes) {
                if (checkBox.checked) {
                    isChecked = true;
                    break;
                }
            }
            // 만약 하나도 선택이 안되면 알림 전송 후, 거짓 반환
            if (!isChecked) {
                alert("선택된 리뷰글이 없습니다.")
                return false;
            }

            let qnaForm = document.getElementById("qna");
            qnaForm.setAttribute("action", "delete-review.jsp");
            qnaForm.submit();

            // 체크된 문의가 있으면 해당 폼을 제출하는 것이 참
            return true;
        }
    </script>
    <%@include file="../common/footer.jsp" %>
</body>
</html>
