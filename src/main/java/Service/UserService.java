/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Model.User;
import java.util.List;

/**
 *
 * @author Anup
 */
public interface UserService {
    public boolean isUserExist(String username);
    public User getUser(String username);
    public void insertUser(User User);
    public List<User> getUserList();
    public void deleteUser(int id);
}
