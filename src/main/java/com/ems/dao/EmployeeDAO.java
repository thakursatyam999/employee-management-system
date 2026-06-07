package com.ems.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ems.model.Employee;
import com.ems.util.DBConnection;

public class EmployeeDAO {

    // CREATE

    public boolean addEmployee(Employee emp) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "INSERT INTO employees(name,email,department,salary) VALUES(?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            ps.setDouble(4, emp.getSalary());

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // READ

    public List<Employee> getAllEmployees() {

        List<Employee> list =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM employees";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                Employee emp =
                        new Employee();

                emp.setEmpId(
                        rs.getInt("emp_id"));

                emp.setName(
                        rs.getString("name"));

                emp.setEmail(
                        rs.getString("email"));

                emp.setDepartment(
                        rs.getString("department"));

                emp.setSalary(
                        rs.getDouble("salary"));

                list.add(emp);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public Employee getEmployeeById(int id) {

        Employee emp = null;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM employees WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                emp = new Employee();

                emp.setEmpId(
                        rs.getInt("emp_id"));

                emp.setName(
                        rs.getString("name"));

                emp.setEmail(
                        rs.getString("email"));

                emp.setDepartment(
                        rs.getString("department"));

                emp.setSalary(
                        rs.getDouble("salary"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return emp;
    }
    
    public boolean updateEmployee(Employee emp) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "UPDATE employees SET name=?, email=?, department=?, salary=? WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            ps.setDouble(4, emp.getSalary());
            ps.setInt(5, emp.getEmpId());

            int rows =
                    ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    
    public boolean deleteEmployee(int id) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "DELETE FROM employees WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows =
                    ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    
    public List<Employee> getEmployeesByPage(int start, int total){

        List<Employee> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM employees LIMIT ?, ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, start);
            ps.setInt(2, total);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Employee emp = new Employee();

                emp.setEmpId(rs.getInt("emp_id"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));
                emp.setDepartment(rs.getString("department"));
                emp.setSalary(rs.getDouble("salary"));

                list.add(emp);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
    
    public int getEmployeeCount(){

        int count = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM employees";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return count;
    }
    
    public List<Employee> getEmployeesSorted(String sortBy){

        List<Employee> list =
                new ArrayList<>();

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM employees ORDER BY " +
                    sortBy;

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                Employee emp =
                        new Employee();

                emp.setEmpId(
                        rs.getInt("emp_id"));

                emp.setName(
                        rs.getString("name"));

                emp.setEmail(
                        rs.getString("email"));

                emp.setDepartment(
                        rs.getString("department"));

                emp.setSalary(
                        rs.getDouble("salary"));

                list.add(emp);
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return list;
    }
    
    public int getTotalEmployees(){

        int count = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM employees";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return count;
    }
    
    public int getTotalDepartments(){

        int count = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(DISTINCT department) FROM employees";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return count;
    }
    
    public double getAverageSalary(){

        double avg = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT AVG(salary) FROM employees";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                avg = rs.getDouble(1);
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return avg;
    }
}