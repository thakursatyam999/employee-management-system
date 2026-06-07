package com.ems.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/employee_management_system";

    private static final String USER =
            "root";

    private static final String PASSWORD =
            "Satyam@mysql2024";

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD);

            System.out.println("Database Connected Successfully!");
            
            System.out.println(
            	    con.getMetaData().getURL()
            	);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return con;
    }
}