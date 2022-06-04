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
import com.carrent.beans.Car;
/**
 *
 * @author smit sheth
 */
public class CarDao {
    JdbcTemplate template;
    
    public void setTemplate(JdbcTemplate template) {    
        this.template = template;    
    }
    
    public int save(Car c) throws Exception {    
        String sql="insert into cars(car_name,fuel_type,available_city,car_seat,car_price,car_description, car_owner, owner_mobileno, owner_emailid) values(?,?,?,?,?,?,?,?,?)";    
        return template.update(sql, c.getCname(), c.getFueltype(), c.getCity(), c.getSeat(), c.getPrice(), c.getDescription(), c.getCowner(), c.getOwner_mobile(), c.getOwner_email());    
    }
    
    public List<Car> getAllCars() throws Exception { 
        String sql = "select * from cars";
        List<Car> cars = template.query(sql,new RowMapper<Car>(){ 
            @Override
            public Car mapRow(ResultSet rs, int row) throws SQLException {    
                Car car=new Car();    
                car.setCarid(rs.getInt(1));
                car.setCname(rs.getString(2));
                car.setFueltype(rs.getString(3));
                car.setCity(rs.getString(4));
                car.setSeat(rs.getInt(5));
                car.setPrice(rs.getInt(6));
                car.setDescription(rs.getString(7));
                car.setCowner(rs.getString(8));
                car.setOwner_mobile(rs.getString(9));
                car.setOwner_email(rs.getString(10));
                return car;    
            }    
        });    
        
        return cars;
    }
    
    public Car getCarById(int carid) throws Exception { 
        String sql = "select * from cars where car_id='" + carid + "'";
        List<Car> cars = template.query(sql,new RowMapper<Car>(){ 
            @Override
            public Car mapRow(ResultSet rs, int row) throws SQLException {    
                Car car=new Car();    
                car.setCarid(rs.getInt(1));
                car.setCname(rs.getString(2));
                car.setFueltype(rs.getString(3));
                car.setCity(rs.getString(4));
                car.setSeat(rs.getInt(5));
                car.setPrice(rs.getInt(6));
                car.setDescription(rs.getString(7));
                car.setCowner(rs.getString(8));
                car.setOwner_mobile(rs.getString(9));
                car.setOwner_email(rs.getString(10));
                return car;    
            }    
        });    
        
        return cars.get(0);
    }
    
    public int update(Car c) throws Exception {    
        String sql="update cars " + 
                "set car_name=?,fuel_type=?,available_city=?,car_seat=?,car_price=?,car_description=?, car_owner=?, owner_mobileno=?, owner_emailid=? "
                + "where car_id=?";    
        return template.update(sql, c.getCname(), c.getFueltype(), c.getCity(), c.getSeat(), c.getPrice(), c.getDescription(), c.getCowner(), c.getOwner_mobile(), c.getOwner_email(), c.getCarid());    
    }
    
    public int delete(int carid) throws Exception {    
        String sql="delete from cars where car_id=?";    
        return template.update(sql, carid);    
    }
}
