package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.USER.UserDetails;

public class UserDAO {
	private Connection conn;
	
    
		public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}


		public boolean addUser(UserDetails us)
		{
			boolean f=false;
			try {
				String query="insert into register(name,email,mobile,password,secque,secans) values(?,?,?,?,?,?)";
				PreparedStatement ps=conn.prepareStatement(query);
				ps.setString(1, us.getName());
				ps.setString(2, us.getEmail());
				ps.setString(3, us.getMobile());
				ps.setString(4, us.getPassword());
				ps.setString(5, us.getSecque());
				ps.setString(6, us.getSecans());
				int i=ps.executeUpdate();
				if(i==1)
				{
					f=true;
					
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return f;
			
		}
	public UserDetails loginUser(UserDetails us)
	{
		UserDetails user=null;
		try {
			String query="select * from register where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
            	user= new UserDetails();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            	user.setMobile(rs.getString("mobile"));
            	user.setPassword(rs.getString("password"));
                user.setSecque(rs.getString("secque"));
                user.setSecans(rs.getString("secans"));
            }
            
		} catch (Exception e) {
			e.printStackTrace();
		}
			return user;
	}
}
