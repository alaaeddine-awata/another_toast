import 'package:flutter/material.dart';
import 'package:another_toast/another_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Toast Plugin Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AnotherToast.showToast(
                    message: "Success ✅",
                    backgroundColor: "#4CAF50",
                    textColor: "#FFFFFF",
                    fontSize: 18,
                    radius: 20,
                    length: ToastLength.long,
                    gravity: ToastGravity.center,
                  );
                },
                child: const Text("Show Center Toast"),
              ),
              ElevatedButton(
                onPressed: () {
                  AnotherToast.showToast(
                    message: "Error ❌",
                    backgroundColor: "#E53935",
                    gravity: ToastGravity.top,
                  );
                },
                child: const Text("Show Top Toast"),
              ),
              ElevatedButton(
                onPressed: () {
                  AnotherToast.showToast(
                    message: "Normal Toast",
                    gravity: ToastGravity.bottom,
                  );
                },
                child: const Text("Show Bottom Toast"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}