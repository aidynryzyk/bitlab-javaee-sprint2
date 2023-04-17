package db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnector {

    private static final Connection connection;

    static {
        Properties properties = new Properties();
        try {
            properties.load(DBConnector.class.getClassLoader().getResourceAsStream("app.properties"));
            Class.forName(properties.getProperty("mysql.driver"));
            connection = DriverManager.getConnection(
                    properties.getProperty("mysql.url"),
                    properties.getProperty("user"),
                    properties.getProperty("password")
            );
        } catch (IOException | ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() {
        return connection;
    }

}
