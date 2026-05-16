import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMP Medical System',
      home: Scaffold(
        appBar: AppBar(title: Text('النظام الطبي المتكامل')),
        body: Center(child: Text('تم النشر بنجاح!')),
      ),
    );
  }
}
