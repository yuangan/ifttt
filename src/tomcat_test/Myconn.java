package tomcat_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Myconn {
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	private int conn;
	
	public void connectdatabase(){     //锟斤拷锟斤拷锟斤拷锟捷库函锟斤拷
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			String url="jdbc:mysql://localhost:3306/ifttt?user=root&password=123456";
			con=DriverManager.getConnection(url);
//			stmt=con.createStatement();			
			}

		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void close(){             //锟截憋拷锟斤拷锟斤拷
		try{
		if(stmt!=null){
			stmt.close();
			stmt=null;
		}
		if(con!=null){
			con.close();
			con=null;
		}
		    
		}
	
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ResultSet GetDataReader(String _sql){          //锟斤拷锟斤拷锟捷匡拷锟饺★拷锟较拷锟斤拷锟铰绞憋拷玫锟�
		try{
		    stmt=con.createStatement();
			rs=stmt.executeQuery(_sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	
	}
	
	public int GetRegisterInfo(String _sql){            //锟斤拷锟斤拷锟捷匡拷锟斤拷锟斤拷锟较拷锟阶拷锟绞憋拷玫锟�
		try {
			stmt=con.createStatement();
			conn= stmt.executeUpdate(_sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public void ExecuteSql(String _sql){
		GetRegisterInfo(_sql);
	}
}
