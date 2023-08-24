import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/routes/routes.dart';
import 'package:notes/screens/matchList.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /// code for disable rotation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
      options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(const DraftNotes());
}

class DraftNotes extends StatelessWidget {
  const DraftNotes({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            brightness: Brightness.light
        ),
        onGenerateRoute: Routes.onGenerateRoute,
        home: const MatchListScreen(),
        // initialRoute: RouteNames.matchListScreen
    );
  }
}


