A Flutter app that fetches quotes from multiple APIs, handles offline scenarios, allows quote rating, social media sharing, and displays a slideshow. Supports Web, iOS and Android platforms.

## Features

* **Concurrent Quote Fetching:** Races against multiple APIs (e.g., [https://api.quotable.io/random](https://api.quotable.io/random), [https://pprathameshmore.github.io/QuoteGarden/](https://pprathameshmore.github.io/QuoteGarden/)) to display the fastest response.
* **Offline Graceful Handling:** Falls back on a set of local (cached) quotes when offline.
* **Interactive Rating:** Users can rate quotes.
* **Social Sharing:** Native share functionality to share quotes on platforms.
* **Quote Slideshow:** Displays a dynamic slideshow of random quotes.
* **Multi-platform Support:** Runs on Web, iOS and Android environments.

## Getting Started

### Prerequisites

* Flutter development environment set up (follow instructions at [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)): [https://flutter.dev/get-started](https://flutter.dev/get-started)
* Basic understanding of Flutter widgets, state management, and asynchronous programming.

## Local Quotes

The app supports storing a set of quotes locally for offline scenarios by using shared_preferences.

## Sharing Functionality

For native social media sharing, we used share package.

# Architecture

This project utilizes Clean Architecture to achieve separation of concerns, testability, and maintainability. The application is divided into three core layers:

### Presentation Layer: 
Contains UI widgets responsible for displaying data and handling user interactions.
### Domain Layer: 
Encapsulates core business logic and data models (entities) independent of external frameworks or databases.
### Data Layer: 
Handles data persistence and retrieval through repositories and abstract interfaces. This layer interacts with concrete data sources like APIs or local storage.
### Dependency Injection:
The project employs dependency injection to manage dependencies between layers. This allows for easier testing, mocking, and decoupling of components.

## Benefits of Clean Architecture

### Improved Testability: 
Each layer can be tested independently, leading to robust and maintainable code.
### Separation of Concerns:
Clear division of responsibilities ensures well-structured and focused code.
### Platform Independence:
The domain layer remains agnostic to UI frameworks or data storage mechanisms, facilitating easier porting to other platforms.

# Dependencies

The project utilizes the following dependencies:

### Static Code Analysis: 
  flutter_lints: ^3.0.0
### JSON Serialization: 
  json_serializable: ^6.7.1
### Build Runner: 
  build_runner: ^2.4.9 (likely for code generation)
### API Calls (Retrofit):
  retrofit_generator: ^8.1.0 (for code generation)
  retrofit: ^4.1.0 (for making API requests)
### Dependency Injection: 
  get_it: ^7.7.0
### State Management (Bloc): 
  flutter_bloc: ^8.1.5 (likely for managing application state)
### Data Model Equality: 
  equatable: ^2.0.5 (for simplifying data model comparison)
### Social Media Sharing: 
  share: ^2.0.4
### Quote Rating: 
  flutter_rating_bar: ^4.0.1
### Connectivity Check: 
  connectivity: ^3.0.6 (for checking internet connectivity)
### Mocking (Tests): 
  mockito: ^5.4.4 (for creating test doubles in unit tests)
### JSON Annotations: 
  json_annotation: ^4.9.0 (likely for generating JSON serialization/deserialization code)
### Local Storage:
  shared_preferences: ^2.2.3 (for storing data locally)
### Alternative Networking (Dio): 
  dio: ^5.4.3+1 (potential alternative for making API requests)


### How to Run a Flutter App on Different Platforms

## Android
1. Make sure you have Android Studio installed on your machine.
2. Connect your Android device to your computer via USB.
3. Open your Flutter project in Android Studio.
4. Select your Android device from the device dropdown menu in Android Studio.
5. Or from the Device Manager, open the emulator
6. Click on the green play button to build and run your app on the selected device.
7. Or run the command flutter run.

## iOS
1. Make sure you have Xcode installed on your machine.
2. Open your Flutter project in Visual Studio Code or Terminal.
3. Run `flutter build ios` to build the iOS version of your app.
4. Open the generated iOS project in Xcode by running `open ios/Runner.xcworkspace`.
5. Select your iOS device or simulator from the device dropdown menu in Xcode.
6. Click on the play button to build and run your app on the selected device.

## Web
1. Make sure you have the latest version of Flutter installed on your machine.
2. Open your Flutter project in Visual Studio Code or Terminal.
3. Run `flutter run -d chrome` to build and run your app in a web browser.

## Automated Tests
1. Open your Flutter project in Visual Studio Code or Terminal.
2. Run `flutter test test/services/service_test.dart` to run service related the tests in the project.



Implemented the Quotes with Carousal

## Scrolling:

https://github.com/rahulguptaiOS/signify_assignment/assets/21958208/314d6011-ff49-4d31-b012-78e59bc37238

# Sharing:
<img width="345" alt="Screenshot 2024-04-25 at 5 43 49 PM" src="https://github.com/rahulguptaiOS/signify_assignment/assets/21958208/1c1c4909-d7d6-4235-a3e5-e0df65c603d5">

# Rating:
<img width="350" alt="Screenshot 2024-04-25 at 5 44 11 PM" src="https://github.com/rahulguptaiOS/signify_assignment/assets/21958208/3127ea86-19fc-4011-8bb7-cf39312b36d3">
