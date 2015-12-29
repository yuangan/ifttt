import java.sql.*;


public class user {
	private String username;
	private String password;
	private String email;
	private String phone;
	private char gender;
	
	public user(String u,String p,String e,String ph,char g){
		username=u;
		password=p;
		email=e;
		phone=ph;
		gender=g;
	}
	
	public static void connectdatabase(){
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			String url="jdbc:mysql://localhost:3306/mobosql?user=root&password=a4461620";
			Connection con=DriverManager.getConnection(url);
			Statement stmt=con.createStatement();
			String query="select * from user";
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()){
				System.out.print(rs.getString(1)+" ");
				System.out.print(rs.getString(2)+" ");
				System.out.print(rs.getString(3)+" ");
				System.out.print(rs.getString(4)+" ");
				System.out.print(rs.getString(5)+" ");
			}
			
			if(rs!=null){
				rs.close();
				rs=null;
			}
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
	
	public static void main(String[] args){
		connectdatabase();
	}
		

}
