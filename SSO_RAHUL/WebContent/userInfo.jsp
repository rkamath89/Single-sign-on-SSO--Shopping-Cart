<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>USER-INFO</title>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1251">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #FF0000
}
-->
</style>
</head>

<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@ page import="data.DAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="data.Users"%>
<%@ page import="data.Resource"%>
<%@page import="java.util.Iterator"%>


<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0"
	marginheight="0">
	<table width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td bgcolor="#282828"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="57%"><img src="images/index_01.gif" width="573"
							height="134" alt=""></td>
						<td width="43%"><table width="100%" border="0"
								cellspacing="10" cellpadding="0">
								<tr>
									<td width="21%"><h3 class="white-text">Logout:</h3></td>
									<td><a href="index.html"><img src="images/logout.png"
											alt="" width="36" height="32" border="0"> </a></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td><img src="images/index_11.gif" width="434" height="41"
							alt=""></td>
						<td><font color="red">LOGGED IN AS :<%=request.getParameter("uid")%></font>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table width="100%" border="2" bordercolor="black"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="463" background="images/index_17.gif"><table
								width="100%" border="2" bordercolor="3E79A3">

								
								<%
									String uid = request.getParameter("uid");
									Map<String, String> map = DAO.getGroups(uid);
									Set<String> key = map.keySet();

									for (String groupid : key) {
								%>
								<tr>
									<td><font color="black">Group Name </font></td>
									<td><font color="black">GroupInfo </font>
									</td>
								</tr>

								<tr>
									<td><font ><%=groupid%></font></td>
									<td><font ><%=map.get(groupid)%></font></td>
								<tr>
									<td><font color="FF6633">RES_ID </font>
									</td>
									<td><font color="FF6633">READ </font>
									</td>
									<td><font color="FF6633">WRITE </font>
									</td>
									<td><font color="FF6633">EXECUTE </font>
									</td>
								</tr>
								<%
									Map<String, Resource> resmap = DAO
												.usergetResourcesForGroup(groupid);
										Set<String> resset = resmap.keySet();
										Iterator<String> resit = resset.iterator();
										while (resit.hasNext()) {

											String resid12 = resit.next();
											Resource rs12 = resmap.get(resid12);
								%>
								<tr>
									<td><%=rs12.getResId()%></td>
									<td><%=rs12.getRead()%></td>
									<td><%=rs12.getWrite()%></td>
									<td><%=rs12.getExecute()%></td>

									<%
										}
										}
									%>
								</tr>



							</table>
							<table width="100%" border="2" bordercolor="3E79A3">
								<tr>
									<td><font color="33FF33"> Resource Name </font></td>
									<td><font color="33FF33"> Resource Id </font></td>
									<td><font color="33FF33">ResourcePath</font></td>
									<td><font color="33FF33">READ</font></td>
									<td><font color="33FF33">WRITE</font></td>
									<td><font color="33FF33">EXECUTE</font></td>
								</tr>
								<%
									String uid1 = request.getParameter("uid");
									Map<String, Resource> map1 = DAO.getResources(uid1);
									Set<String> key1 = map1.keySet();

									for (String resourceid : key1) {
										Resource rs1 = map1.get(resourceid);
								%>
								<tr>
									<td><%=rs1.getResName()%></td>
									<td><%=rs1.getResId()%></td>
									<td><%=rs1.getPath()%></td>
									<td><%=rs1.getRead()%></td>
									<td><%=rs1.getWrite()%></td>
									<td><%=rs1.getExecute()%></td>
									
									<%if(rs1.getRead().equals("y") && rs1.getWrite().equals("y") && rs1.getWrite().equals("y")) {%>
									<td><a href="removeResourceForUser?resId=<%=rs1.getResId()%>&&uid=<%=uid%>">REMOVE RESOURCE FOR<%=uid1%></a></td>
									<td><a href="userChangePermission.jsp?uid=<%=uid%>&&resId=<%=rs1.getResId()%>" >CHANGE PERMISSIONS</a></td>
									<%} %>
										
								</tr>
								<%
									}
								%>

								<!-- </tr> -->

							</table></td>
					</tr>
				</table>
				<table width="1000" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="102" bgcolor="#282828"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="696" height="102"><img
										src="images/index_35.gif" width="696" height="102" alt="">
									</td>
									<td><table width="100%" border="0" cellspacing="10"
											cellpadding="0">
											<tr>
												<td>Copyright (c) sso.com. All rights reserved. Design
													by Rahul</td>
											</tr>
											<tr>
												<td class="blye-text-regular"><a href="#">Terms of
														Use</a> | <a href="#">Privacy Statement </a></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
				</table>
</body>
</html>
