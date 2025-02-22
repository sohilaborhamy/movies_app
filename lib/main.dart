import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/services/local_storage_service.dart';
import 'firebase_options.dart';
import 'core/routes/app_routes.dart';
import 'core/services/loading_services.dart';
import 'core/theme/theme_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await LocalStorageService.init();
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      theme: AppTheme.theme,
      builder: EasyLoading.init(
        builder:  BotToastInit(),
      ),
    );
  }
}
