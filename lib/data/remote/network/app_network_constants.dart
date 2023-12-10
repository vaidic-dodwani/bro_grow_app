import 'dart:io';

class AppNetworkConstants {
  static const baseURL = "https://0d4f-103-219-229-92.ngrok-free.app/";
  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };
}
