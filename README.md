# Another Toast (Flutter Plugin)

A simple Flutter plugin to show native Android Toast messages with customizable text, color, and position (top, center, bottom).

---

## 🧩 Supported Platform
- ✅ Android  
- ❌ iOS (coming soon)

---

## 🚀 Installation

Add this to your pubspec.yaml:

```yaml
dependencies:
  another_toast:
    git:
      url: https://github.com/alaaeddine-awata/another_toast.git
```

Then run:
```
flutter pub get
```
---

💬 Usage

```dart
import 'package:another_toast/another_toast.dart';

AnotherToast.showToast(
  message: "Hello from Another Toast 👋🏻",
  backgroundColor: "#000000",
  textColor: "#FFFFFF",
  fontSize: 18,
  radius: 20,
  length: ToastLength.long,
  gravity: ToastGravity.center,
);
```


---

Made with ❤️ using Flutter + Kotlin
