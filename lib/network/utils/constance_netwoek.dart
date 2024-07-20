// ignore_for_file: constant_identifier_names

abstract class ConstanceNetwork {
  ///todo here insert base_url
  static var baseUrl = "https://gnews.io/api/v4/";
  static var apikey = "d0147239c7faa119e55098329a4a4de6";

//todo this for query Parameters
  static String qKey = "q";
  static String langKey = "lang";
  static String countryKey = "country";
  static String maxKey = "max";
  static String apikeyKey = "apikey";

  ///todo here insert endPoints
  static String getNewsEndPoint = 'search';


  static Map<String, String> header(TypeToken tokenType, {String? customHeader}) {
    String token = "";
    Map<String, String> headers = {};
    if (tokenType == TypeToken.Content_Type) {
      headers = {
        'Content-Type': 'application/json',
      };
    } else if (tokenType == TypeToken.Authorization) {
      headers = {
        'Authorization': 'Bearer $token',
      };
    } else if (tokenType == TypeToken.Authorization_Content) {
      headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
    } else if (tokenType == TypeToken.Authorization_Content_urlencoded) {
      headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
    } else if (tokenType == TypeToken.Authorization_Custom_header) {
      headers = {
        'Authorization': 'Bearer $customHeader',
        'Content-Type': 'application/json',
      };
    }
    return headers;
  }
}

enum TypeToken {
  //todo this for application/json
  Content_Type,
  //todo this for Authorization Bearer
  Authorization,
  //todo this for Authorization Bearer &&  Content_Type
  Authorization_Content,
//todo this for Authorization Bearer &&  Content_Type application/x-www-form-urlencode
  Authorization_Content_urlencoded,
  //todo this for Custom Authorization Bearer &&  Content_Type application/x-www-form-urlencode
  Authorization_Custom_header
}
