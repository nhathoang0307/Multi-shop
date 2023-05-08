package com.example.eshop3.Model;

public class Statuss {
    private int id;
    private String type;

    public Statuss() {
    }

    public Statuss(String type) {
        this.type = type;
    }

    public Statuss(int id, String type) {
        this.id = id;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}