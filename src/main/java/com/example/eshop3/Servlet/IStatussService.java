package com.example.eshop3.Servlet;

import com.example.eshop3.Model.Statuss;

import java.util.List;

public interface IStatussService {
    Statuss selectStatus(int id);

    List<Statuss> selectAllStatus();
}
