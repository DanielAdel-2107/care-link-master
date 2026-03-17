import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:care_link/app/my_app.dart';
import 'package:care_link/core/di/dependancy_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://gptbjanuoyoqoqdcizoc.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwdGJqYW51b3lvcW9xZGNpem9jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM1NTk2MjksImV4cCI6MjA3OTEzNTYyOX0.NDNbgcEpT_3Cowx_aoPG1pkShkLahMlwzs6YzvuxAK0",
  );
  await setupDI();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
  CustomQuickAlert.initialize(navigatorKey);
}
