<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

var passwordvalid = "";
var uservalid ="";

function verifyusername()
{
	var username = document.getElementById("username").value;
    uservalid=true;
	if(username == "")
		{
		uservalid = false;
		alert("ENTER A USER-NAME");
		}
	else if(!username.match(/^[0-9a-zA-Z]*$/))
	{
		uservalid = false;
		alert("ENTER A VALID USER-NAME");
	}
	else
	{
		  uservalid = true;
		  
	}
	

}
function verifypassword()
{
	var password = document.getElementById("password").value;
	passwordvalid=true;
	if(password == "")
		{
		passwordvalid = false;
		alert("ENTER A PASSWORD");
		}
	else if(!password.match(/^[0-9a-zA-Z]*$/))
	{
		passwordvalid = false;
		alert("ENTER A VALID PASSWORD");
	}
	else
	{
		passwordvalid = true;
	}

}
function validate()
{
	if( uservalid == false || passwordvalid== false )
		{
		alert("INVALID LOGIN");
		return false;
		}
	else
		return true;
}
</script>
<title>LOGIN</title>
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
									<td width="21%"><h3 class="white-text">Go to Main
											PAGE:</h3>
									</td>
									<td width="24%"><a href="index.html"><img
											src="images/home.png" alt="" width="40" height="40"
											border="0">
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
						<td width="463" background="images/index_17.gif"><table
								width="100%" border="0" cellspacing="10" cellpadding="0">
								<tr>
									<td><h4 class="white-text">--------Secure
											Login--------</h4>
									</td>
								</tr>
								<tr>
									<td>SINGLE SIGN ON PROJECT, RAHUL</td>
								</tr>
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
			<td class="p2"><table width="100%" border="0" cellpadding="0"
					cellspacing="10">
					<tr>
						<td><form method="post" name="login" action="Authentication"
								onsubmit="return validate()">
								
								<table width="100%" border="0" cellpadding="0" align="center"
									cellspacing="0">
									<tr>
										<td><table width="100%" border="0" cellpadding="4"
												cellspacing="1">
												<div id="err">
													<%
														String msg = (String) request.getAttribute("msg");
														if (msg != null)
															out.println(msg);
													%>
												</div>
												<tr>
													<td align="Right"><b> UserName: <span
															class="style1">*</span>
													</b>
													</td>
													<td width="70%"><input type="TEXT" name="username"
														id="username" style="width: 40%"
														onchange="verifyusername();"></td>
												</tr>
												<tr>
													<td align="Right"><b> Password : <span
															class="style1">*</span>
													</b>
													</td>
													<td><input type="password" name="password" id="password"
														style="width: 40%" onchange="verifypassword();">
													</td>
												</tr>

												<tr>
													<td colspan="2" align="center"><input type="submit"
														name="Submit" value="Submit"> <br></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</form>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="images/index_34.gif" width="1000" height="59"
				alt="">
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
										Rahul <a href="http://www.stylishtemplate.com"
										style="color: #666666">SECURITY</a>.</td>
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