/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Impl;

import DBConnection.DBConnection;
import Model.Screens;
import Service.ScreensService;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anup
 */
public class ScreensServiceImpl implements ScreensService {

    @Override
    public List<Screens> getScreenList() {
        List<Screens> screens = new ArrayList<Screens>();
        String query = "select * from screens";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Screens screen = new Screens();
                screen.setScreen_id(resultSet.getInt("screen_id"));
                screen.setName(resultSet.getString("name"));
                screen.setFloor(resultSet.getString("floor"));
                screens.add(screen);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return screens;
    }

    public String getScreenName(int screen_id) {
        String query = "select * from screens where screen_id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        String screen_name = null;
        try {
            preparedStatement.setInt(1, screen_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                screen_name = resultSet.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return screen_name;
    }
}
