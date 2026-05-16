import os
import stat

# إنشاء الهيكل
os.makedirs("frontend_flutter/android/app/src/main", parents=True, exist_ok=True)
os.makedirs("frontend_flutter/lib", exist_ok=True)
os.makedirs("frontend_flutter/web", exist_ok=True)

# pubspec.yaml
pubspec = """name: medical_imp
description: Integrated Medical System
version: 1.0.0
environment:
  sdk: '>=3.0.0 <4.0.0'
dependencies:
  flutter:
    sdk: flutter
flutter:
  uses-material-design: true
"""
with open("frontend_flutter/pubspec.yaml", "w") as f:
    f.write(pubspec)

# main.dart
main_dart = """import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMP Medical System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('النظام الطبي المتكامل')),
        body: Center(child: Text('تم النشر بنجاح!')),
      ),
    );
  }
}
"""
with open("frontend_flutter/lib/main.dart", "w") as f:
    f.write(main_dart)

# index.html
index_html = """<!DOCTYPE html>
<html>
<head>
  <base href="$FLUTTER_BASE_HREF">
  <meta charset="UTF-8">
  <title>IMP Medical System</title>
</head>
<body>
  <script src="main.dart.js" type="application/javascript"></script>
</body>
</html>
"""
with open("frontend_flutter/web/index.html", "w") as f:
    f.write(index_html)

# Android ملفات أساسية
os.makedirs("frontend_flutter/android/app/src/main/kotlin/com/example/medical_imp", parents=True, exist_ok=True)
with open("frontend_flutter/android/settings.gradle", "w") as f:
    f.write("include ':app'")
with open("frontend_flutter/android/build.gradle", "w") as f:
    f.write("""buildscript {
    repositories { google() mavenCentral() }
    dependencies { classpath 'com.android.tools.build:gradle:7.3.0' }
}
allprojects { repositories { google() mavenCentral() } }
""")
with open("frontend_flutter/android/app/build.gradle", "w") as f:
    f.write("""apply plugin: 'com.android.application'
android {
    compileSdk 34
    defaultConfig {
        applicationId "com.example.medical_imp"
        minSdk 21
        targetSdk 34
        versionCode 1
        versionName "1.0"
    }
}
""")
with open("frontend_flutter/android/app/src/main/AndroidManifest.xml", "w") as f:
    f.write("""<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application android:label="IMP Medical"/>
</manifest>""")

print("✅ تم إنشاء مشروع Flutter كامل (Android + Web)")
