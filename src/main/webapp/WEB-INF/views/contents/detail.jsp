<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>상품 상세</title>
<meta charset="utf-8">
<script type="text/javascript">
	function cart() {
	  if ('${sessionScope.id}' == '') {
		alert('먼저 로그인을 하세요');
		location.href = '/member/login';
		return;
	  }
	  //카트테이블에 등록하고 등록 확인 창 보여주기 (비동기)

	  let count = document.querySelector('#qty').value; //$('#qty').val()
	  let select = document.querySelector('.form-select');
	  let i = select.selectedIndex;
	  if(i==0 && !select.disabled){
		  alert('사이즈를 선택하세요');
		  select.focus();
		  return
	  }else if(select.disabled){
		  select[i].value=0;
	  }
	  
	  let param = {
			  contentsno : '${dto.contentsno}',
			  count : count,
			  size : select[i].value
	  }
	  
	  addCart(param)
	  .then(result => alert(result))
	  .catch(console.log);	  
	}
	function order() {
	  if ('${sessionScope.id}' == '') {
			alert('먼저 로그인을 하세요');
			location.href = '/member/login';
			return;

	  }
	  //주문서 작성으로 이동 주문생성
	  let count = document.querySelector('#qty').value; //$('#qty').val()
	  let select = document.querySelector('.form-select');
	  let i = select.selectedIndex;
	  if(i==0 && !select.disabled){
		  alert('사이즈를 선택하세요');
		  select.focus();
		  return
	  }else if(select.disabled){
		  select[i].value=0;
	  }
	  
	  let url = "/order/create/order/${dto.contentsno}/"+count+"/"+select[i].value;
	  location.href=url;
	  

	}
</script>
<script src="/js/cart.js" defer></script>
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-3">
				<h4>
					<i class="bi bi-box2-heart"></i> 상품 정보
				</h4>
				<img class="img-rounded" src="/contents/storage/${dto.filename}"
					style="width: 250px">
				<div class="caption">
					<p>상품명:${dto.pname}</p>
					<p>${dto.detail }</p>
				</div>
			</div>
			<div class="col-sm-6">
				<h4>
					<i class="bi bi-rulers"></i> 사이즈 및 수량
				</h4>
				<ul class="list-group">
					<li class="list-group-item">사이즈 : <c:choose>
							<c:when test="${dto.cateno==1}">
								<select class="form-select">
									<option selected>사이즈 선택</option>
									<option value="L">Large</option>
									<option value="M">Medium</option>
									<option value="S">Small</option>
								</select>
							</c:when>
							<c:when test="${dto.cateno==2 }">
								<select class="form-select" disabled="disabled">
									<option selected>사이즈 선택</option>
								</select>
							</c:when>
							<c:when test="${dto.cateno==3 }">
								<select class="form-select">
									<option selected>사이즈 선택</option>
									<option value="220">220</option>
									<option value="230">230</option>
									<option value="240">240</option>
									<option value="250">250</option>
									<option value="260">260</option>
								</select>
							</c:when>
						</c:choose>
					<li class="list-group-item">가격 : ${dto.price }
					<li class="list-group-item">재고 : ${dto.stock }
					<li class="list-group-item">수량 : 
					<input type="number" name="quantity" id='qty' min=0 max=20 value="1">
					<li class="list-group-item">
						<a	href="javascript:cart()">
						<i class="bi bi-cart4 fs-5" title="장바구니 담기"></i></a>
						<a	href="javascript:order()">
						<i class="bi bi-bag-heart-fill fs-5" title="주문하기"></i></a>
						<a	href="javascript:history.back()">
						<i	class="bi bi-arrow-return-left fs-5"></i>
						</a>
				</ul>
			</div>
		</div>
		
	   <!--댓글  -->
		<div class="card">
		    <div class="card-header">
			    Review
			    <button id='addReplyBtn' class='btn btn-primary float-end btn-sm'>New
									Reply</button>
		    </div>
		    <div class="card-body chat">
			    <strong class="float-start">user1</strong> 
			    <small	class="float-end">2023-08-12</small>
		     	<br>
		     	<p>Good job!</p>
		    </div> 
		    <div class="card-footer">
		    	Footer
		    </div>
        </div><!--div card end  -->


	 </div> <!-- container end -->
	 

	 <!-- 페이지 로딩시 댓글 목록 처리-->
	 <!-- jstl는 internal javascript에서 사용가능 -->
	 <script>
	  let contentsno = "${dto.contentsno}"; 
	  let sno = "${sno}";
	  let eno = "${eno}";
	 <!-- 댓글용 paging, 게시판 검색 -->
	  let nPage = "${nPage}";
	  let id = "${sessionScope.id}";
	  let pname = "${dto.pname}";
	 </script>
	 <!-- 댓글처리 관련 Javascript 파일 추가-->
	<script src="/js/producer.js" defer></script>
	 
	<script src="/js/consumer.js" defer></script>
	
	
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">REPLY MODAL</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <label>내용</label> 
        <textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea> 
        <label>별점</label>
        <select name='star' id='star' class="form-select">
        	<option value='2'>★★</option>
        	<option value='3'>★★★</option>
        	<option value='4'>★★★★</option>
        	<option value='5'>★★★★★</option>
        </select>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-success">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>