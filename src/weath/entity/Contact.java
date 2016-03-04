package weath.entity;

/**
 * Created by lenovo on 2015/7/23.
 */
public class Contact {
    private String contactID;

    public String getContactID() {
        return contactID;
    }

    public void setContactID(String contactID) {
        this.contactID = contactID;
    }

    private String partener1ID;
    private String partener2ID;
    private int year;
    private int month;
    private String province;
    private String city;
    private double lossratio;
    private double protocoltemperature;
    private String part1temperature;
    private String part2temperature;
    private String status;
    private String part1signed;
    private String part2signed;

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getLossratio() {
        return lossratio;
    }

    public void setLossratio(double lossratio) {
        this.lossratio = lossratio;
    }

    public double getProtocoltemperature() {
        return protocoltemperature;
    }

    public void setProtocoltemperature(double protocoltemperature) {
        this.protocoltemperature = protocoltemperature;
    }

    public String getPart1temperature() {
        return part1temperature;
    }

    public void setPart1temperature(String part1temperature) {
        this.part1temperature = part1temperature;
    }

    public String getPart2temperature() {
        return part2temperature;
    }

    public void setPart2temperature(String part2temperature) {
        this.part2temperature = part2temperature;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPart1signed() {
        return part1signed;
    }

    public void setPart1signed(String part1signed) {
        this.part1signed = part1signed;
    }

    public String getPart2signed() {
        return part2signed;
    }

    public void setPart2signed(String part2signed) {
        this.part2signed = part2signed;
    }

    public String getPartener1ID() {
        return partener1ID;
    }

    public void setPartener1ID(String partener1ID) {
        this.partener1ID = partener1ID;
    }

    public String getPartener2ID() {
        return partener2ID;
    }

    public void setPartener2ID(String partener2ID) {
        this.partener2ID = partener2ID;
    }

}
