import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';

class EmailJSService {
  static Future<bool> sendEmail({
    required String fromName,
    required String fromEmail,
    required String message,
  }) async {
    try {
      final requestBody = {
        'service_id': AppConstants.emailJSServiceId,
        'template_id': AppConstants.emailJSTemplateId,
        'user_id': AppConstants.emailJSPublicKey,
        'template_params': {
          'from_name': fromName,
          'from_email': fromEmail,
          'user_email': fromEmail,
          'reply_to': fromEmail,
          'sender_email': fromEmail,
          'email': fromEmail,
          'message': message,
          'user_name': fromName,
          'name': fromName,
        },
      };

      print('Sending EmailJS request:');
      print('From Name: $fromName');
      print('From Email: $fromEmail');
      print('Message: $message');

      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      print('EmailJS Response Status: ${response.statusCode}');
      if (response.statusCode != 200) {
        print('EmailJS Response Body: ${response.body}');
      }

      return response.statusCode == 200;
    } catch (e) {
      print('EmailJS Error: $e');
      return false;
    }
  }
}
