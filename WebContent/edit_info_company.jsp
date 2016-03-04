<%@page import="sun.net.www.content.image.gif"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="weath.function.GetUserInfo" %>
<%@ page import="weath.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/home.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑企业信息</title>
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
</head>
<body >
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
    <li ><a href="index_login.html">进行交易<span>TRANSACTION</span></a>
      <ul>
        <li><a rel="nofollow"  target="_blank" href="place_order.html">匹配下单</a></li>
        <li><a href="assignment_contract.html">合同转让</a></li>
        <li><a href="derivative_transaction.html">衍生品交易</a></li>
        <li class="t"></li>
      </ul>
    </li>
    <div class="n"></div>
    <li class='active'><a href="order_info.html">个人中心<span>PERSONAL CENTER</span></a>
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
    <li ><a href="news.html">行业新闻<span>INDUSTRIAL NEWS</span></a></li>
    <div class="n"></div>
    <li ><a href="introduction.html">业务指引<span>INTRODUCTION</span></a></li>
    <div class="n"></div>
    <li ><a href="temperature.html">气温指数<span>TEMPERATURE INDEX</span></a></li>
    <div class="n"></div>
    <li ><a href="law.html">相关法律<span>RELATIVE LAWS</span></a></li>
    <div class="n"></div>
    <li ><a href="bbs.html">交流论坛<span>COMMUNICATION BBS</span></a></li>
  </ul>
  
</div>
<!--/nav-->
<div class="menu">
	<div align="center"><a href="change_img.html"><input type="image" class="img" src="images/banner.jpg" alt="修改头像"></input></a></div>
    <div align="center" class="bbb"><a href="self_info_company.html"><div class="active2">用户资料</divs></a></div>
	<div align="center" class="bbb"><a href="order_info.html">交易信息</a></div>
    <div align="center" class="bbb"><a href="message_list.html">消息列表</a></div> 
	<div align="center" class="bbb"><a href="profit.html">历史利润</a></div>
    <div align="center" class="bbb"><a href="account.html">我的账户</a></div>
  <div align="center" class="bbb"><a href="change_pwd.html">修改密码</a></div>
  <div align="center" class="bbb"><a href="index.html">退出</a></div>
</div>
<% try{
        	 GetUserInfo userinfo=new GetUserInfo();
        	 String userID=userinfo.getUserId();
        	 User user= userinfo.getUserInfo(userID);
        	 %> 
  <form action="ChangeUserInfo.action" method="post">
  <div class="register1" >
    <div class="form-horizontal">
      <div class="form-group">
        <label for="Email" class="col-sm-4 control-label">登陆邮箱</label>
        <div class="col-sm-5">
        <input type="text" class="form-control" id="email" name="email"placeholder="" value="<%=user.getEmail() %>" readonly="true" />
        </div>
        
      </div>
    </div>
    
      <div class="form-horizontal">
      <div class="form-group">
        <label for="name" class="col-sm-4 control-label">用户类型</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="type" name="type" placeholder="" value="<%=user.getType() %>"  readonly="readonly"></input>
        </div>
      </div>
    </div>
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="name" class="col-sm-4 control-label">企业名称</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="name" name="name" placeholder="" value="<%=user.getName() %>" readonly="readonly"></input>
        </div>
      </div>
    </div>
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="licenseID" class="col-sm-4 control-label">企业执照</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="ID" name="ID" placeholder=""value="<%=user.getId() %>" readonly="readonly"></input>
        </div>
      </div>
    </div>
    
       <div class="form-horizontal">
      <div class="form-group">
        <label for="licenseID" class="col-sm-4 control-label">银行账户</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="bankaccount" name="bankaccount" placeholder=""value="<%=user.getBankaccount() %>" readonly="readonly"></input>
        </div>
      </div>
    </div>
    
     <div class="form-horizontal">
      <div class="form-group">
        <label for="licenseID" class="col-sm-4 control-label">信用等级</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="credit" name="credit" placeholder=""value="<%=user.getCredit() %>" readonly="readonly" ></input>
        </div>
      </div>
    </div>

    <div class="form-horizontal">
      <div class="form-group">
        <label for="licenseID" class="col-sm-4 control-label">交易数量</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="dealamount" name="dealamount" placeholder=""value="<%=user.getDealamount() %>" readonly="readonly" ></input>
        </div>
      </div>
    </div>

    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="field" class="col-sm-4 control-label">产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</label>
        <div class="col-sm-5">
          <select name="profession"class="text-control3" id="profession">
            <option value="1">教育</option>
            <option value="2">test2</option>
            <option value="3">test3</option>
          </select>
        </div>
      </div>
    </div>
   
    <div class="form-horizontal">
      <div class="form-group">
        <label for="propertyScale" class="col-sm-4 control-label">规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;模</label>
        <div class="col-sm-5">
          <select name="property"class="text-control3" id="property">
            <option value="1">非常大</option>
            <option value="2">test2</option>
            <option value="3">test3</option>
          </select>
        </div>
      </div>
    </div>
   

    <div class="form-horizontal">
      <div class="form-group">
        <label for="brief" class="col-sm-4 control-label">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</label>
        <div class="col-sm-5">
          <input type="text"class="text-control4" name="brief" value="<%=user.getBrief() %>"></input>
           </div>
      </div>
    </div>
    
    <div align="center" class="col-sm-4 col-sm-offset-4">
      <input type="submit" class="btn btn-primary btn-block" style="margin:100px 0 0 0" value="提交"></input><!--提交后到self_info_compan.html-->
    </div>
    <%}catch(Exception e)
		{}%>
		</div>
	</form>

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
