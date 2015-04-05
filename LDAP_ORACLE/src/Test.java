import java.sql.SQLException;
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;


public class Test {
	public static void main(String[] args) throws NamingException {

        Hashtable env = new Hashtable();

        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, "ldap://localhost:10389/ou=users,ou=system?sn,uid,cn,objectClass?sub?(objectClass=*)");
        env.put(Context.SECURITY_PRINCIPAL, "uid=admin,ou=system");
        env.put(Context.SECURITY_CREDENTIALS, "secret");
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        InitialDirContext ctx = new InitialDirContext(env);
       
        Attributes attrs = ctx.getAttributes("");
        NamingEnumeration enm = attrs.getAll();
        String[] matchAttrs = {"uid","cn", "sn"};
        SearchControls search=new SearchControls();
        search.setReturningAttributes(matchAttrs);
      //  matchAttrs.put(new BasicAttribute("mail"));
        // Search for objects that have those matching attributes
        NamingEnumeration answer = ctx.search("","cn=*", search);
        while (answer.hasMore()) {
            SearchResult sr = (SearchResult)answer.next();
            System.out.println(sr.getName());
            Attributes arr=sr.getAttributes();
            String uid=null;
            String cn=null;
            String sn=null;
            if(arr.get("uid") != null)
            uid=(String) arr.get("uid").get();
            if(arr.get("cn") != null)
            cn=(String)arr.get("cn").get();
            if(arr.get("sn") != null)
            sn=(String) arr.get("sn").get();

            System.out.println(">>>" + sr.getName());
            System.out.println(sr.getAttributes());
            
            if(uid != null )
            DAO.addUser(uid, cn, sn);
        }
    }
}
