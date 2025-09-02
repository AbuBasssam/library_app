# 📚 Library App

> A comprehensive educational Flutter app for digital library management built with Clean Architecture(feature based)

## 📋 Overview

This educational project demonstrates how to build a complete digital library application using Flutter with Clean Architecture principles.  
The app allows users to **browse books, borrow, reserve them, and manage their personal library.

## ✨ Features

### 🏠 Home Page
- Header with app logo and notifications button
- Scrollable promotional banner
- Horizontal categories list with first category active by default
- Books by selected category
- Latest books section with "🆕 New" badge

## 🏗️ Project Structure (Clean Architecture)


lib/
├── assets/                  
│   ├── images/              # App images
│   ├── svgs/                # App svg images
│   ├── translations/        # Internationalization
├── core/                    
│   ├── constants/           # Global constants
│   ├── error/               # Error handling
│   ├── network/             # Network configurations
│   ├── usecases/            # Base use cases
│   ├── utils/               # Utility functions
│   ├── theme/               # Global app themes
│   ├── di/                  # Dependency injection
│   └── api/                 # API helper functions
├── features/                
│   ├── book/                
│   │   ├── data/
│   │   │   ├── datasources/ # Data sources
│   │   │   ├── models/      # Data models
│   │   │   └── repositories/# Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/    # Business entities
│   │   │   ├── repositories/# Repository interfaces
│   │   │   └── usecases/    # Use cases
│   │   └── presentation/
│   │       ├── bloc/        # State management
│   │       ├── builders/    # Builder DP
│   │       ├── strategies/  # strategy DP
│   │       ├── pages/       # UI pages
│   │       └── widgets/     # Custom widgets
└── main.dart                # App entry point

## 🛠️ Technology Stack

### Framework & Language
- **Flutter** 
- **Dart** 

### State Management
- **Flutter Bloc** 
- **Value Notifier**

### Network & Data
- **Dio** - 
- **Retrofit**
- **Hive**
- **hive_flutter**
- **flutter_secure_storage**
- **pretty_dio_logger**

### Routing
- **go_router**

### Code Generation
- **freezed**
- **freezed_annotation**
- **json_annotation**

### Dependency Injection
- **Get It** - 

### User Interface
- **Flutter SVG** 
- **Cached Network Image** 
- **Shimmer 3.0+** 
- **Flutter Rating Bar**

### Utiltities
- **Internet Connection Checker**
- **EasyLocalization** 

## 📱 Requirements

- Flutter SDK >=3.0.0
- Dart SDK >=3.0.0
- Android Studio / VS Code with Flutter extension
- Xcode (for iOS development)

## 📸 Screenshots
![Home Page](<LMS Home.png>)