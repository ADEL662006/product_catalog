# 🛍️ Mini Product Catalog

A responsive product catalog application built with Flutter and Dart, featuring product browsing, favorites, product details, and navigation using GoRouter.

## ✨ Features

* **Responsive Layout** — Automatically switches between ListView and GridView based on screen width
* **Product Catalog** — Displays a collection of products with their names and prices
* **Product Details** — Opens a dedicated screen to view product information
* **Favorites Counter** — Tracks the number of times the favorite button is pressed
* **Personalized Welcome** — Displays the username on the products screen
* **Navigation with GoRouter** — Handles navigation between Login, Products, and Details screens
* **Return Results** — Returns an Add to Cart message from the Details screen to the Products screen
* **Widget Lifecycle** — Demonstrates StatefulWidget lifecycle methods and logs them using debugPrint
* **Responsive Screen Width** — Uses MediaQuery to detect screen width and adjust the layout

## 🛠️ Built With

* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)
* [GoRouter](https://pub.dev/packages/go_router)
* [Material Design 3](https://m3.material.io/)

## 📂 Project Structure

```text
mini_catalog/
├── lib/
│   ├── main.dart
│   ├── login_page.dart
│   ├── products_page.dart
│   ├── details_page.dart
│   └── product_widgets.dart
├── pubspec.yaml
└── README.md
```

## 🚀 Getting Started

### Prerequisites

Before running the application, make sure you have installed:

* Flutter SDK
* Dart SDK
* Google Chrome, if you want to run the web version

Verify your Flutter installation:

```bash
flutter doctor
```

### Installation

**1. Create a new Flutter project**

```bash
flutter create mini_catalog
```

**2. Navigate to the project directory**

```bash
cd mini_catalog
```

**3. Install GoRouter**

```bash
flutter pub add go_router
```

**4. Add the project files**

Copy the provided Dart files into the `lib/` directory.

Replace the default `main.dart` with the project version and add the remaining Dart files.

**5. Run the application in Chrome**

```bash
flutter run -d chrome
```

## 📱 Responsive Layout

The application automatically changes its product layout based on the available screen width.

| Screen Width     | Layout   |
| ---------------- | -------- |
| Less than 600 px | ListView |
| 600 px or more   | GridView |

## 🧭 Navigation Flow

```text
Login Screen
     │
     ▼
Products Screen
     │
     ▼
Product Details Screen
     │
     ▼
Return to Products Screen
```

The application uses GoRouter to navigate between screens and pass data between them.

* **Login → Products:** Navigates to the product catalog and passes the username through a query parameter.
* **Products → Details:** Opens the selected product and passes its name and price.
* **Details → Products:** Returns to the previous screen and can display the Add to Cart result.

## 📚 Learning Objectives

This project demonstrates the following Flutter and Dart concepts:

* StatefulWidget and State
* StatefulWidget lifecycle methods
* State updates using setState()
* Responsive layouts using MediaQuery
* ListView and GridView
* Reusable widgets and callbacks
* Named routes and navigation with GoRouter
* Path parameters and query parameters
* Passing data between screens using extra
* Returning results from a screen
* Debugging lifecycle events using debugPrint

## 📖 Flutter Resources

If you are new to Flutter or want to explore more features, check out these official learning resources:

* [Learn Flutter](https://flutter.dev/learn)
* [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* [Flutter learning resources](https://docs.flutter.dev/get-started/learn-flutter)
* [Flutter documentation](https://docs.flutter.dev/)
* [Flutter API reference](https://api.flutter.dev/)
* [Dart documentation](https://dart.dev/guides)
* [Dart API reference](https://api.dart.dev/)

For more guidance, visit the official Flutter documentation for tutorials, examples, mobile development, and the complete API reference.

## 👨‍💻 Author

**Adel Abdelkrim**

Artificial Intelligence Student
Faculty of Artificial Intelligence
Kafr El-Sheikh University
