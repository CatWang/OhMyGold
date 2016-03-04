package weath.entity;

/**
 * Created by lenovo on 2015/7/20.
 */
public class User {


    private String UserID;
    private String name;
    private String pwd;
    private String email;
    private String brief;
    private String profession;
    private String property;
    private String bankaccount;
    private String id;
    private String type;
    private String type_chinese;

    public String getType_chinese() {
        return type_chinese;
    }

    public void setType_chinese(String type_chinese) {
        this.type_chinese = type_chinese;
    }

    private int dealamount;
    private String picaddress;
    private double credit;
    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public int getDealamount() {
        return dealamount;
    }

    public void setDealamount(int dealamount) {
        this.dealamount = dealamount;
    }

    public String getPicaddress() {
        return picaddress;
    }

    public void setPicaddress(String picaddress) {
        this.picaddress = picaddress;
    }

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getBankaccount() {
        return bankaccount;
    }

    public void setBankaccount(String bankaccount) {
        this.bankaccount = bankaccount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
