package weath.socket;

/**
 * Created by lenovo on 2015/7/29.
 */

//This interface is used to replace the commands
public interface Command {
    String timeFormat = "yyyy-mm-dd HH:mm:ss";
    String REQUEST_COMMAND = "command";
    String REQUEST_UNSIGNCONTRACT = "UnsignContact";
    String REQUEST_SALECONTRACT = "SaleContact";
    String REQUEST_BUYDERIVATIVE = "BuyDerivative";
    String REQUEST_GETCLIENTDERIVATIVELIST = "GetClientDerivativeList";
    String REQUEST_GETPLATFORMDERIVATIVELIST = "GetPlatformDerivativedList";
    String REQUEST_GETCLIENTDERIVATIVEINFO = "GetClientDerivative";
    String REQUEST_GETPLATFORMDERIVATIVEINFO = "GetPlatformDerivative";
    String REQUEST_SALEDERIVATIVE = "SaleDerivative";
    String REQUEST_GETMONTHPROFIT = "GetMonthProfit";

    String KEY_USER = "user";
    String KEY_USERID = "userID";
    String KEY_CONTRACTID = "contactID";
    String KEY_PLATFORMDERIVATIVEID = "platformderivativeID";
    String KEY_ClientDerivativeID = "clientderivativeID";
    String KEY_SALEAMOUNT = "saleamount";
    String KEY_AMOUNT = "amount";
    String KEY_DERIVATIVEID = "derivativeID";
    String KEY_HOLDERID = "holderID";
    String KEY_YEAR = "year";
    String KEY_MONTH = "month";
    String KEY_SINGLEPRICE = "singleprice";
    String KEY_TEMPERATURE = "temperature";
    String KEY_LOSSRATIO = "lossratio";
    String KEY_PROTOCOLTEMPERATURE = "protocoltemperature";
    String KEY_REMAIN = "remain";
    String KEY_CLIENTDERIVATIVEINFOLIST = "clientDerivativeInfoList";
    String KEY_PLATFORMDERIVATIVEINFOLIST = "platformDerivativeInfoList";
    String KEY_PROFIT = "profit";
    String KEY_MONTHPROFITLIST = "monthProfitList";

    String RESULT_FAIL = "Fail";
    String RESULT_SUCCESS = "Success";
    String RESULT_RESULT = "Result";

}
