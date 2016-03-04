<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="weath.function.GetUserInfo" %>
<%@ page import="weath.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/home.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业账户信息</title>
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
    <li ><a href="login_index.jsp">进行交易<span>TRANSACTION</span></a>
      <ul>
        <li><a rel="nofollow"  target="_blank" href="place_order.jsp">匹配下单</a></li>
        <li><a href="assignment_contract.jsp">合同转让</a></li>
        <li><a href="derivative_transaction.jsp">衍生品交易</a></li>
        <li class="t"></li>
      </ul>
    </li>
    <div class="n"></div>
    <li class="active" ><a href="order_info.jsp">个人中心<span>PERSONAL CENTER</span></a>
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
<!--/nav-->
<div class="menu">
	<div align="center"><a href="change_img.jsp"><input type="image" class="img" src="images/banner.jpg" alt="修改头像"></input></a></div>
    <div align="center" class="bbb"><a href="self_info_company.jsp"><div class="active2">用户资料</div></a></div>
	<div align="center" class="bbb"><a href="order_info.jsp">交易信息</a></div>
    <div align="center" class="bbb"><a href="message_list.jsp">消息列表</a></div>
	<div align="center" class="bbb"><a href="profit.jsp">历史利润</a></div>
    <div align="center" class="bbb"><a href="account.jsp">我的账户</a></div>
  <div align="center" class="bbb"><a href="change_pwd.jsp">修改密码</a></div>
  <div align="center" class="bbb"><a href="index.jsp">退出</a></div>
