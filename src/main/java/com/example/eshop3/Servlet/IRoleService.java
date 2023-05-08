package com.example.eshop3.Servlet;

import com.example.eshop3.Model.Role;

import java.util.List;

public interface IRoleService {
    Role selectRole(int id);

    List<Role> selectAllRole();

}
