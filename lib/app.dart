import 'package:flutter/material.dart';

// Example placeholder for your LoginScreen
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Login Screen")),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _combinedFuture;

  @override
  void initState() {
    super.initState();
    // Simulate initialization (like loading configs, etc.)
    _combinedFuture = _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate some startup process (e.g., loading settings)
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _combinedFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: Text("Error: ${snapshot.error}")),
            ),
          );
        }

        // Once loading is done, go straight to LoginScreen
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      },
    );
  }
}
