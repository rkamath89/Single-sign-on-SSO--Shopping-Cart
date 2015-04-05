<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GROUP-INFO</title>
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
<%@ page import="data.Users"%>
<%@ page import="data.Resource"%>
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
							height="134" alt="">
						</td>
						<td width="43%"><table width="100%" border="0"
								cellspacing="10" cellpadding="0">
								<tr>
									<td width="21%"><h3 class="white-text">Logout:</h3>
									</td>
									<td><a href="index.html"><img src="images/logout.png"
											alt="" width="36" height="32" border="0">
									</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td><a href="listofgroups.jsp"><img src="images/back.png"
								alt="" width="36" height="32" border="0">
						</a><a href="#"><img src="images/next.png" alt="" width="36"
								height="32" border="0">
						</a>
						</td>
						<td><img src="images/index_11.gif" width="434" height="41"
							alt="">
						</td>
						<td><a href="home.jsp"><img src="images/home.gif" alt=""
								width="102" height="41" border="0">
						</a>
						</td>
						<td><a href="listofresources.jsp"><img
								src="images/index_14.gif" alt="" width="102" height="41"
								border="0">
						</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="100%" border="2" bordercolor="black"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="463" background="images/index_17.gif">
							<table width="100%" border="2" bordercolor="3E79A3">

								<tr>
									<td><font color="black">USER NAME</font>
									</td>
								</tr>




								<%
									String gname = request.getParameter("gname");
									List<String> uId = DAO.getGroupUsers(gname);
									Iterator<String> it = uId.iterator();
									while (it.hasNext()) {
										String userId = it.next();
								%>
								<tr>
									<td><%=userId%></td>
									<td><a
										href="removeAUserFromGroup?uid=<%=userId%>&&gname=<%=gname%>">REMOVE
											FROM GROUP </a>
									</td>
								</tr>

								<%
									}
								%>
							</table>
							<table width="100%" border="2" bordercolor="3E79A3">
								<tr>
									<td><font color="black">ResourceId</font>
									</td>
									<td><font color="black">ResourceName</font>
									</td>
									<td><font color="black">Resource Path</font>
									</td>
								</tr>
								<%
									String gname1 = request.getParameter("gname");
									Map<String, Resource> resList = DAO.getResourcesForGroup(gname1);
									Set<String> resId = resList.keySet();
									Iterator<String> it1 = resId.iterator();
									while (it1.hasNext()) {
										Resource res = resList.get(it1.next());
								%>

								<tr>
									<td><%=res.getResId()%></td>
									<td><%=res.getResName()%></td>
									<td><%=res.getPath()%></td>
									<td><a
										href="deleteResourceFromGroup?gname=<%=gname%>&&resId=<%=res.getResId()%>">REMOVE
											RESOURCE</a>
									</td>
								</tr>
								<%
									}
								%>




							</table></td>
						<td><img src="images/index_18.jpg" width="537" height="224"
							alt="">
						</td>
					<tr>
						<td>
							<form method="post" action="addNewUserToGroup?gname=<%=gname%>">
								Add New USER TO GROUP :
								<%
								List<Users> alluserslist = DAO.getUsers();
								Iterator<Users> it3 = alluserslist.iterator();
							%>
								<select name="newuser">
									<%
										boolean userexists = false;
										while (it3.hasNext()) {
											Users user = it3.next();
											List<String> uId4 = DAO.getGroupUsers(gname);
											Iterator<String> it4 = uId.iterator();
											while (it4.hasNext()) {

												if (user.getUid().equals(it4.next())) {

													userexists = true;
													break;
												}

											}

											if (userexists != true) {
												out.println("<option>" + user.getUid() + "</option>");

											} else
												userexists = false;
										}
									%>
								</select> <input type="submit" value="Add User to Group" />
							</form></td>
					</tr>




					<tr>
						<td>
							<form method="post"
								action="addNewResourceToGroup?gname=<%=gname%>">
								Add NEW RESOURCE TO GROUP :
								<%
								Map<String, String> resourcesNotInGroup = DAO
										.selectResourcesNotInGroup(gname);
								Set<String> resourceId = resourcesNotInGroup.keySet();
							%>
								<select name="newGroupresource">
									<%
										Iterator<String> resourceIt = resourceId.iterator();
										while (resourceIt.hasNext()) {
											out.println("<option >"
													+ resourcesNotInGroup.get(resourceIt.next())
													+ "</option>");

										}
									%>

								</select> <input type="checkbox" name="read" checked="checked" value="r" />
								<input type="checkbox" name="write" value="w" /> <input
									type="checkbox" name="exec" value="e" /> <input type="submit"
									value="Add Resource to Group" />
							</form></td>
					</tr>









				</table>
		</tr>

	</table>
	<table width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="102" bgcolor="#282828"><table width="100%"
					border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="696" height="102"><img src="images/index_35.gif"
							width="696" height="102" alt="">
						</td>
						<td><table width="100%" border="0" cellspacing="10"
								cellpadding="0">
								<tr>
									<td>Copyright (c) sso.com. All rights reserved. Design by
										Rahul</td>
								</tr>
								<tr>
									<td class="blye-text-regular"><a href="#">Terms of Use</a>
										| <a href="#">Privacy Statement </a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>
