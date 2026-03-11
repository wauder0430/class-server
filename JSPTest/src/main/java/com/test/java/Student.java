package com.test.java;

public class Student {
    // ${s1.address} == s1.getAddress()
    // - get + address > get + Address > getAddress()

    private String name;
    private String gender;
    private String address;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTest() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
