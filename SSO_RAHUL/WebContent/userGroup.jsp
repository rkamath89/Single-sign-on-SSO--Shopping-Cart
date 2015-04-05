<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>USERGROUP</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<%@page import="java.util.Map" %>
<%@page import="java.util.Set"%>
<%@ page import="data.DAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="data.Users" %>
<%@ page import="data.Resource" %>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#282828"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="57%"><img src="images/index_01.gif" width="573" height="134" alt=""></td>
        <td width="43%"><table width="100%" border="0" cellspacing="10" cellpadding="0">
   <tr>
            <td width="21%"><h3 class="white-text">Logout:</h3></td>
            <td><a href="index.html"><img src="images/logout.png" alt="" width="36" height="32" border="0"></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/index_11.gif" width="434" height="41" alt=""></td>
        <td><a href="home.jsp"><img src="images/home.gif" alt="" width="102" height="41" border="0"></a></td>
        <td><a href="listofgroups.jsp"><img src="images/index_13.gif" alt="" width="102" height="41" border="0"></a></td>
        <td><a href="listofresources.jsp"><img src="images/index_14.gif" alt="" width="102" height="41" border="0"></a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="2" bordercolor="black" cellspacing="0" cellpadding="0">
      <tr>
        <td width="463" background="images/index_17.gif"><table width="100%" border="2" bordercolor="3E79A3">
		
		<tr><td> Group Name </td> <td>GroupInfo</td></tr>
		<% 
		String uid=request.getParameter("uid");
		Map<String,String> map=DAO.getGroups(uid);
		Set<String> key=map.keySet();
		
		for(String groupid:key){ %>
		
			<tr><td><a href="usergroupDetails.jsp?gname=<%=groupid%>&&uid=<%=uid%>"><%=groupid%></a></td>
			<td><%=map.get(groupid)%></td></tr>
		<%}%>
		
	
        
        </table>
        <table width="100%" border="2" bordercolor="3E79A3">
        <tr><td> ResourceId </td> <td>ResourcePath</td></tr>
        <%
        String uid1=request.getParameter("uid");
        Map<String,Resource> map1= DAO.getResources(uid1);
		Set<String> key1=map1.keySet();
		
		for(String resourceid:key1){ 
			Resource rs1=map1.get(resourceid);
		
		%>
		
			<tr><td><a href="userresourceDetails.jsp?resId=<%=rs1.getResId()%>&&uid=<%=uid1%>"><%=rs1.getResId()%></a></td>
			<td><%=rs1.getPath()%></td></tr>
		<%}%>
        
        
        
        
        </table>
        </td>
        <td><img src="images/index_18.jpg" width="537" height="224" alt=""></td>
        <table><tr>
        <td>
        <form method="post" action="addUserToGroup?uid=<%=uid1%>">Add to Group
		<% Map<String,String> allgrouplist = DAO.listOfGroups();
        Set<String> groupKey = allgrouplist.keySet();
        %>
		<select name="newgroup">
	<%
	boolean groupexist=false;
	for(String group:groupKey){
	for(String grp:key){
	if(group.equals(grp))
	{

		groupexist=true;
		break;
	}

	}	

	if(groupexist!=true)
	out.println("<option>"+group+"</option>");
	else
	groupexist=false;
}

%>
</select>
<input type="submit" value="Add User to Group"/>
</form>
</td></tr>



<tr>
        <td>
        <form method="post" action="addResourceToUser?uid=<%=uid1%>">Add NEW RESOURCE
		<% Map<String,String> allresources = DAO.listofresources();
        Set<String> resId = allresources.keySet();
        %>
		<select name="newresource">
	<%
	boolean resexist=false;
	for(String resid:resId){
	for(String userResId:key1){
		Resource rsUser = map1.get(userResId);
	if(resid.equals(rsUser.getResId()))
	{

		resexist=true;
		break;
	}

	}	

	if(resexist!=true)
	{
	out.println("<option >"+allresources.get(resid)+"</option>");
	
	}
	else
		resexist=false;
}

%>

</select>
<input type="checkbox" name = "read" checked="checked" value="r" />
<input type="checkbox" name = "write" value="w" />
<input type="checkbox" name = "exec" value="e" />

<input type="submit" value="Add Resource to User"/>
</form>
</td></tr>








</table>
      </tr>
   
    </table></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="102" bgcolor="#282828"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="696" height="102"><img src="images/index_35.gif" width="696" height="102" alt=""></td>
        <td><table width="100%" border="0" cellspacing="10" cellpadding="0">
          <tr>
            <td>Copyright (c) sso.com. All rights reserved. 
Design by Rahul</td>
          </tr>
          <tr>
            <td class="blye-text-regular"><a href="#">Terms of Use</a> | <a href="#">Privacy Statement </a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

</body>
</html>
