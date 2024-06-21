# pokedex

## Autor

    Realizado por Vladimir Moreno

## Versions that we use

    START: 17-06-2024
    Flutter version 3.19.5
    Dart version 3.3.3
    DevTools 2.31.1

## Tools that you need before to clone the repository

    1. You need to install dart -- https://dart.dev/get-dart or https://dart.dev/get-dart/archive to select the version
    2. After to install dart, you need to modify the PATH to add Dart. Read the guide -- https://dart.dev/get-dart
    3. Then you have to install flutter -- https://docs.flutter.dev/get-started/install/ or https://docs.flutter.dev/release/archive?tab=windows
    4. Also, you have to modify the PATH to add Flutter. Read the guide -- https://docs.flutter.dev/get-started/install/
    5. You have to install and configure android studio for testing the app in mobile or tablets devices (not optional)
    6. Install chrome
    7. Finally run this command in your console and verify that all it's ok
       command to run : flutter doctor -v

    **you can use visual studio code or android studio to work**

### Extensions for visual studio code that I recommend

    Dart
    Flutter
    Flutter widget snippets
    Prettier
    Error lens
    Sonarlint

## Run this commands after cloning this repository

    flutter pub get ---------------> to get all packages that this project need

    flutter doctor -v -------------> to review that all things are ok

## Running Locally

    flutter run -d "id_of_the_device"

    for example if you want to run this project in the web
    the command will be like this:

    flutter run -d chrome

    where chrome its the id of my device, to get the id please run flutter doctor -v

## Libraries used and why

    -dio -------------------> to make HTTP request, consume the API and configure the interceptors to validate the schema of the response
    -get -------------------> to managment the routes and controllers
    -get_storage -----------> to save information like localStorage
    -auto_size_text --------> to make easier the text responsive
    -quickalert ------------> to show notifications (success, warn, fail, error)
    -get_it ----------------> to use the states files and charge in all the project
    -logger ----------------> to show or print some message or params in the console
    -font_awesome_flutter --> to use free icons
    -cached_network_image --> to have in cache the images
    -flutter_launcher_icons-> to configure icons settings
    -url_strategy ----------> to remove the # on url (this for flutter web)

## How to get the apk

    If you want to build the apk from the project on your computer
    You have to run this command:

    flutter build apk --release

    the --release option its for generate the apk with performance 

    the process could be take a long time

    when the process have done, they show you where was the apk generated

    usually it is in :

    project_folder/build/app/outputs/flutter-apk/app-release.apk

