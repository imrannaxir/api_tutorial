import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'users_api.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALHAMDULILLAH',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoginScreen(),
    );
  }
}

/*



WHEN YOU ADD OR UPDATE IN YOUR CODE AND PUSH IT 
INTO GITHUB THEN THE COMMANDS ARE GIVEN BELLOW :
1) git add .   => TRACK ALL CHANGES
2) git commit -m "your message"   => TO GIVE IDENTITY TOU HAVE CHANGED
3) git push -u origin master => PUSH THE CODE ON MASTER BRANCH


WHEN YOU ADD YOUR PROJECT FIRST TIME IN GITHUB
THEN THE COMMANDS ARE GIVEN BELOW :

git init
git add .
git commit -m "Your message"
git remote add origin https://github.com/mjagu/simple_hero_animations.git
git push -u origin master










 */
