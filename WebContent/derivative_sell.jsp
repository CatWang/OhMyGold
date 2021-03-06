<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.json.JSONObject"%>
<%@page import="weath.entity.Order"%>
<%@page import="weath.function.GetDerivative"%>
<%@page import="weath.function.GetUserInfo" %>
<%@page import="weath.entity.Derivative"%>
<html>
<head>
  <link href="css/home.css" rel="stylesheet" type="text/css" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>衍生品出售确认</title>
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
<div class="return"><a href="derivative_transaction.jsp">返回</a></div>
<table class="table" style="width:500px;text-align:center;margin:20px 100px">
  <%
			try{
				String derivativeID = request.getParameter("derivativeID");
				GetDerivative cc = new GetDerivative ();
				Derivative derivative = cc.getClientDerivativeInfo(derivativeID);
		%>
  <tr>
    <th class="col-sm-4">
      衍生品ID：
    </th>
    <td>
        <%=derivative.getDerivativeID() %>
    </td>
  </tr>
  <tr>
    <th>
     有效月份：
    </th>
    <td>
    <%=derivative.getYear()+"年"+derivative.getMonth()+"月" %>  
    </td>
  </tr>
  <tr>
    <th>
      关注地区：
    </th>
    <td>
      
    </td>
  </tr>
  
  <tr>
    <th>
      天气偏好：
    </th>
    <td>
       <%=derivative.getTemperature() %> 
    </td>
  </tr>
  
  <tr>
    <th>
      协议温度：
    </th>
    <td>
       <%=derivative.getProtocoltemperature() %>
    </td>
  </tr>
  
  <tr>
    <th>买入价格：</th>
    <td>
   
    </td>
  </tr>
  <tr>
    <th>今日价格：</th>
    <td> </td>
  </tr>
<tr>
    <th>手续费用：</th>
    <td> </td>
  </tr>
  <tr>
    <th>持有数量：</th>
    <td><%=derivative.getAmount() %> </td>
  </tr>
  <%}catch(Exception e)
  {}%>
  <form action="SaleDerivativeAction.action" method="post">
   <tr>
    <td style="text-align:center;" colspan="2">您需要出售<input type="text" name="hand" style="width:30px" />份</td>
    </tr>
  <tr>
    <td style="text-align:center" colspan="2"><input class="btn btn-primary" style="width:100px;height:35px" type="submit" value="确认出售"></ins></td>
  </tr>
</table>
</form>
</div>

<div class="root">
<ul>
	<li><a href="about_us.jsp">关于我们</a></li>
	<li><a href="contact.jsp">联系我们</a></li>
	<li><a href="hire.jsp">加入我们</a></li>
	<li><a href="fankui.jsp">意见反馈</a></li>
</ul>
</div>


</body>
</html>