import 'package:flutter/material.dart';
import 'package:scorer_uchenna/pages/soccer_home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:scorer_uchenna/view_model/auth_display_view_model.dart';


void main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthDisplayViewModel(),
      child: MaterialApp(
        home: SoccerHome(),
      ),
    );
  }
}
