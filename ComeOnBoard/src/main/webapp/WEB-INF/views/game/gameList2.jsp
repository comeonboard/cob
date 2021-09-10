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
    * {
        margin: 0;
        padding: 0;
    }

    .main_body{
        background-color: #f7f7f7;
    }

    ul {
        list-style: none;
    }

    .listbar{
        
        height: 20px;
        width: 100%;
        max-width: 980px;
        padding: 12px 5px;
        color: white;
        background-color:rgb(251, 188, 006);
        margin: 30px auto;
        border: 2px solid #000;
       
 
    }
    
    .listbar>select{

        width: 80px;
        float: left; 
        display: inline;
    }

    .listbarv>ul{
        
        display: inline;

    }
    .listbar>ul>li{
        float: right; 
        
        margin-right: 10px;
    }
    
    .listbar>ul>li>a:hover{
    color: rgb(66, 133, 244);
    }

    .game_list{
        
        width: 100%;
        max-width: 980px;
        height: auto;
        margin: 15px auto 0px auto;
        padding: 12px 5px;
        min-height: 130px;
        
        border: 2px solid #000;
    }
   
    
    

    .game_img{
        
        width: 100px;
        height: 100px;
        /* border : 2px solid #000; */
        padding: 5px 15px;
        margin : 5px 10px; 
        border-right: 2px solid rgb(251, 188, 006);
        float:left; 
        
    }

    
    .game_list>div>ul{
        float : left; 
    }

    .game_list>div>div{

        width: 100px;
        height: 100px;
        background-color: rgb(66, 133, 244);
        text-align: center;
        line-height: 100px;
        font-size: 20px;
        float: right ;
        /* margin: 5px 15px; */
        margin-right: 15px;
        margin-top: 5px;
    }

.game_item{
    display: block;
    clear: both;
    border-bottom: 2px solid #000;
    /* padding-top: 10px; */
    height: 130px;
    margin-top: 15px;
}

.game_item>ul>li>h3>a:hover{
    color: rgb(66, 133, 244);
}

.paging{
    margin: 0px auto;
    width: 100%;
    max-width: 980px;
    height: 40px;
    /* margin-bottom: 20px; */
   
    
    /* border: 2px solid #000; */
    
}

.paging>h4{
    /* text-align: center; */
    margin: 0px auto;
    display: inline;
}

.paging_number{
    width: 420px;
    
}
.game_reg{
    width: 560px;
    float: right;
}
.reg_btn{
    float: right;
    width: 80px;
    margin: 2px 0px;
    border-radius: 7px;
}

.reg_btn:hover{ 
        background-color: rgb(251, 188, 006); 
        cursor: pointer;
    }

a{
    text-decoration: none;
    color: black;
}

#etc{
	display :none
}

</style>
<body>

	<%@ include file="/WEB-INF/views/gameFrame/multibar.jsp"%>
	<%@ include file="/WEB-INF/views/gameFrame/searchbar.jsp"%>
	
	<div class="listbar">
		<select>
			<option value="전략">전략</option>
			<option value="추상">추상</option>
			<option value="컬렉터블">컬렉터블</option>
			<option value="가족">가족</option>
			<option value="어린이">어린이</option>
			<option value="파티">파티</option>
			<option value="테마">테마</option>
			<option value="워게임">워게임</option>
		</select>

        
        <ul>
            <li><a href="#"> 등록순 </a> </li>
            <li><a href="#"> 최신순 </a> </li>
            <li><a href="#"> 평점순 </a> </li>
        </ul>
        
        
    </div>
	
    <div class="game_list">

        <c:forEach items="${gamelist}" var="gameMain" >
        <div class="game_item">
            
            
            <a href="<c:url value ='/game/gamepage/'/>${gameMain.gameIdx}">
            <img src="<c:url value="/uploadfile/uploadgamefile"/>/${gameMain.gamePhoto}" class="game_img"/>
            </a>
            
            
            <ul>
                <li><h3><a href="<c:url value ='/game/gamepage/'/>${gameMain.gameIdx}" >${gameMain.gameName}</a></h3></li>
                <li><h3>장르 : ${gameMain.gameSort}</h3></li>
                <li><h3>게임인원 : ${gameMain.gamePerson}</h3></li>
                <li><h3>플레이타임 : ${gameMain.gameTime}</h3></li>
                <li><h3>사용연령 : ${gameMain.gameLmtAge}</h3></li>
            </ul>
            
            <div>
                <h1>${gameMain.avg }</h1>
            </div>

          
        </div> 

	</c:forEach>
    </div>
   	

	
	    <div class="paging">

        <div class="game_reg">
            <input type="button" value="등록" class="reg_btn" 
            onclick="document.location.href='<c:url value ='/game/gameReg'/>'" >

        <div class="paging_number">
            <h4> << <a href="#">1 | </a><a href="#">2 | </a><a href="#">3 </a> >> </h4>
        </div>
        

        </div>
          
    </div>

</body>
</html>