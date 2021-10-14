# Backstage App

Organize your event in a light and intuitive way, without unnecessary hindrances and worries.

## Overview
Organizing an event is always a challenge. Everything behind the scenes requires caution, a lot of planning and if there is a lack of commitment or negligence in any aspect, we can see everything going downhill and feel the consequence of things not going as we expected. To organize events of relevant size, such as large conferences, concerts and even religious ceremonies that involve many people, it is common to resort to some tool that helps in the management of everything that is of interest to us. That's why Backstage was created, a mobile application that helps organize your events, managing people, schedule and other aspects.

## Application

### Flutter configuration
To run the application, you need to have Flutter installed on your machine. Follow the Flutter installation guide [here](https://flutter.dev/docs/get-started/install). After that, let's configure some steps in Firebase.

### Firebase configuration
As the application runs on the Firebase side, create a Google account, log into the Firebase console and create a project to use Firebase functionality. You can find the entire configuration step-by-step here, in the [FlutterFire guide](https://firebase.flutter.dev/docs/overview/).

### Launch app
Since you already have Flutter on your machine and Firebase has already been configured in the project, let's start running the app. First, see if everything is right in your environment. Run the command below. It will list a diagnosis that tells you if something is missing in your environment configuration:
```sh
flutter doctor -v
```
If that's okay, let's go to the next step. You need to import the dependencies the project needs (they are listed in the pubspeck.yaml file). With that, execute:
```sh
flutter packages get
```
or
```sh
flutter pub get
```
Then run the command below. It makes Slidy run a script that makes the automatic code generation of the annotations that Flutter MobX provides us for easy use of MobX in the project:
```sh
slidy run mobx
```
Finally, set your phone to debug mode or start an emulator on your machine. Then run the app:
```sh
flutter run
```
For help getting started with Flutter, view the [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

##### _All honor and all glory, everything comes from him and everything is for him: JESUS!_
