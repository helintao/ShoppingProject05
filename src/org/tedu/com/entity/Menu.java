package org.tedu.com.entity;

/**
 * @anthor: Banana
 * @function: 封装菜单相关信息
 * @date: 2019/6/24
 */
public class Menu {

    private Integer id;//菜单id

    private String name;//菜单名称

    private Integer parentId;//父级菜单的id

    private String url;//菜单的保存路径

    private String icon;//菜单的图标

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", url='" + url + '\'' +
                ", icon='" + icon + '\'' +
                '}';
    }
}
