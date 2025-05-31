# 🎮 Game Store App

Welcome to the **Game Store App**! This application allows you to browse, purchase, and manage your video game collection. With features like a shopping cart, user profile, and game library, you can easily discover and enjoy your favorite games.

---

## 🚀 Getting Started

### 📲 Installation

- **Download the APK** or install from the app store *(if available)*
- Open the application on your device
- Create an account or sign in if you already have one

### 🛠 First-Time Setup

1. Launch the app
2. Register with your email address or sign in
3. (Optional) Complete your profile information

---

## ✨ Features

### 🏠 Home Page
- Browse **featured games**
- View **top games**, **best sellers**, and **trending titles**
- **Search** for specific games

### 📄 Game Details
- View **comprehensive information**, including screenshots and descriptions
- **Add games** to your cart or wishlist

### 🛒 Shopping Cart
- **Review** items before purchase
- **Remove** unwanted items
- **Proceed** to secure checkout

### 🎮 Library
- Access all your **purchased games**
- View **playtime** and **achievements**
- **Organize** your game collection

### 👤 Profile
- Manage **account information**
- View **gaming statistics**
- See **friend activity**

---

## 🧭 Navigation Guide

### 🔑 Main Sections

- **Home**: Tap the home icon to return to the main page  
- **News**: Stay updated with the latest gaming news  
- **Cart**: View and manage items in your shopping cart  
- **Library**: Access your purchased games  
- **Profile**: Manage your account settings  

### ⚙️ Common Actions

#### ➕ Adding to Cart
1. Navigate to a game's details page  
2. Tap **"Add to Cart"**

#### 💳 Making a Purchase
1. Go to your Cart  
2. Tap **"BUY IT NOW"**  
3. Enter payment details  
4. Confirm purchase

#### 📚 Viewing Purchased Games
1. Go to the **Library** section  
2. Browse your game collection

---

## 🧰 Troubleshooting

### 🔐 Login Problems
- Ensure your email and password are correct  
- Try **resetting your password** if needed  

### 💵 Payment Issues
- Verify your **payment details**  
- Check your **internet connection**  
- Ensure **sufficient funds** are available  

### ⚠️ App Crashes
- Close and reopen the app  
- Restart your device  
- Check for **app updates**

### 🎮 Games Not Appearing in Library
- Wait a few minutes and refresh  
- Contact support if the issue persists  

---

## 📞 Contact Support

For additional assistance, please contact our support team:

- 📧 **Email**: [support@gamestoreapp.com](mailto:support@gamestoreapp.com)  
- 📞 **Phone**: +1 (555) 123-4567  
- 📱 **In-App**: Go to **Profile → Help & Support**

🕘 *Support available Monday–Friday, 9AM–5PM EST*

---
# Flutter Firebase Setup Guide

## Installation
Run this command to install dependencies:
flutter pub get


## Firebase Configuration
1. Create a new project in the [Firebase Console](https://console.firebase.google.com/)
2. Enable Email/Password authentication:
   - Go to Authentication → Sign-in method
   - Enable Email/Password provider
3. Register your apps:
   - Android: Add your package name
   - iOS: Add your bundle ID
4. Download config files:
   - Android: Place `google-services.json` in `android/app/`
   - iOS: Place `GoogleService-Info.plist` in `ios/Runner/`

## Running the App
### Android
flutter run -d android

### iOS
flutter run -d ios


### Web
flutter run -d chrome

## Development Notes
### Hot Reload
flutter run --hot-reload


## Building for Release
### Android
flutter build apk --release


### iOS
flutter build ios --release


## Testing
Run all tests:
flutter test


## Troubleshooting
### Firebase Initialization
- Verify config files are in correct locations
- Ensure package names match exactly
- Run `flutter clean` and rebuild

### Authentication Issues
- Confirm Email/Password auth is enabled
- Check internet connection

### Platform-Specific Errors
- Android: Run `flutter clean`
- iOS: Run `pod install` in `ios` directory

### Dependency Conflicts
flutter pub upgrade


## Support
Contact our team for assistance:
- Email: support@gamestoreapp.com
- Phone: +1 (555) 123-4567
- Hours: Monday-Friday, 9AM-5PM EST

Thank you for using **Game Store App**!  
Happy Gaming! 🎉
