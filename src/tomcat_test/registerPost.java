package tomcat_test;
import java.sql.*;
import java.util.*;
public class registerPost  {
 private static Connection con = null;
   private static Statement stmt = null;
   private static ResultSet rs = null;
   
   public void connect()throws SQLException,ClassNotFoundException{

	 String url = "jdbc:mysql://localhost:3306/ifttt"; //�������޸����ݿ���
      Class.forName("com.mysql.jdbc.Driver");//�������޸����ݿ⣬���õ���Mysql
 

   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ifttt?user=root&password=123456&useUnicode=true&characterEncoding=GB2312");//�������޸����ݿ�Mysql����Ϣ
 
   }
   
   public ResultSet select(String query)
   {
    System.out.println(query);
    try {
   stmt = con.createStatement();
   rs = stmt.executeQuery(query);
  } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
  }
   return rs;
   }
   public void update(String upstr)
   {
    System.out.println(upstr);
    try {
   stmt = con.createStatement();
   int rs = stmt.executeUpdate(upstr);
  } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
  }

}
   public void close()
   {
    try {
   stmt.close();
   con.close();
  } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
  }

}

}