package org.tedu.com.entity;

/**
 * @anthor: Banana
 * @function: 用户实体类
 * @date: 2019/6/21
 */
public class User {

    private Integer id;//用户ID

    private String userName;//用户名字

    private String password;//用户登录密码

    private String address;//用户住址

    private String photo;//用户头像

    private Integer sex;//用户性别,0表示性别未知，1表示女，2表示男

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", photo='" + photo + '\'' +
                ", sex=" + sex +
                '}';
    }
}
