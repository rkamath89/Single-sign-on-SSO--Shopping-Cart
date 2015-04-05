<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>createNewGroup</title>
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
<script type="text/javascript">

function validate()
{
	var groupname = document.getElementById("groupname").value;
	var desc = document.getElementById("desc").value;
	
	
	if(groupname == "")
		{
		alert ("NULL VALUES CANNOT BE ENTERED");
		return false;
		
		}
		else if(desc == "")
		{
			alert ("NULL VALUES CANNOT BE ENTERED");
			return false;
			
			}
			
				else
					return true;

}




</script>
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
									<td width="21%"><h3 class="white-text">Logout</h3>
									</td>
									<td width="24%"><a href="index.html"><img
											src="images/logout.jpg" alt="" width="40" height="40"
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
											Site--------</h4>
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
						<td><form name="createNewGroup" action="createNewGroup" onsubmit="return validate()">
								
								<table width="100%" border="0" cellpadding="0" align="center"
									cellspacing="0">
									<tr>
										<td><table width="100%" border="0" cellpadding="4"
												cellspacing="1">
												<tr>
													<td align="Right"><b> Group Name: <span
															class="style1">*</span>
													</b>
													</td>
													<td width="70%"><input type="TEXT" name="groupname"
														id="groupname" style="width: 40%";"></td>
												</tr>
												<tr>
													<td align="Right"><b> Group Description: <span
															class="style1">*</span>
													</b>
													</td>
													<td><input type="TEXT" name="desc" id="desc"
														style="width: 40%";">
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