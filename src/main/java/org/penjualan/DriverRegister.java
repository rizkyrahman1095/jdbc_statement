package org.penjualan;

import com.mysql.cj.jdbc.Driver;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverRegister {
    void regist() {
        try {
            Driver mysqlDriver = new Driver();
            DriverManager.registerDriver(mysqlDriver);
            System.out.println("Sukses Register Driver");
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }
}
