import 'dart:io';

class AppNetworkConstants {
  static const baseURL = "https://02c4-117-55-241-39.ngrok-free.app/";
  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };
}