</div>
         <% try{
        	 boolean b=true;
        	 String company;
        	 String person;
        	 GetUserInfo userinfo=new GetUserInfo();
        	 String userID=userinfo.getUserId();
        	 User user= userinfo.getUserInfo(userID);
        	  if ("individual".equals(user.getType())){b=false;}
        	  if (b){ company="inline";person="none";}
        	  else {company="none";person="inline";}
        	 %> 

	<div class="register1" >
    <div style="float:right; padding:0 40px 0 0;margin:-20px 0 0 0; ">
    	<div class="bianji">
        	<a href="edit_info_company.jsp" style="display: <%=company%>;">编辑</a>
         </div> 
     </div>  

         <div class="form-horizontal">
      		<div class="form-group">
       		 <label for="Email" class="col-sm-4 control-label" style="display: <%=company%>;">登陆邮箱：</label>
       		 <div class="col-sm-5">
       		 <label class="control-label" id="email" name="email"  style="display: <%=company%>;"><%=user.getEmail() %></label>
        	 </div>
      		</div>
    	</div>
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="verify_pwd" class="col-sm-4 control-label" style="display: <%=company%>;">账户密码：</label>
        <div class="col-sm-5">
          <label class="control-label" id="verify_pwd" name="verify_pwd"  style="display: <%=company%>;"><%=user.getPwd() %></label>
        </div>
      </div>
    </div>
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="verify_pwd" class="col-sm-4 control-label" style="display: <%=company%>;">用户类型：</label>
        <div class="col-sm-5">
          <label class="control-label" id="type" name="type"  style="display: <%=company%>;"><%=user.getType() %></label>
        </div>
      </div>
    </div>
    

    
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="name" class="col-sm-4 control-label" style="display: <%=company%>;">企业名称：</label>
        <div class="col-sm-5">
          <label class="control-label" id="name" name="name" style="display: <%=company%>;"><%=user.getName() %></label>
        </div>
      </div>
    </div>
    
      <div class="form-horizontal">
      <div class="form-group">
        <label for="field" class="col-sm-4 control-label" style="display: <%=company%>;">产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
        <div class="col-sm-7">
         <label class="control-label" id="profession" name="profession" style="display: <%=company%>;"><%=user.getProfession() %></label>
        </div>
      </div>
    </div>

    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="licenseID" class="col-sm-4 control-label" style="display: <%=company%>;">企业执照：</label>
        <div class="col-sm-5">
          <label class="control-label" id="licenseID" name="licenseID" style="display: <%=company%>;"><%=user.getId() %></label>
        </div>
      </div>
    </div>
    
        <div class="form-horizontal">
      <div class="form-group">
        <label for="verify_pwd" class="col-sm-4 control-label" style="display: <%=company%>;">银行账户：</label>
        <div class="col-sm-5">
          <label class="control-label" id="bankaccount" name="bankaccount"  style="display: <%=company%>;"><%=user.getBankaccount() %></label>
        </div>
      </div>
    </div>        
  
    <div class="form-horizontal">
      <div class="form-group">
        <label for="propertyScale" class="col-sm-4 control-label" style="display: <%=company%>;">规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;模：</label>
        <div class="col-sm-7">
          <label class="control-label" id="address" name="property" style="display: <%=company%>;"><%=user.getProperty() %></label>
        </div>
      </div>
    </div>
    
       <div class="form-horizontal">
      <div class="form-group">
        <label for="propertyScale" class="col-sm-4 control-label" style="display: <%=company%>;">信用等级：</label>
        <div class="col-sm-7">
          <label class="control-label" id="credit" name="credit" style="display: <%=company%>;"><%=user.getCredit() %></label>
        </div>
      </div>
    </div>
       <div class="form-horizontal">
      <div class="form-group">
        <label for="propertyScale" class="col-sm-4 control-label" style="display: <%=company%>;">交易数量：</label>
        <div class="col-sm-7">
          <label class="control-label" id="dealamount" name="dealamount"><%=user.getDealamount() %></label>
        </div>
      </div>
    </div>

 
    <div class="form-horizontal">
      <div class="form-group">
        <label for="brief" class="col-sm-4 control-label" style="display: <%=company%>;">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</label>
        <div class="col-sm-7">
           <label class="control-label" id="address" name="brief" style="display: <%=company%>;"><%=user.getBrief() %></label>
        </div>
      </div>
    </div>
         

	<div style="float:right; padding:0 40px 0 0;margin:-20px 0 0 0; ">
    	<div class="bianji">
        	<a href="edit_info_person.jsp" style="display: <%=person%>;">编辑</a>
         </div> 
     </div>  

         <div class="form-horizontal">
      		<div class="form-group">
       		 <label for="Email" class="col-sm-4 control-label" style="display: <%=person%>;">登陆邮箱：</label>
       		 <div class="col-sm-5">
       		 <label class="control-label" id="email" name="email" style="display: <%=person%>;"><%=user.getEmail() %></label>
        	 </div>
      		</div>
    	</div>
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="verify_pwd" class="col-sm-4 control-label" style="display: <%=person%>;">账户密码：</label>
        <div class="col-sm-5">
          <label class="control-label" id="verify_pwd" name="verify_pwd"  style="display: <%=person%>;"><%=user.getPwd() %></label>
        </div>
      </div>
    </div>
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="verify_pwd" class="col-sm-4 control-label" style="display: <%=person%>;">用户类型：</label>
        <div class="col-sm-5">
          <label class="control-label" id="type" name="type"  style="display: <%=person%>;"><%=user.getType() %></label>
        </div>
      </div>
    </div>
    

    
    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="name" class="col-sm-4 control-label" style="display: <%=person%>;">姓名：</label>
        <div class="col-sm-5">
          <label class="control-label" id="name" name="name" style="display: <%=person%>;"><%=user.getName() %></label>
        </div>
      </div>
    </div>
    
      <div class="form-horizontal">
      <div class="form-group">
        <label for="field" class="col-sm-4 control-label" style="display: <%=person%>;">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
        <div class="col-sm-7">
         <label class="control-label" id="profession" name="profession" style="display: <%=person%>;"><%=user.getProfession() %></label>
        </div>
      </div>
    </div>

    
    <div class="form-horizontal">
      <div class="form-group">
        <label for="licenseID" class="col-sm-4 control-label" style="display: <%=person%>;">身份证号：</label>
        <div class="col-sm-5">
          <label class="control-label" id="licenseID" name="licenseID" style="display: <%=person%>;"><%=user.getId() %></label>
        </div>
      </div>
    </div>
    
        <div class="form-horizontal">
      <div class="form-group">
        <label for="verify_pwd" class="col-sm-4 control-label" style="display: <%=person%>;">银行账户：</label>
        <div class="col-sm-5">
          <label class="control-label" id="bankaccount" name="bankaccount"  style="display: <%=person%>;"><%=user.getBankaccount() %></label>
        </div>
      </div>
    </div>        
  
    <div class="form-horizontal">
      <div class="form-group">
        <label for="propertyScale" class="col-sm-4 control-label" style="display: <%=person%>;">个人资产：</label>
        <div class="col-sm-7">
          <label class="control-label" id="address" name="property" style="display: <%=person%>;"><%=user.getProperty() %></label>
        </div>
      </div>
    </div>
    
       <div class="form-horizontal">
      <div class="form-group">
        <label for="propertyScale" class="col-sm-4 control-label" style="display: <%=person%>;">信用等级：</label>
        <div class="col-sm-7">
          <label class="control-label" id="credit" name="credit" style="display: <%=person%>;"><%=user.getCredit() %></label>
        </div>
      </div>
    </div>
       <div class="form-horizontal">
      <div class="form-group">
        <label for="propertyScale" class="col-sm-4 control-label" style="display: <%=person%>;">交易数量：</label>
        <div class="col-sm-7">
          <label class="control-label" id="dealamount" name="dealamount" style="display: <%=person%>;"><%=user.getDealamount() %></label>
        </div>
      </div>
    </div>

 
    <div class="form-horizontal">
      <div class="form-group">
        <label for="brief" class="col-sm-4 control-label" style="display: <%=person%>;">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</label>
        <div class="col-sm-7"> 
           <label class="control-label" id="address" name="brief" style="display: <%=person%>;"><%=user.getBrief() %></label>
        </div>
      </div>
    </div>
<%}catch(Exception e)
         {}%>
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
