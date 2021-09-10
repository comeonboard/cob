<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ComeOnBoard</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<style>
    .searchbar{
        
        height: 50px;
        width: 100%;
        max-width: 980px;
        padding: 12px  5px;
        color: white;
        background-color: rgb(251, 188, 006);
        margin: 30px auto;
        border: 2px solid #000;
 
    }
    .searchbar>h1 {
        float:left;
        padding: auto 20px;
        margin: 0px 10px;
    }
    .search{

        float : right;
        margin-top: 8px;
        margin-right: 20px;
        padding: auto 0px;
    }

    .search>input[type=text]{

        height: 30px;
        width: 250px;
    }

    .search>input[type=submit]{

        height: 34px;
        width: 50px;
        float: right;
    }
</style>
<body>

	<div class="searchbar">
		<h1>
			<a href="<c:url value ='/game/gamelist'/>"> 게임 DB </a>
		</h1>
		
		<form method="post">
			<div class="search">
				<input type="text" id="search_text" name="keyword"> 
				<input type="submit" value="검색" id="btn1">
			</div>
		</form>		
	</div>

	
</body>


</html>