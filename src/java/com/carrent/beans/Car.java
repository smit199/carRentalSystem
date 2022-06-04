/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.carrent.beans;
/**
 *
 * @author smit sheth
 */
public class Car {
    private int carid;
    private String cname;
    private String cowner;
    private String owner_mobile;
    private String owner_email;

    private String fueltype;
    private String city;
    private int seat;
    private int price;
    private String description; 
    
    public int getCarid() {
        return carid;
    }

    public void setCarid(int carid) {
        this.carid = carid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
    
    public String getCowner() {
        return cowner;
    }

    public void setCowner(String cowner) {
        this.cowner = cowner;
    }

    public String getOwner_mobile() {
        return owner_mobile;
    }

    public void setOwner_mobile(String owner_mobile) {
        this.owner_mobile = owner_mobile;
    }
    
    public String getOwner_email() {
        return owner_email;
    }

    public void setOwner_email(String owner_email) {
        this.owner_email = owner_email;
    }

    public String getFueltype() {
        return fueltype;
    }

    public void setFueltype(String fueltype) {
        this.fueltype = fueltype;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
            
}
