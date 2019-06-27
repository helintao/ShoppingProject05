package org.tedu.com.entity;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/26
 */
public class Page {

    private int page = 1;//默认当前页为1

    private int rows;//表示每页显示多少条数据

    private int offset;//偏移量

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getOffset() {
        this.offset = (page - 1) * rows;
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }
}
