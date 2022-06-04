/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.carrent.dao;
import com.carrent.beans.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author smit sheth
 */
public class UserDao {
    JdbcTemplate template;
    
    public void setTemplate(JdbcTemplate template) {    
        this.template = template;    
    }
    
    public int save(User u) throws Exception{    
        String sql="insert into users(first_name,last_name,username,emailid,password) values(?,?,?,?,?)";    
        return template.update(sql, u.getFname(), u.getLname(), u.getUsername(), u.getEmail(), u.getPassword());    
    }
    
    public List<User> validUser(String uname, String pwd) throws Exception { 
        String sql = "select * from users where username='" + uname + "' and password='" + pwd + "'";
        List<User> user = template.query(sql,new RowMapper<User>(){ 
            @Override
            public User mapRow(ResultSet rs, int row) throws SQLException {    
                User u=new User();    
                u.setUserid(rs.getInt(1));
                u.setFname(rs.getString(2));
                u.setLname(rs.getString(3));
                u.setUsername(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPassword(rs.getString(6));
                return u;    
            }    
        });    
        
        return user;
    }
}
