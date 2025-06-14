import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailJSService {
  static const String _serviceId = 'service_f7t42vg';
  static const String _templateId = 'template_c8zfvol';
  static const String _publicKey = '0shJBOSgvFc3vHjje';
  static const String _url = 'https://api.emailjs.com/api/v1.0/email/send';

  static Future<bool> sendEmail({
    required String fromName,
    required String fromEmail,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _publicKey,
          'template_params': {
            'from_name': fromName,
            'from_email': fromEmail,
            'user_email': fromEmail, // Add this line
            'reply_to': fromEmail, // Add this line
            'to_email': 'm.muneeburremann@gmail.com', // Add this line
            'message': message,
          },
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }
}

class AppConstants {
  // Personal Information
  static const String name = "Muhammad Muneeb Ur Rehman";
  static const String title = "Software Engineer";
  static const String tagline = "Building Innovative Applications with Flutter";
  static const String email = "m.muneeburrehmann@gmail.com";
  static const String phone = "+92 315 6899401";
  static const String location = "Islamabad, Pakistan";
  static const String linkedIn = "https://linkedin.com/in/mun33b-exe";
  static const String github = "https://github.com/mun33b-exe";
  static const String website = "https://github.com/mun33b-exe";
  static const String cvUrl =
      "https://drive.google.com/file/d/1hR1Xw66etLEUC07XmpYFP-mHYFUR-PrV/view?usp=drive_link"; // Replace with your actual CV URL

  // EmailJS Configuration
  static const String emailJSServiceId = "service_f7t42vg";
  static const String emailJSTemplateId = "template_c8zfvol";
  static const String emailJSPublicKey = "0shJBOSgvFc3vHjje";

  // About
  static const String aboutText =
      "I'm a passionate software developer with expertise in mobile and web development. "
      "I enjoy solving complex problems and creating user-friendly applications that make a difference. "
      "With a strong background in Flutter and backend technologies, I'm always eager to learn "
      "new technologies and take on challenging projects.";

  // Skills
  static const List<String> skills = [
    "Flutter",
    "Dart",
    "Bloc",
    "Firebase",
    "Java",
    "Git",
    "SQL",
    "Laravel",
    "Figma",
    "Prototyping",
    "UI/UX Design",
    "REST APIs",
  ];

  // Experience
  static const List<Map<String, String>> experience = [
    {
      "title": "Flutter Developer Intern",
      "company": "DevelopersHub Corporation",
      "duration": "June 2025 - Present",
      "description":
          "Led the development of cross-platform mobile applications using Flutter.",
    },
  ];

  // Education
  static const List<Map<String, String>> education = [
    {
      "degree": "Bachelor of Science in Software Engineering",
      "institution": "COMSATS University Islamabad",
      "duration": "2022 - Current",
      "description":
          "Currently pursuing a Bachelor's degree in Software Engineering, focusing on mobile and web application development.",
    },
  ];
  // Projects
  static const List<Map<String, dynamic>> projects = [
    {
      "title": "ChatZilla",
      "description":
          "A real-time chat application built with Flutter and Firebase. Features include group chats, file sharing, and user authentication.",
      "image": "assets/images/chatzilla.png",
      "technologies": ["Flutter", "Dart", "Bloc", "Firebase"],
      "github": "https://github.com/mun33b-exe/chatzilla",
      "demo": "https://chatzilla-demo.web.app",
    },
    {
      "title": "Imei Tracker",
      "description":
          "IMEI Manager is an application designed to manage, track, and validate IMEI numbers for mobile devices. Also have role based access control for admin and user.",
      "technologies": ["Flutter", "Dart", "Firebase"],
      "github": "https://github.com/mun33b-exe/imei-manager",
      "demo": "https://github.com/mun33b-exe/imei-manager",
      "image": "assets/images/imei.png",
    },
    {
      "title": "HistoMeet - UI/UX Design Prototype",
      "description":
          "Histomeet is a UI/UX design prototype created as part of my Human-Computer Interaction (HCI) semester project at COMSATS University. ",
      "technologies": ["Figma"],
      "github": "https://github.com/mun33b-exe/histomeet-ui-ux",
      "demo":
          "https://www.figma.com/design/87zDGjMBjTJzTdQpZbrDdl/HCI-Project?node-id=0-1&t=nkVRYEPqDdEztgER-1",
      "image": "assets/images/histomeet.png",
    },
  ];

  // Certifications
  static const List<Map<String, String>> certifications = [
    {
      "title": "Google UX Design",
      "issuer": "Google",
      "date": "2025",
      "credential":
          "https://drive.google.com/file/d/1KNDJU3cTnlP9xWxaYLzhNgtCl1UxHxB_/view",
    },
    {
      "title": "Databases for Developers: Foundations",
      "issuer": "Oracle",
      "date": "2025",
      "credential":
          "https://drive.google.com/file/d/1sRN36O6CIPqvr67eVVQGZw9fPv3dGmvu/view",
    },
    {
      "title": "Databases for Developers: Next Level",
      "issuer": "Oracle",
      "date": "2025",
      "credential":
          "https://drive.google.com/file/d/1sRN36O6CIPqvr67eVVQGZw9fPv3dGmvu/view",
    },
  ];
}
