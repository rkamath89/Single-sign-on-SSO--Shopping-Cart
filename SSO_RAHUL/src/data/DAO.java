package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

public class DAO {
	static Connection conn = null;
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@10.80.16.238:1522:ora11gin", "markdev",
					"markdev");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static List<Users> getUsers() throws SQLException {
		Statement st = null;
		Users user = null;
		List<Users> list = new ArrayList();
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "select * from RAHUL_USER";
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			user = new Users(rs.getString(1), rs.getString(2), rs.getString(3));
			list.add(user);
		}
		return list;
	}

	public static void deleteUser(String uid) throws SQLException {
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "delete from RAHUL_USER where user_id='" + uid + "'";
		st.executeQuery(sql);

	}

	public static Map<String, String> getGroups(String uid) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		String sql = "select rg.GROUP_NAME,rg.DESCRIPTION from RAHUL_GROUPS rg where rg.GROUP_NAME IN(select rgu.GROUP_NAME from RAHUL_GROUPUSERS rgu where rgu.USER_ID='"
				+ uid + "')";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			map.put(rs.getString(1), rs.getString(2));
		}
		return map;

	}

	public static String getGroupDetails(String gname) throws SQLException {

		String sql = "select description from RAHUL_GROUPS where group_name='"
				+ gname + "'";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			return rs.getString(1);
		}
		return null;
	}

	public static void removeGroup(String gname) throws SQLException {
		String sql = "delete from RAHUL_GROUPS where group_name='" + gname
				+ "'";
		Statement st = conn.createStatement();
		st.executeQuery(sql);
	}

	public static Map<String, Resource> getResources(String uid)
			throws SQLException {
		Map<String, Resource> map = new HashMap<String, Resource>();
		Statement st = conn.createStatement();
		ResultSet rs = st
				.executeQuery("select * from RAHUL_USER_RESOURCE where USER_ID='"
						+ uid + "'");
		while (rs.next()) {
			map.put(rs.getString(2),
					new Resource(rs.getString(2), rs.getString(3), rs
							.getString(4), rs.getString(5)));
		}
		st = conn.createStatement();
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		while (it.hasNext()) {
			String rid = it.next();
			rs = st.executeQuery("select * from RAHUL_RESOURCES where RES_ID='"
					+ rid + "'");
			if (rs.next()) {
				Resource resource = map.get(rid);
				resource.setResName(rs.getString(2));
				resource.setPath(rs.getString(3));
				map.put(rid, resource);
			}

		}
		return map;
	}

	public static Map<String, Resource> getResourceDetails(String resId)
			throws SQLException {
		Map<String, Resource> map = new HashMap<String, Resource>();
		Statement st = conn.createStatement();

		ResultSet rs = st
				.executeQuery("select * from RAHUL_USER_RESOURCE where RES_ID='"
						+ resId + "'");
		while (rs.next()) {
			map.put(rs.getString(2),
					new Resource(rs.getString(2), rs.getString(3), rs
							.getString(4), rs.getString(5)));
		}
		st = conn.createStatement();
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		while (it.hasNext()) {
			String rid = it.next();
			rs = st.executeQuery("select * from RAHUL_RESOURCES where RES_ID='"
					+ rid + "'");
			if (rs.next()) {
				Resource resource = map.get(rid);
				resource.setResName(rs.getString(2));
				resource.setPath(rs.getString(3));
				map.put(rid, resource);
			}

		}
		return map;
	}

	public static void updateWrite(String value, String rid, String uid) {
		String sql = "update RAHUL_USER_RESOURCE set write='" + value
				+ "' where user_id='" + uid + "' and res_id='" + rid + "'";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void updateExec(String value, String rid, String uid) {
		String sql = "update RAHUL_USER_RESOURCE set execute='" + value
				+ "' where user_id='" + uid + "' and res_id='" + rid + "'";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void updateRead(String value, String rid, String uid) {
		String sql = "update RAHUL_USER_RESOURCE set read='" + value
				+ "' where user_id='" + uid + "' and res_id='" + rid + "'";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void deleteResourceForUser(String rid, String uid) {
		String sql = "delete from RAHUL_USER_RESOURCE where user_id='" + uid
				+ "' and res_id='" + rid + "'";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void removeUserFromGroup(String gname, String uid) {
		String sql = "delete from RAHUL_GROUPUSERS where user_id='" + uid
				+ "'and group_name='" + gname + "'";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Map<String, String> listOfGroups() {
		Map<String, String> groups = new HashMap<String, String>();
		String sql = "select * from RAHUL_GROUPS";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while (rs.next()) {
				groups.put(rs.getString(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return groups;
	}

	public static Map<String, String> listofresources() {
		String sql = "select * from RAHUL_RESOURCES";
		Map<String, String> resourcelist = new HashMap<String, String>();
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while (rs.next()) {
				resourcelist.put(rs.getString(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resourcelist;

	}

	public static void deleteAllResources(String resId) {
		String sql = "delete from RAHUL_RESOURCES where res_id='" + resId
				+ "'";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void createNewGroup(String gname, String desc)
			throws SQLException {
		String sql = "insert into RAHUL_GROUPS (GROUP_NAME,DESCRIPTION) values('"
				+ gname + "','" + desc + "')";
		Statement st = conn.createStatement();
		st.executeQuery(sql);
	}

	public static void createNewResource(String resId, String resName,
			String resPath) throws SQLException {
		String sql = "insert into RAHUL_RESOURCES (RES_ID,RES_NAME,PATH) values('"
				+ resId + "','" + resName + "','" + resPath + "')";
		Statement st = conn.createStatement();
		try {
			st.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void addUserToGroup(String uid, String gname)
			throws SQLException {
		String sql = "insert into RAHUL_GROUPUSERS (USER_ID,GROUP_NAME) values ('"
				+ uid + "','" + gname + "')";
		Statement st = conn.createStatement();
		try {
			st.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void addResourceToUser(String uid, String resname)
			throws SQLException {

		String sql = "select RES_ID from RAHUL_RESOURCES where RES_NAME ='"
				+ resname + "'";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String resId = null;
		while (rs.next()) {
			resId = rs.getString(1);
		}
		String sql1 = "insert into RAHUL_USER_RESOURCE (USER_ID,RES_ID) values('"
				+ uid + "','" + resId + "')";
		Statement st1 = conn.createStatement();
		st1.execute(sql1);

	}

	public static String getResourceId(String resname) throws SQLException {
		String sql = "select RES_ID from RAHUL_RESOURCES where RES_NAME ='"
				+ resname + "'";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String resId = null;
		while (rs.next()) {
			return rs.getString(1);
		}
		return null;
	}

	public static List<String> getGroupUsers(String gname) throws SQLException {
		List<String> uid = new ArrayList<String>();

		String sql = "select USER_ID from RAHUL_GROUPUSERS where GROUP_NAME='"
				+ gname + "'";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			uid.add(rs.getString(1));
		}
		return uid;

	}

	public static Map<String, Resource> getResourcesForGroup(String gname)
			throws SQLException {
		Map<String, Resource> map = new HashMap<String, Resource>();
		Statement st = conn.createStatement();
		ResultSet rs = st
				.executeQuery("select * from RAHUL_GROUP_RESOURCES where GROUP_NAME='"
						+ gname + "'");
		while (rs.next()) {
			Resource res = new Resource();
			res.setResId(rs.getString(2));
			res.setRead(rs.getString(3));
			res.setWrite(rs.getString(4));
			res.setExecute(rs.getString(5));
			map.put(rs.getString(2), res);
		}

		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		while (it.hasNext()) {
			String rid = it.next();
			rs = st.executeQuery("select * from RAHUL_RESOURCES where RES_ID='"
					+ rid + "'");
			if (rs.next()) {
				Resource resource = map.get(rid);
				resource.setResName(rs.getString(2));
				resource.setPath(rs.getString(3));
				map.put(rid, resource);
			}

		}
		return map;
	}

	public static Map<String, String> selectResourcesNotInGroup(String gname)
			throws SQLException {
		Map<String, String> resources = new HashMap<String, String>();
		String sql = "select RES_ID,RES_NAME from RAHUL_RESOURCES where RES_ID NOT IN(select RES_ID from RAHUL_GROUP_RESOURCES where GROUP_NAME ='"
				+ gname + "')";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			resources.put(rs.getString(1), rs.getString(2));
		}
		return resources;
	}

	public static void addNewResourceToGroup(String gname, String resName,
			String read, String write, String exec) throws SQLException {
		String sql1 = "select RES_ID from RAHUL_RESOURCES where RES_NAME='"
				+ resName + "'";
		Statement st1 = conn.createStatement();
		ResultSet rs1 = st1.executeQuery(sql1);
		String resId = null;
		while (rs1.next()) {
			resId = rs1.getString(1);
		}
		String sql = "insert into RAHUL_GROUP_RESOURCES (GROUP_NAME,RES_ID,READ,WRITE,EXECUTE) values('"+ gname+ "','"+ resId+ "','"+ read+ "','"+ write+ "','"+ exec + "')";

		Statement st = conn.createStatement();
		st.execute(sql);

	}

	public static void deleteResourceFromGroup(String gname, String resId)
			throws SQLException {
		String sql = "delete from RAHUL_GROUP_RESOURCES where GROUP_NAME='"
				+ gname + "' and RES_ID='" + resId + "'";
		Statement st = conn.createStatement();
		st.execute(sql);
	}

	public static List<String> getUsersUsingResource(String resId)
			throws SQLException {
		List<String> users = new ArrayList<String>();
		String sql = "select USER_ID from RAHUL_USER_RESOURCE where RES_ID='"
				+ resId + "'";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			users.add(rs.getString(1));
		}
		return users;
	}

	public static Map<String, Resource> getResourcesForUsersInGroup(String uId,
			String resId) throws SQLException {
		Map<String, Resource> resources = new HashMap<String, Resource>();
		String sql = "select RES_ID,READ,WRITE,EXECUTE from RAHUL_USER_RESOURCE where USER_ID='"
				+ uId + "' and RES_ID='" + resId + "'";
		Resource res = new Resource();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			res.setResId(rs.getString(1));
			res.setRead(rs.getString(2));
			res.setWrite(rs.getString(3));
			res.setExecute(rs.getString(4));
			resources.put(rs.getString(1), res);

		}
		return resources;
	}

	public static void removeResourceForUserFromGroup(String resId, String uId)
			throws SQLException {
		String sql = "delete from RAHUL_USER_RESOURCE where USER_ID='" + uId
				+ "'and RES_ID='" + resId + "'";
		Statement st = conn.createStatement();
		st.executeUpdate(sql);
	}


	public static Map<String, Resource> getgetResourceInfoForGroup(String resId)
			throws SQLException {
		String sql = "select * from RAHUL_GROUP_RESOURCES where RES_ID='"
				+ resId + "'";
		Map<String, Resource> resMap = new HashMap<String, Resource>();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		Resource res = new Resource();
		while (rs.next()) {
			res.setResId(rs.getString(2));
			res.setRead(rs.getString(3));
			res.setWrite(rs.getString(4));
			res.setExecute(rs.getString(5));
			resMap.put(rs.getString(1), res);

		}
		return resMap;

	}

	public static void removeResourceForGroup(String resId, String gname)
			throws SQLException {
		String sql = "delete from RAHUL_GROUP_RESOURCES where GROUP_NAME='"
				+ gname + "' and RES_ID='" + resId + "'";
		Statement st = conn.createStatement();
		st.execute(sql);
	}

	public static void removeResourceForUser(String resId, String uid)
			throws SQLException {
		String sql = "delete from RAHUL_USER_RESOURCE where USER_ID='" + uid
				+ "' and RES_ID='" + resId + "'";
		Statement st = conn.createStatement();
		st.executeUpdate(sql);
	}

	public static Map<String, Resource> usergetResourcesForGroup(String gname)
			throws SQLException {
		Map<String, Resource> map = new HashMap<String, Resource>();
		Statement st = conn.createStatement();
		ResultSet rs = st
				.executeQuery("select * from RAHUL_GROUP_RESOURCES where GROUP_NAME='"
						+ gname + "'");
		while (rs.next()) {
			Resource res = new Resource();
			res.setResId(rs.getString(2));
			res.setRead(rs.getString(3));
			res.setWrite(rs.getString(4));
			res.setExecute(rs.getString(5));
			map.put(rs.getString(2), res);
		}
		return map;

	}

}
