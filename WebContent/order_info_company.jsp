<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="weath.entity.Order" %>
    <%@page import="weath.function.GetOrder" %>
    <%@page import="weath.function.GetUserInfo" %>
     <%@page import="weath.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link href="css/home.css" rel="stylesheet" type="text/css" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>订单详情</title>
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
<li><a href="index.html">退出</a></li>
<li><a href="self_info.html"><%=new GetUserInfo().getUsername() %></a></li>
</ul>
</div>
</div>
</div>
<div id="nav">
  <ul>
    <li><a href="index.html">首　页<span>HOME</span></a></li>
    <div class="n"></div>
    <li ><a href="plat_describ.html">平台介绍<span>DESCRIPTION</span></a>
    </li>
     <div class="n"></div>
    <li class="active" ><a href="index_login.html">进行交易<span>TRANSACTION</span></a>
    <ul>
        <li><a rel="nofollow"  target="_blank" href="place_order.html">匹配下单</a></li>
        <li><a href="assignment_contract.html">合同转让</a></li>
        <li><a href="derivative_transaction.html">衍生品交易</a></li>
        <li class="t"></li>
      </ul>
    </li>
    <div class="n"></div>
    <li><a href="order_info.html">个人中心<span>PERSONAL CENTER</span></a>
        <ul>
        <li><a rel="nofollow"  target="_blank" href="self_info_company.html" >用户资料</a></li>
        <li><a href="order_info.html">交易信息</a></li>
        <li><a href="message_list.html">消息列表</a></li>
        <li><a href="profit.html">历史利润</a></li>
        <li><a href="account.html">我的账户</a></li>
        <li><a href="change_pwd.html">修改密码</a></li>
        <li><a href="index.html">退出</a></li>
        <li class="t"></li>
      </ul>
    </li>
    <div class="n"></div>
    <li ><a href="news.html">行业新闻<span>INDUSTRIAL NEWS</span></a>
      <div class="n"></div>
    <li ><a href="introduction.html">业务指引<span>INTRODUCTION</span></a>
    </li>
    <div class="n"></div>
    <li ><a href="temperature.html">气温指数<span>TEMPERATURE INDEX</span></a></li>
    <div class="n"></div>
    <li ><a href="law.html">相关法律<span>RELATIVE LAWS</span></a>
    </li>
   
    <div class="n"></div>
    <li ><a href="communication.html">交流论坛<span>COMMUNICATION BBS</span></a>
  </ul>
  
</div>
<div class="register">
 <div class="return"><a href="match_order.html">返回</a></div>
 
 <% String orderID=request.getParameter("orderID");
 	String userID=request.getParameter("userID");
 	GetOrder ordere=new GetOrder();
 	Order order=ordere.getOrder(orderID);%>
<table class="table" style="width:500px;text-align:center;margin:20px 100px">
  <tr >
    <th class="col-sm-4">
      订&nbsp;&nbsp;&nbsp;单&nbsp;ID&nbsp;:
    </th>
    <td>
  <%=order.getOrderID() %>
    </td>
    
  </tr>
  <tr>
    <th>
      关注地区：
    </th>
    <td>
      <%=order.getProvince()%>省<%=order.getCity()%>市
    </td>
  </tr>
  <tr>
    <th>生效月份：</th>
    <td>
    <%=order.getYear()%>年<%=order.getMonth() %>月
    </td>
  </tr>
  <tr>
    <th>天气偏好：</th>
    <td>
    <%=order.getTemperature() %> 
    </td>
  </tr>

  </table>
  <br />
  <%
  GetUserInfo userr=new GetUserInfo();
  User user=userr.getUserInfo(userID);
  %>
  
  
  <table class="table" style="width:500px;text-align:center;margin:20px 100px">
  <tr>
    <td class="col-sm-4"><img src="images/banner.jpg" class="img"/></td>
    <td><input class="btn btn-primary" style="width:100px;height:35px;margin: 60px auto 10px auto" type="submit" value="协商" /></td><!--跳聊天窗口-->
  </tr>
  <tr>
    <th>公司名称：</th>
    <td>
    <%=user.getName() %>
    </td>
  </tr>
  <tr>
    <th>营业执照：</th>
    <td>
    <%=user.getId() %>
    </td>
  </tr>
  <tr>
    <th>产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</th>
    <td>
    <%=user.getProfession() %>
    </td>
  </tr>
  <tr>
    <th>资产规模：</th>
    <td>
    <%=user.getProperty() %>
    </td>
  </tr>
  
  <tr>
    <th>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</th>
    <td>
    <%=user.getBrief() %>
    </td>
  </tr>
  <tr>
    <th>信用评级：</th>
    <td>
    <%=user.getCredit() %>
    </td>
  </tr>
  <tr>
    <th>交易数量：&nbsp;</th>
    <td>
    <%=user.getDealamount() %>
    </td>
  </tr>
  <tr><td></td><td></td></tr>
  <tr>
    <td style="text-align:center" colspan="2">参考赔付率：&nbsp;&nbsp;&nbsp;<%= %></td>
    <!-- 参考赔付率还没给 -->
    </tr>
  <tr>
    <td style="text-align:center" colspan="2"><input class="btn btn-primary" style="width:100px;height:35px" type="submit" value="合同模型"></ins></td>
  </tr>
</table>
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