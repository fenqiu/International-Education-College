<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>error.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
<style type="text/css">
div {
	margin:0 auto;
	padding:0;
}
</style>
  </head>
  
  <body>
     <div style="border:1px solid #000;width: 600px;height: 300px;background-color: #fff;margin-top: 100px" >
    <div>
     <img alt="" src="<%=basePath %>images/ku.jpg"></img>
     额。。。您是少数来到这里的人之一！
     </div>
      <br>
     <div style="padding-left: 100px">
         事情是这样的，您遇到了一点小麻烦，您访问的页面似乎不存在了。
     </div>
      <br>
     <div style="padding-left: 100px">
     您可以直接回到<a href="<%=basePath %>index.jsp"><font style="color: blue">首页</font></a>继续浏览其他内容。
     </div>
      <br>
     <div style="padding-left: 100px">
     当然，您也可以什么都不做，
 <span id="endtime">5</span>
<script type="text/javascript">
var CID = "endtime";
if(window.CID != null)
{
    var iTime = document.getElementById(CID).innerText;
    var Account;
    RemainTime();
}
function RemainTime()
{
    var iDay,iHour,iMinute,iSecond;
    var sDay="",sHour="",sMinute="",sSecond="",sTime="";
    if (iTime >= 0)
    {
        iDay = parseInt(iTime/24/3600);
        if (iDay > 0)
        {
            sDay = iDay + "天";
        }
        iHour = parseInt((iTime/3600)%24);
        if (iHour > 0){
            sHour = iHour + "小时";
        }
        iMinute = parseInt((iTime/60)%60);
        if (iMinute > 0){
            sMinute = iMinute + "分钟";
        }
        iSecond = parseInt(iTime%60);
        if (iSecond >= 0){
            sSecond = iSecond + "秒";
        }
        if ((sDay=="")&&(sHour=="")){
            sTime="<span style='color:darkorange'>" + sMinute+sSecond + "</font>";
        }
        else
        {
            sTime=sDay+sHour+sMinute+sSecond;
        }
        if(iTime==0){
            clearTimeout(Account);
              window.location.href="<%=basePath %>index.jsp";
        }
        else
        {
            Account = setTimeout("RemainTime()",1000);
        }
        iTime=iTime-1;
    }
    else
    {
            sTime="<span style='color:red'>0</span>";
    }
    document.getElementById(CID).innerHTML = sTime;
}
</script>
     
     后我们将送您回到首页。<br/>
      <br>
     谢谢您的访问！
     </div>
      </div>
  </body>
</html>
