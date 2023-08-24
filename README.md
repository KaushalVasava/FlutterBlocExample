# Flutter Blor app
It is a basic app where we can check internet connectivity using connectivity package and app designed using Bloc pattern.

# Technologies used:
- Dart
- Flutter
- Bloc pattern
- connectivity package
- bloc package
- Snackbar

# What is Bloc Pattern? (Branch- main)
- How to manange states and events using bloc pattern using bloc provider, bloc state, bloc event, bloc consumer, bloc builder, bloc listener.
- Bloc event for UI events. For example click to input, press button.
- Bloc state for Different state of that events. For example connectivity event have two state Connected and Disconnected.
- Bloc is manager for state and event where we can connect states and events and do operations.
- Bloc provider is used for providing block to UI or screen.
- Bloc builder is used for Updating UI based on state and event.
- Bloc listner is used for do background tasks based on state and events.
- Bloc consumer is used for Both. ie. Updating UI and background tasks.

# What is Cubit? (Branch- cubit)
- Cubit is a subset of the BLoC Pattern package that does not rely on events and instead uses methods to emit new states.
  So, we can use Cubit for simple states, and as needed we can use the Bloc.
- There are many advantages of choosing Cubit over Bloc. The two main benefits are:
  
  - Cubit is a subset of Bloc. so, it reduces complexity. Cubit eliminates the event classes.
  - Cubit uses emit rather than yield to emit state. Since emit works synchronously, you can ensure that the state is updated in the next line.

# API or Network data handling using Bloc (Branch- api-handling)
- Used repository structure for api and data handling
- Used dio library for API calls
- Used pretty_dio_logger library for logging response of api.
- Used cached_network_image library to caching network images for faster re-load and show image in UI.
- Bloc-Cubic pattern for App.
- Used ListView for show data in the scrollable list.

# Recording

https://github.com/KaushalVasava/FlutterBlocExample/assets/49050597/ade13ecc-2b8d-4e8b-9c78-9e40321c5427


  Author: Kaushal Vasava.


