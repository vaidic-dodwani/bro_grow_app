import 'dart:io';

class AppNetworkConstants {
  static const baseURL =
      "https://328e-2405-201-601b-70c3-f945-893b-fa95-5dbe.ngrok-free.app/";
  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };
}
