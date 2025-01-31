import 'package:cash_storing_with_service_layer/model/handle_model.dart';
import 'package:cash_storing_with_service_layer/model/user_model.dart';
import 'package:cash_storing_with_service_layer/provider/user_provider.dart';
import 'package:cash_storing_with_service_layer/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(HandleModelAdapter());
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MaterialApp(
        home: TempPage(),
      ),
    );
  }
}

class TempPage extends StatelessWidget {
  const TempPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserPage(),
            ),
          );
        },
      ),
    );
  }
}
