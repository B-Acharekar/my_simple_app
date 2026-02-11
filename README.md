# 🎓 Student Firebase App  
## 🚀 Futuristic Minimal Flutter + Firestore CRUD

A modern, Apple-inspired Flutter Web application demonstrating Firebase Firestore CRUD operations with real-time updates.

Designed for workshops, demos, and learning Firebase integration with Flutter.

---

## ✨ Features

- ➕ Add Students (modern signup-style form)  
- 📖 Real-time Student List (StreamBuilder)  
- ✏️ Edit Student Data (inline update mode)  
- 🗑️ Delete Students (with confirmation)  
- 🔄 Live Firestore Sync  
- 🎨 Minimal, futuristic UI  
- 🌐 Web-ready (Chrome / Edge)  
- 🧱 Clean Architecture  
- 🔒 Firestore Security Rules Support  

---

## 🖼 UI Philosophy

This app follows a minimal futuristic design system:

- Soft neutral backgrounds  
- Rounded glass-style cards  
- Clean typography  
- Generous spacing  
- Smooth animations  
- Apple × Notion × SaaS aesthetic  

---

## 📦 Tech Stack

- Flutter 3.x  
- Firebase Core  
- Cloud Firestore  
- FlutterFire CLI  
- Material 3 (Custom Styled)  

---

## 🏗 Project Structure

```
lib/
├── main.dart
├── firebase_options.dart
├── models/
│   └── student.dart
├── services/
│   └── firebase_service.dart
└── screens/
    ├── home_screen.dart
    └── student_form_screen.dart
```

### 📄 File Overview

| File | Purpose |
|------|----------|
| main.dart | Initializes Firebase & theme |
| student.dart | Student model (toJson/fromJson) |
| firebase_service.dart | All Firestore CRUD logic |
| home_screen.dart | Main screen (form + list) |
| student_form_screen.dart | Reusable student form |

---

# 🔥 Firebase Setup (Workshop Guide)

## ✅ Prerequisites

- Flutter SDK 3.0+  
- Node.js  
- Google Account  
- VS Code / Android Studio  

Verify Flutter:

```bash
flutter doctor
```

---

## 🔥 1️⃣ Create Firebase Project

1. Go to https://console.firebase.google.com  
2. Click **Add Project**  
3. Name it `student-firebase-app`  
4. Disable Google Analytics (optional)  
5. Click **Create Project**

---

## 🔥 2️⃣ Enable Firestore

1. Go to **Build → Firestore Database**  
2. Click **Create Database**  
3. Select **Start in Test Mode**  
4. Choose a region  
5. Click **Enable**

> ⚠ Test mode is only for development.

---

## ⚙ 3️⃣ FlutterFire Configuration

### Install Firebase CLI

```bash
npm install -g firebase-tools
firebase login
```

### Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

### Configure Firebase

Inside your Flutter project:

```bash
flutterfire configure
```

This generates:

```
lib/firebase_options.dart
```

---

## 📥 Install Dependencies

```bash
flutter pub get
```

---

# 🚀 Running the App

## 🌐 Web (Recommended)

```bash
flutter run -d edge
```

or

```bash
flutter run -d chrome
```

## 🤖 Android

```bash
flutter run
```

---

# 📊 Firestore Data Structure

```
students (collection)
│
├── auto-id
│   ├── name: "John Doe"
│   ├── age: 20
│   ├── grade: "A"
│   ├── createdAt: Timestamp
│
└── auto-id
    ├── name: "Jane Smith"
    ├── age: 21
    ├── grade: "B"
    ├── createdAt: Timestamp
```

---

# 🔐 Firestore Security Rules

## 🧪 Development (Test Mode)

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

> ⚠ Never use in production.

---

## 🔒 Production Example (With Auth)

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /students/{studentId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

---

# 🧠 Architecture Notes

- Service layer handles Firestore  
- UI separated from database logic  
- StreamBuilder for real-time sync  
- Null safety enabled  
- Async/await best practices  
- Clean separation of concerns  

---

# 🐛 Troubleshooting

### ❌ firebase_options.dart not found

Run:

```bash
flutterfire configure
```

---

### ❌ No Firebase App '[DEFAULT]' Error

Ensure Firebase is initialized:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

---

### ❌ Permission Denied

Check Firestore Rules → Ensure Test Mode enabled.

---

### ❌ Chrome Debug Connection Failed

Try:

```bash
flutter run -d edge
```

---

# 🎯 Workshop Extensions

Ideas to extend the project:

- 🔍 Add search functionality  
- 📊 Add sorting options  
- 📁 Export data to CSV  
- 🔐 Add Firebase Authentication  
- 🌙 Add Dark Mode  
- 📈 Add Dashboard analytics  
- 🧾 Add pagination  

---

# 📚 Resources

- Flutter Docs → https://flutter.dev  
- Firebase Docs → https://firebase.google.com/docs  
- FlutterFire Docs → https://firebase.flutter.dev  

---

# 📄 License

This project is built for educational & workshop purposes.  
Free to use and modify.

---

# 💡 Author
**Shubham Gupta** —  
GitHub: https://github.com/ShubhZ06 
Built with Flutter + Firebase  
Designed with a futuristic minimal approach.
