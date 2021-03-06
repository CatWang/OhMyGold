<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="weath.function.GetPlatformDerivativedList" %>
    <%@page import="weath.function.GetClientDerivativeList" %>
    <%@page import="java.util.LinkedHashMap"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="weath.function.GetUserInfo" %>
<html>
<head>
  <link href="css/home.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="css/tab.css">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>衍生品交易</title>
  <script type="text/javascript" src="js/jquery1.42.min.js"></script>
  <script type="text/javascript" src="js/nav.js"></script>
  
  <style>
    *{padding:0;margin:0;list-style:none;border:0;}
    body{background:#666;}
    /*---导航---*/
    #nav{height:45px;text-align:center;clear:both;margin:1px 0 0 0;background:#6C5046;font-family:'microsoft yahei';}
    #nav ul{width:950px;margin:0 auto;}
    #nav li{float:left;height:40px;position:relative}#6C5046;
    #nav li.line_off{background:none}
    #nav a{display:block;float:left;text-decoration:none;height:35px;padding-top:5px;line-height:18px;font-size:15px;color:#CFC4AC;width:90px;blr:expression(this.onFocus=this.blur());outline:none;position:relative;}
    #nav a:hover,#nav .active a,#nav li.sfhover a{color:#fff;text-decoration:none;font-weight:700}
    #nav a span{font-size:8px;-webkit-text-size-adjust:none;line-height:12px;padding-bottom:15px;display:block;font-weight:300;cursor:pointer;position:relative}
    #nav .n{background:url(images/i2.png) no-repeat 0 4px;width:16px;height:51px;float:left}
    /*---当前分类---*/
    #nav li ul{display:none;position:absolute;top:35px;left:-20px;width:116px;padding:10px 0;background:url(images/nav2.png) repeat-y;z-index:11}
    #nav li ul li{line-height:30px;height:30px;margin:0;background-image:none;position:relative;z-index:2}
    #nav li ul a,#nav li.active ul a,#nav li.sfhover ul a{background:none;font-weight:300;height:auto;color:#000;line-height:24px;width:110px;margin-left:3px;font-size:12px;float:none;padding:0 0 6px;background:url(images/nav2.png) no-repeat -234px -100px;_background:url(images/nav2_1.gif) no-repeat 0 -30px}
    #nav li ul a:hover{background:url(images/nav2.png) no-repeat -234px 0;_background:url(images/nav2_1.gif) no-repeat 0 0;color:#fff;font-weight:300}
    #nav li ul .t{position:relative;z-index:2;top:14px;left:0;width:116px;height:4px;font-size:0;line-height:0;overflow:hidden;background:url(images/nav2.png) no-repeat -116px 0;_background:url(images/nav2_2.png) no-repeat}

  </style>

  <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/registerstyle.css" rel="stylesheet" type="text/css" media="all" />

  <script type="text/javascript">
    function setTab(m,n){  
      
     var tli=document.getElementById("menu"+m).getElementsByTagName("li");  
      
     var mli=document.getElementById("main"+m).getElementsByTagName("ul");  
      
     for(i=0;i<tli.length;i++){  
      
      tli[i].className=i==n?"hover":"";  
      
      mli[i].style.display=i==n?"block":"none";  
      
     }  
      
    }  
  </script>
</head>
<body>
<div class="logo">
  <div class="logo_title">
  <img class="cloud" src="images/logo3.png"/>
  <img src="images/biaoti.png" class="title" /></div>
<div class="login">
<ul>
<li><a href="index.jsp">退出</a></li>
<li><a href="self_info.jsp"><%=new GetUserInfo().getUsername() %></a></li>
</ul>
</div>
</div>
</div>
<div id="nav">
  <ul>
    <li><a href="index.jsp">首　页<span>HOME</span></a></li>
    <div class="n"></div>
    <li ><a href="plat_describ.jsp">平台介绍<span>DESCRIPTION</span></a>
    </li>
        <div class="n"></div>
    <li class="active"><a href="index_login.jsp">进行交易<span>TRANSACTION</span></a>
      <ul>
          <li><a rel="nofollow"  target="_blank" href="place_order.jsp">匹配下单</a></li>
        <li><a href="assignment_contract.jsp">合同转让</a></li>
        <li><a href="derivative_transaction.jsp">衍生品交易</a></li>
        <li class="t"></li>
      </ul>
    </li>
    <div class="n"></div>
    <li ><a href="order_info.jsp">个人中心<span>PERSONAL CENTER</span></a>
     <ul>
        <li><a rel="nofollow"  target="_blank" href="self_info_company.jsp" >用户资料</a></li>
        <li><a href="order_info.jsp">交易信息</a></li>
        <li><a href="message_list.jsp">消息列表</a></li>
        <li><a href="profit.jsp">历史利润</a></li>
        <li><a href="account.jsp">我的账户</a></li>
        <li><a href="change_pwd.jsp">修改密码</a></li>
        <li><a href="index.jsp">退出</a></li>
        <li class="t"></li>
      </ul>
    </li>
    <div class="n"></div>
    <li ><a href="news.jsp">行业新闻<span>INDUSTRIAL NEWS</span></a>
      <div class="n"></div>
    <li ><a href="introduction.jsp">业务指引<span>INTRODUCTION</span></a>
    </li>
    <div class="n"></div>
    <li ><a href="temperature.jsp">气温指数<span>TEMPERATURE INDEX</span></a></li>
    <div class="n"></div>
    <li ><a href="law.jsp">相关法律<span>RELATIVE LAWS</span></a>
    </li>

    <div class="n"></div>
    <li ><a href="communication.jsp">交流论坛<span>COMMUNICATION BBS</span></a>
  </ul>

</div>
<div class="register">
  <div id="tabs0">  
      
     <ul class="menu0" id="menu0">  
      
      <li onClick="setTab(0,0)" class="hover">购买</li>  
      
      <li onClick="setTab(0,1)">出售</li>  
      
     </ul> 
     <br /> 
     <br />
      
     <div class="main" id="main0">  
      
      <ul class="block">
      <table class="table">
        <tr>
          <th>ID</th>
          <th>关注地区</th>
          <th>天气偏好</th>
          <th>生效月份</th>
          <th>今日价格</th>
          <th>操作</th>
        </tr>
          <%
				try{
					GetPlatformDerivativedList a= new GetPlatformDerivativedList();
					LinkedHashMap<String,JSONObject> mapp = a.GetPlatformDerivarivedList1();
				for (int i = 0; i < mapp.size(); i++) 
				{
					System.out.println(mapp.size());
					System.out.println(mapp.get(i+""));
			%>
        <tr>
         
          <td><%=mapp.get(i+"").get("derivativeID") %></td>
          <td> </td>									<!-- 关注地区没给 -->
          <td><%=mapp.get(i+"").get("temperature") %></td>
          <td><%=mapp.get(i+"").get("year")+"年"+mapp.get(i+"").get("month")+"月" %></td>
          <td><%=mapp.get(i+"").get("singleprice") %></td>
          <td><a href="derivative_purchase.jsp?derivative=<%=mapp.get(i+"").getString("derivativeID") %>"type="submit" class="more_info">详情</a></td>
		<%
				}}
				catch (Exception e)
				{}%>
        </tr>
      </table>

      </ul>  
      
      <ul>
        <table class="table">
        <tr>
          <th>ID</th>
          <th>关注地区</th>
          <th>天气偏好</th>
          <th>生效月份</th>
          <th>今日价格</th>
          <th>持有数量</th>
          <th>操作</th>
        </tr>
          <%
				try{
					GetClientDerivativeList a= new GetClientDerivativeList();
					LinkedHashMap<String,JSONObject> mapp = a.GetClientDerivariveList1();
				for (int i = 0; i < mapp.size(); i++) 
				{
					System.out.println(mapp.size());
					System.out.println(mapp.get(i+""));
			%>
        <tr>
        
          <td><%=mapp.get(i+"").get("derivativeID") %></td>
          <td></td>									<!-- guanzhudiqu meiyou  -->
          <td><%=mapp.get(i+"").get("temperature") %></td>
          <td><%=mapp.get(i+"").get("year")+"年"+mapp.get(i+"").get("month")+"月" %></td>
          <td><%=mapp.get(i+"").get("singleprice") %></td>
          <td><%=mapp.get(i+"").get("amount") %></td>
          <td><a href="derivative_sell.jsp?derivativeID=<%=mapp.get(i+"").get("derivativeID") %>" type=submit class="more_info">详情</a></td>
          <%
				}}
				catch (Exception e)
				{}%>
        </tr>
        </table>
      </ul>  
     </div>  
      
    </div> 
</div>

<div class="root" >
<ul>
	<li><a href="about_us.jsp">关于我们</a></li>
	<li><a href="contact.jsp">联系我们</a></li>
	<li><a href="hire.jsp">加入我们</a></li>
	<li><a href="fankui.jsp">意见反馈</a></li>
</ul>
</div>

</body>
</html>