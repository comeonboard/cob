<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${payResult eq 'success'}">
	<script>
	alert('결제되었습니다.');
	//alert('결제일시: ${info.approved_at}\n주문번호: ${info.partner_order_id}\n상품명: ${info.item_name}\n상품수량: ${info.quantity}\n결제금액: ${info.amount.total}\n결제방법: ${info.payment_method_type});
	</script>

</c:if>

<c:if test="${payResult eq 'fail' || empty payResult}">
	<script>
	alert('오류가 발생하여 결제에 실패했습니다.\n잠시 후 다시 시도해주세요.');
	//window.close();
	</script>
</c:if>   

<c:if test="${payResult eq 'cancel'}">
	<script>
	alert('결제가 취소되었습니다.');
	//window.close();
	</script>
</c:if>