<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="weath.entity.User" %>
<%@ page import="weath.entity.Order" %>
<%@ page import="weath.entity.Contact" %>
<%@ page import="weath.entity.Derivative" %>
<%@ page import="weath.function.*" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/home.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账户信息</title>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<style>
*{padding:0;margin:0;list-style:none;border:0;}
body{background:#666;}
/*---导航---*/
#nav{height:45px;text-align:center;clear:both;margin:1px 0 0 0;background:#6C5046;font-family:'microsoft yahei';}
#nav ul{float:;width:950px;margin:0 auto;}
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
 <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/registerstyle.css" rel="stylesheet" type="text/css" media="all" />
</style>
 
</style>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css/registerstyle.css" rel="stylesheet" type="text/css" media="all" /> 
  
   <script type="text/javascript">
    function setTab(m,n){  
	  var n= document.getElementById("sel").value ;
     var tli=document.getElementById("sel").getElementsByTagName("option");  
      
     var mli=document.getElementById("table").getElementsByTagName("ul");  
      
     for(i=0;i<tli.length;i++){  
      
      tli[i].className=i==n?"hover":"";  
      
      mli[i].style.display=i==n?"block":"none";  
      
     }  
      
    }  
  </script>
</head>
<body onload="setTab(0,0)">
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
    <li ><a href="plat_describ.jsp">平台介绍<span>DESCRIPTION</span></a></li>
    <div class="n"></div>
    <li ><a href="index_login.jhtml">进行交易<span>TRANSACTION</span></a>
      <ul>
        <li><a rel="nofollow"  target="_blank" href="place_order.jsp">匹配下单</a></li>
        <li><a href="assignment_contract.jsp">合同转让</a></li>
        <li><a href="derivative_transaction.jsp">衍生品交易</a></li>
        <li class="t"></li>
      </ul>
    </li>
    <div class="n"></div>
    <li class='active'><a href="order_info.jsp">个人中心<span>PERSONAL CENTER</span></a>
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
    <li ><a href="news.jsp">行业新闻<span>INDUSTRIAL NEWS</span></a></li>
    <div class="n"></div>
    <li ><a href="introduction.jsp">业务指引<span>INTRODUCTION</span></a></li>
    <div class="n"></div>
    <li ><a href="temperature.jsp">气温指数<span>TEMPERATURE INDEX</span></a></li>
    <div class="n"></div>
    <li ><a href="law.jsp">相关法律<span>RELATIVE LAWS</span></a></li>

    <div class="n"></div>
    <li ><a href="communication.jsp">交流论坛<span>COMMUNICATION BBS</span></a></li>
  </ul>
  
</div>


<!--/nav-->
<div class="menu">
	<div align="center"><a href="change_img.jsp"><input type="image" class="img" src="images/banner.jpg" alt="修改头像"></input></a></div>
    <div align="center" class="bbb"><a href="self_info_company.jsp" >用户资料</a></div>
	<div align="center" class="bbb"><a href="order_info.jsp"><div class="active2">交易信息</div></a></div>
    <div align="center" class="bbb"><a href="message_list.jsp">消息列表</a></div>
	<div align="center" class="bbb"><a href="profit.jsp">历史利润</a></div>
    <div align="center" class="bbb"><a href="account.jsp">我的账户</a></div>
    <div align="center" class="bbb"><a href="change_pwd.jsp">修改密码</a></div>
    <div align="center" class="bbb"><a href="index.jsp">退出</a></div>
</div>

	<div class="register1">
    
		<div class="form-horizontal"> 
	      <div class="form-group">
    	   <label for="addressFull" class="col-sm-2 control-label">交易类型</label>
        <div class="col-sm-2">
         <select name="sel"class="form-control " id="sel" class="hover" onchange="setTab(0,0)" >
            <option name="sel" value="0">订单</option>
            <option name="sel" value="1" >合同</option>
            <option name="sel" value="2" >衍生品</option>
            </select>
          	</div> 
          </div>
          </div>
          

          
       <div id="table">
          <ul class="block">
                    <div class="form-horizontal"> 
	      <div class="form-group">
    	   <label for="addressFull" class="col-sm-2 control-label">交易状态</label>
        <div class="col-sm-2">
        <form action="" method="post">
         <select name="status"class="form-control " id="sel" class="hover" onchange="submit()" >
         	<option name="status" value="0">所有</option>
            <option name="status" value="1">已签订</option>
            <option name="status" value="2" >未签订</option>
            </select>
           </form>
          	</div> 
          </div>
          </div>
          
          <%String userID=new GetUserInfo().getUserId();
    		String aaa="";
    		String status=request.getParameter("status");
    		LinkedList<String> list=new GetOrder().getOrderList(userID);
    		for(int i=0;i<list.size();i++)
    		{
    			String orderID=list.get(i);
    			Order order=new GetOrder().getOrder(orderID);
    			if(order.getStatus().equals("available")&&(status.equals("1"))
    					||order.getStatus().equals("inavailable")&&(status.equals("2"))
    						||(status.equals("0"))){
    			   %>
          
           <table class="table">
			<tr>
             <th> 订单ID</th>
             <th> 生效月份</th>
             <th> 关注地区</th>
             <th> 交易状态</th>
             <th> 操作</th>
            </tr>
            
            <tr>
             <td><%=order.getOrderID() %></td>
             <td><%=order.getYear()+"年"+order.getMonth()+"月" %></td>
             <td><%=order.getProvince()+"省"+order.getCity()+"市" %></td>
             <td><%=order.getStatus() %></td><!--从status中获取-->
             <%if(order.getStatus().equals("available"))  aaa="my_account_order_info_sign.jsp";
               if(order.getStatus().equals("inavailable"))  aaa="my_account_order_info.jsp";%>
             <td><a href="<%=aaa%>?orderID=<%=order.getOrderID() %>" class="more_info">详情</a></td><!--status=1 时链接到my_accout_order_info.jsp
             																		当status=0时 链接到 my_account_order_info_sign.jsp-->
            </tr>
           </table>
           </ul>
         <ul>
         <%}} %>
         
         
           
          <div class="form-horizontal"> 
	      <div class="form-group">
    	   <label for="addressFull" class="col-sm-2 control-label">交易状态</label>
        <div class="col-sm-2">
         <form action="" method="post">
         <select name="status"class="form-control " id="sel" class="hover" onchange="submit()" >
            <option name="status" value="0">所有</option>
            <option name="status" value="1">已交割</option>
            <option name="status" value="2" >未交割</option>
            <option name="status" value="3" >已转让</option>
            </select>
            </form>
          	</div> 
          </div>
          </div>
          
           <%
    		LinkedList<String> clist=new GetContact().getContactIDList(userID);
    		for(int i=0;i<clist.size();i++)
    		{
    			String contactID=clist.get(i);
    			Contact contact=new GetContact().getContact(contactID);
    			if(contact.getStatus().equals("available")&&(status.equals("1"))//这里的状态有问题
    					||contact.getStatus().equals("inavailable")&&(status.equals("2"))
    						||(status.equals("0"))){
    			   %>
          
          
        <table class="table">
			<tr>
             <th> 合同ID</th>
             <th> 关注地区</th>
             <th> 生效月份</th>
             <th> 交易状态</th>
             <th> 操作</th>
            </th>
            <tr>
             <td><%=contact.getContactID() %></td>
             <td><%=contact.getProvince()+"省"+contact.getCity()+"市" %></td>
             <td><%=contact.getYear()+"年"+contact.getMonth()+"月" %></td>
             <td><%=contact.getStatus() %></td><!--从status中获取-->
             <td><a href="my_account_constract_info_paid.jsp" class="more_info">详情</a></td><!--status=02 跳转 my_account_constract_info_paid.jsp
             																					 status=1 跳转 me_account_constract_info_unpaid.jsp
                                                                                                 -->
            </tr>
           </table>
           </ul>
           <%}} %>
           
           <ul>
           <div class="form-horizontal"> 
	      <div class="form-group">
    	   <label for="addressFull" class="col-sm-2 control-label">交易状态</label>
        <div class="col-sm-2">
         <select name="status"class="form-control " id="sel" class="hover"  >
            <option name="status" value="0">所有</option>
            <option name="status" value="1">已交割</option>
            <option name="status" value="2" >未交割</option>
            </select>
          	</div> 
          </div>
          </div>
          
           <%
    		LinkedList<String> dlist=new GetDerivative().getClientDerivativeList(userID);
    		for(int i=0;i<dlist.size();i++)
    		{
    			String derivativeID=dlist.get(i);
    			Derivative derivative=new GetDerivative().getClientDerivativeInfo(derivativeID);
    			Calendar ccc=Calendar.getInstance();
    			int year=ccc.get(Calendar.YEAR);
    			int month=ccc.get(Calendar.MONTH);
    			int year2=derivative.getYear();
    			int month2=derivative.getMonth();
    			if( ((year<year2)||(year==year2)&&(month<=month2))&&(status.equals("2"))
    					||((year==year2)&&(month>month2)||(year>year2))&(status.equals("1"))
    					||(status.equals("0")))
    			/* if(derivative.getYear().getStatus().equals("available")&&(status.equals("1"))//这里的状态有问题
    					||contact.getStatus().equals("inavailable")&&(status.equals("2"))
    						||(status.equals("0"))){ */
    			   %>
          
           <table class="table">
			<tr>
             <th> 衍生品ID</th>
             <th> 生效月份</th>
             <th> 买入价格</th>
             <th> 交易状态</th>
             <th> 操作</th>
            </tr>
            <tr>
             <td><%=derivative.getDerivativeID() %></td>
             <td><%=derivative.getYear()+"年"+derivative.getMonth()+"月"%></td>
             <td></td>
             <td><%=status%></td>
              <td><a href="my_account_derivative_info_paid.jsp" class="more_info">详情</a> </td><!--当status==0 跳转 my_account_derivative_info_paid.jsp
              																					当status=1 跳转my_account_derivative_info_unpaid.jsp-->
            </tr>
           </table>
           </ul>
           
           <%} %>
           </div>
     </div>
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
