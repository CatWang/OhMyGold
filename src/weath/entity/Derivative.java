package weath.entity;

/**
 * Created by lenovo on 2015/7/25.
 */
public class Derivative {
    private String derivativeID;
    private String holderID;
    private int year;
    private int month;
    private int amount;
    private double singleprice;
    private String temperature;
    private double lossratio;
    private double protocoltemperature;
    private String platformderivativeID;
    private int remain;

    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    public String getDerivativeID() {
        return derivativeID;
    }

    public void setDerivativeID(String derivativeID) {
        this.derivativeID = derivativeID;
    }

    public String getHolderID() {
        return holderID;
    }

    public void setHolderID(String holderID) {
        this.holderID = holderID;
    }

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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getSingleprice() {
        return singleprice;
    }

    public void setSingleprice(double singleprice) {
        this.singleprice = singleprice;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
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

    public String getPlatformderivativeID() {
        return platformderivativeID;
    }

    public void setPlatformderivativeID(String platformderivativeID) {
        this.platformderivativeID = platformderivativeID;
    }
}
