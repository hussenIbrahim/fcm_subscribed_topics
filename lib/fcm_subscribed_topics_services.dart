import 'dart:convert';

import 'package:fcm_subscribed_topics/topics_model.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

class FcmSubscribedTopcisServices {
  Map<String, String> jsonFile;
  FcmSubscribedTopcisServices({
    required this.jsonFile,
  });

  Future<String> _getOAuthToken() async {
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    final httpClient = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(jsonFile), scopes);
    final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(jsonFile), scopes, httpClient);
    httpClient.close();

    return credentials.accessToken.data;
  }

  Future<SubscribedTopcis?> getSubscribeTopcis(String fcmToken) async {
    final token = await _getOAuthToken();
    final http.Response response = await http.get(
      Uri.parse("https://iid.googleapis.com/iid/info/$fcmToken?details=true"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "access_token_auth": "true"
      },
    );
    return SubscribedTopcis.fromJson(jsonDecode(response.body));
  }
}
