<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>USERS</title>
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

<%@ page import="data.DAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="data.Users"%>

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
						<td><a href="#"><img src="images/back.png" alt=""
								width="36" height="32" border="0">
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
						<td><a href="listofgroups.jsp"><img
								src="images/index_13.gif" alt="" width="102" height="41"
								border="0">
						</a>
						</td>
						<td><a href="listofresources.jsp"><img
								src="images/index_14.gif" alt="" width="102" height="41"
								border="0">
						</a>
						</td>
						<td><a href="#"><img src="images/index_15.gif" alt=""
								width="102" height="41" border="0">
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
						<td width="463" background="images/index_17.gif"><table
								width="100%" border="0" cellspacing="10" cellpadding="0">

								<tr>
									<%
										List<Users> users = DAO.getUsers();
									%>
									<td>USER_ID</td>
									<td>COMMON NAME</td>
									<td>SUR_NAME</td>

								</tr>
								<%
									for (Users user : users) {
								%>

								<tr>
									<td><a href="group.jsp?uid=<%=user.getUid()%>"><%=user.getUid()%></a>
									</td>
									<td><%=user.getCn()%></td>
									<td><%=user.getSn()%></td>
									<td><a href="DeleteUser?uid=<%=user.getUid()%>">DELETE
									</a>
									</td>
								</tr>

								<%
									}
								%>

							</table>
						</td>
						<td><img src="images/index_18.jpg" width="537" height="224"
							alt="">
						</td>
					</tr>
				</table>
			</td>
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

