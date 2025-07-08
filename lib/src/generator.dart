import 'dart:io';

import 'package:path/path.dart';

import 'logger.dart';

/// A code generation utility for creating Clean Architecture structure.
class CleanGenToolPlus {
  /// Project version.
  static String projectVersion = '1.0.5';

  /// Generates the folder structure and files at the given [targetPath].
  static Future<void> generate() async {
    final projectDir = Directory.current;
    final projectName = basename(projectDir.path);
    final libDir = Directory(join(projectDir.path, 'lib'));
    if (!libDir.existsSync()) {
      systemLogInfo('Creating lib directory...');
      await libDir.create(recursive: true);
    }
    systemLogAction(
        'Clean Architecture structure for $projectName...', 'GENERATING');
    systemLogWarningCyan('Generating Readme');
    await _generateReadme(projectDir, projectName);

    systemLogWarningCyan('Generating .env file...');
    await _generateDotEnv(projectDir, projectName);

    systemLogWarningCyan('Generating assets folders...');
    await _generateAssetsFolders(projectDir);

    systemLogWarningCyan('Generating pubspec.yaml...');
    await _generatePubspecYaml(projectDir, projectName);

    systemLogWarning('Generating Localization files...');
    await _generateLocalizationFiles(projectDir);

    systemLogWarning('Generating Main files...');
    await _generateMainApp(libDir, projectName);

    systemLogWarning('Generating Features files...');
    await _generateFeatures(libDir, projectName);

    systemLogWarningCyan('Generating Assets files...');
    await _generateAssetsGn(libDir, projectName);

    systemLogWarning('Generating Core files...');
    await _generateCore(libDir, projectName);

    systemLogAction(
        'Flutter project is fully ready with Clean Architecture by Mohammad AD - GenTool',
        'FINISHED GENERATING');
    systemLogInfo(
        '📗─────────────────────────────────HAPPY CODING────────────────────────────────────📗');
    systemLogWarning('Thank you for using my package📙');
    systemLogWarning(
        'Check other packages at https://pub.dev/publishers/bummycakes.com/packages📙');
    systemLogWarningCyan('📔You can contact me at richardchalger@gmail.com📔');
  }
}

/// Logging utility warning functions
void systemLogWarning(String message) {
  Logger.yellow.log('📙 [CleanGENTOOLPlus] [Warning] $message');
}

/// Logging utility warning info functions
void systemLogWarningCyan(String message) {
  Logger.cyan.log('📙 [CleanGENTOOLPlus] [Warning] $message');
}

/// Logging utility info functions
void systemLogInfo(String message) {
  Logger.green.log('📗 [CleanGENTOOLPlus] [INFO] $message');
}

/// Logging utility Error functions
void systemLogError(String context, Object e) {
  Logger.red.log('📕 [CleanGENTOOLPlus] [ERROR] 📕$context📕: $e');
}

/// Logging utility action functions
void systemLogAction(String context, Object e) {
  Logger.blue.log('📘 [CleanGENTOOLPlus] [Action] 📘$context📘: $e');
}

Future<void> _generateDotEnv(Directory projectDir, String projectName) async {
  final readmeFile = File(join(projectDir.path, '.env'));
  await readmeFile.writeAsString('''
//Make sure to add your API keys and other environment variables here.
API_URL=https://url:port/api/
// add your keys/urls here
//Mohammad AD 
''');
}

Future<void> _generateAssetsFolders(Directory projectDir) async {
  final assetDirs = [
    'assets/images',
    'assets/icons',
    'assets/keystore',
    'assets/lang',
  ];
  for (final dir in assetDirs) {
    await Directory(join(projectDir.path, dir)).create(recursive: true);
  }
}

Future<void> _generateLocalizationFiles(Directory projectDir) async {
  final langDir = Directory(join(projectDir.path, 'assets/lang'));

  await File(join(langDir.path, 'en.json')).writeAsString('''{
 "app_name": "My App",
  "welcome": "Welcome",
  "login": "Login",
  "logout": "Logout",
  "signup": "Sign Up",
  "email": "Email",
  "password": "Password",
  "confirm_password": "Confirm Password",
  "forgot_password": "Forgot Password?",
  "reset_password": "Reset Password",
  "home": "Home",
  "profile": "Profile",
  "settings": "Settings",
  "language": "Language",
  "submit": "Submit",
  "cancel": "Cancel",
  "search": "Search",
  "edit": "Edit",
  "delete": "Delete",
  "save": "Save",
  "yes": "Yes",
  "no": "No",
  "loading": "Loading...",
  "success": "Success",
  "error": "Error",
  "retry": "Retry",
  "no_data": "No data available",
  "please_enter_email": "Please enter your email",
  "please_enter_password": "Please enter your password",
  "passwords_do_not_match": "Passwords do not match",
  "invalid_email": "Invalid email address"
}''');

  await File(join(langDir.path, 'ar.json')).writeAsString('''{
  "app_name": "تطبيقي",
  "welcome": "مرحباً",
  "login": "تسجيل الدخول",
  "logout": "تسجيل الخروج",
  "signup": "إنشاء حساب",
  "email": "البريد الإلكتروني",
  "password": "كلمة المرور",
  "confirm_password": "تأكيد كلمة المرور",
  "forgot_password": "هل نسيت كلمة المرور؟",
  "reset_password": "إعادة تعيين كلمة المرور",
  "home": "الرئيسية",
  "profile": "الملف الشخصي",
  "settings": "الإعدادات",
  "language": "اللغة",
  "submit": "إرسال",
  "cancel": "إلغاء",
  "search": "بحث",
  "edit": "تعديل",
  "delete": "حذف",
  "save": "حفظ",
  "yes": "نعم",
  "no": "لا",
  "loading": "جاري التحميل...",
  "success": "نجاح",
  "error": "خطأ",
  "retry": "إعادة المحاولة",
  "no_data": "لا توجد بيانات",
  "please_enter_email": "يرجى إدخال البريد الإلكتروني",
  "please_enter_password": "يرجى إدخال كلمة المرور",
  "passwords_do_not_match": "كلمتا المرور غير متطابقتين",
  "invalid_email": "عنوان البريد الإلكتروني غير صالح"
}''');
}

Future<void> _generateReadme(Directory projectDir, String projectName) async {
  final readmeFile = File(join(projectDir.path, 'README.md'));
  await readmeFile.writeAsString('''
Clean Flutter Architecture,
Clean Gen-Tool By Mohammad AD

Contact: richardchalger@gmail.com

---
# How To Use

First add the package to your pubspec.yaml:
```yaml
dependencies:
  clean_gen_tool_plus: ^${CleanGenToolPlus.projectVersion}
```
---
Or run the following command in your terminal:
With Dart:
```bash
  dart pub add clean_gen_tool_plus
```
---
With Flutter:
```bash
  flutter pub add clean_gen_tool_plus
```
---
Import it
```bash
  import 'package:clean_gen_tool_plus/clean_gen_tool_plus.dart';
```
---
Create a new file named `gen_tool.dart` in the `lib` directory of your Flutter project.
and add the following code to it:
```dart
import 'package:clean_gen_tool_plus/clean_gen_tool_plus.dart';

 void main() async {
   await CleanGenToolPlus.generate();
 }
```
---
Then run the generator tool to generate the necessary files and structure:
```bash
  dart run lib/gen_tool.dart
```
---
# Documentation:
## Clean Architecture

This project is a base Flutter Clean Architecture template demonstrating best practices in project
structure,
state management, and scalable app development.

It includes:

- A sample Category screen
- A sample Login screen
- Implementation of Bloc/Cubit for state management
- Robust error handling (network errors, failures, exceptions)
- Well-structured repository pattern
- Base Repository for clean code implementation
- Well-structured network pattern
- PrettyDioLogger for the best dio logging for debuggers
- Offline Builder in case internet went off
- A ready to use General Layer to help use in the app :
    * constants / routing / theme / env settings / offline builder / shared preference / Queue Request / utils 
    * services like Dio, SharedPreferences, Connectivity, and more 
    * extensions for common types
    * routing with auto_route
    * Dependency Injection using get_it
  and many many more
- A ready to use responsive layouts and builders 
    * check rs_seek plugin for examples on how to implement responsive layouts

The project is built following the Clean Architecture principles, broken down into three main
layers:

* business_layer – Manages state using (Bloc)
* data_layer – Handles models, networking, and repositories
* general_layer – Contains constants, services, utilities, routing, and more
* Dependency Injection – Uses get_it for service locator pattern
* Features – Organized by feature, each with its own presentation layer

## Structure

```
Structure A-Conceptual
lib/
├── core/
│   ├── business_layer/
│   ├── data_layer/
│   └── general_layer/
├── features/
│   ├── onboarding/
│   └── splash/
├── app.dart
├── app_bloc_observer.dart
└── main.dart
```

```
Structure B - Current
lib/
├── core/
│   ├── business_layer/
│   │   └── cubit/
│   │       ├── category/
│   │       ├── locale/
│   │       ├── login/        
│   │       └── theme/
│   │   └── bloc/
│   │       └── login/
│   ├── data_layer/
│   │   ├── errors/
│   │   ├── models/
│   │   │   └── category/
│   │   ├── network/
│   │   └── repository/
│   │       ├── base/
│   │       └── category/
│   └── general_layer/
│       ├── constants/
│       ├── extensions/
│       ├── routing/
│       ├── services/
│       ├── theme/
│       └── utils/
├── features/
│   ├── home/
│   │   └── presentation/
│   │       └── screens/
│   ├── login/               
│   │   └── presentation/
│   │       └── screens/
│   ├── onboarding/
│   │   └── presentation/
│   │       └── screens/
│   └── splash/
│       └── presentation/
│           └── screens/
└── generated/
```

## Getting Started

```bash
flutter pub get
flutter run
```

---

## For the use of Git : (Main Git Commands)

```bash
git init
git add .
git remote add origin 'Repository Url'
git commit -m 'Type : Message'

git pull / git fetch origin
git push origin 'branchName'
git push origin 'branchName':'branchName2' --force

git status
git log
git branch
git merge 'branchName'

git checkout 'branchName'
git checkout -b 'branchName'
```

---

## To generate a new structure into a .txt file

```bash
dart lib/generate_structure.dart > structure.txt
```

---

## Credits
Built with ❤️ by Mohammad Al-Adarbi
''');
}

Future<void> _generateCore(Directory libDir, String projectName) async {
  final coreDir = Directory(join(libDir.path, 'core'));
  final structure = {
    'general_layer/constants': {
      'app_constants.dart': _appConstantsCode(projectName), // done
      'endpoint_constants.dart': _endpointConstantsCode(projectName), // done
      'strings_constants.dart': _stringsConstantsCode(projectName), // done
    },
    'general_layer/extensions': {
      'navigation_extensions.dart': _navigationExtCode(projectName), // done
      'sizedbox_extensions.dart': _sizedBoxExtCode(projectName), // done
      'theme_extensions.dart': _themeExtCode(projectName), // done
    },
    'general_layer/methods': {
      'general_methods.dart': _generalMethodsCode(projectName), // done
    },
    'general_layer/routing': {
      'app_router_settings.dart': _appRouterCode(projectName), // done
      'app_routes_list.dart': _routesCode(projectName), // done
    },
    'general_layer/services': {
      'locale_service.dart': _localeServiceCode(projectName), // done
      'theme_service.dart': _themeServiceCode(projectName), // done
      'network_service.dart': _netWorkServiceCode(projectName), // done
      'timer_service.dart': _timerServiceCode(projectName), // done
    },
    'general_layer/theme': {
      'app_theme.dart': _appThemeCode(projectName), // done
      'app_colors.dart': _appColorsCode(projectName), // done
    },
    'general_layer/utils': {
      'app_env_settings.dart': _appEnvSettingsCode(projectName),
      // done
      'app_location_service.dart': _appLocationServiceCode(projectName),
      // done
      'app_logger_utility.dart': _appLoggerUtility(projectName),
      // done
      'app_network_storage.dart': _appNetWorkStorage(projectName),
      // done
      'app_notification_storage.dart': _appNotificationStorage(projectName),
      // done
      'app_offline_builder.dart': _appOfflineBuilderCode(projectName),
      // done
      'app_secure_storage.dart': _appSecureStorage(projectName),
      // done
      'app_shared_preferences.dart': _appPrefsCode(projectName),
      // done
      'app_validation_utils.dart': _appValidationUtilsCode(projectName),
      // done
    },
    'general_layer/widgets': {
      'app_error_widget.dart': _appErrorWidget(projectName), // done
      'app_general_widgets.dart': _appGeneralWidgets(projectName), // done
    },
    'data_layer/errors': {
      'exceptions.dart': _exceptionsCode(projectName), // done
      'failures.dart': _failuresCode(projectName), // done
    },
    'data_layer/models/const_models': {
      'offline_queue_model.dart': _offlineQueueModel(projectName), // done
    },
    'data_layer/network': {
      'api_consumer.dart': _apiConsumerCode(projectName), // done
      'dio_consumer.dart': _dioConsumerCode(projectName), // done
      'interceptors.dart': _interceptorsCode(projectName), // done
      'status_code.dart': _statusCodeCode(projectName), // done
      'queue_consumer.dart': _queueConsumer(projectName), // done
    },
    'data_layer/repository/base': {
      'base_repository.dart': _baseRepositoryCode(projectName), // done
      'login_repository.dart': _loginRepository(projectName), // done
    },
    'data_layer/': {
      'di_service_layer.dart': _diServiceLayer(projectName), // done
    },
    'business_layer/bloc/login': {
      'login_bloc.dart': _loginBlocCode(projectName), // done
      'login_event.dart': _loginEventCode(projectName), // done
      'login_state.dart': _loginStateCode(projectName), // done
    },
    'business_layer/cubit/locale': {
      'locale_cubit.dart': _localeCubitCode(projectName), // done
      'locale_state.dart': _localeStateCode(projectName), // done
    },
    'business_layer/cubit/theme': {
      'theme_cubit.dart': _themeCubitCode(projectName), // done
      'theme_state.dart': _themeStateCode(projectName), // done
    },
  };

  for (final entry in structure.entries) {
    final dir = Directory(join(coreDir.path, entry.key));
    await dir.create(recursive: true);
    for (final fileEntry in entry.value.entries) {
      final filePath = join(dir.path, fileEntry.key);
      await File(filePath).writeAsString(fileEntry.value);
    }
  }
}

Future<void> _generateFeatures(Directory libDir, String projectName) async {
  final featuresDir = Directory(join(libDir.path, 'features'));
  await featuresDir.create(recursive: true);

  final splashDir = Directory(
    join(featuresDir.path, 'splash/presentation/screens'),
  );
  final loginDir = Directory(
    join(featuresDir.path, 'login/presentation/screens'),
  );
  final homeDir = Directory(
    join(featuresDir.path, 'home/presentation/screens'),
  );

  await splashDir.create(recursive: true);
  await loginDir.create(recursive: true);
  await homeDir.create(recursive: true);

  await File(
    join(splashDir.path, 'splash_screen.dart'),
  ).writeAsString(_splashScreenCode(projectName)); // done

  await File(
    join(splashDir.path, 'initializer_screen.dart'),
  ).writeAsString(_appInitializerCode(projectName)); // done

  await File(
    join(loginDir.path, 'login_screen.dart'),
  ).writeAsString(_loginScreenCode(projectName)); // done

  await File(
    join(homeDir.path, 'notification_screen.dart'),
  ).writeAsString(_notificationScreen(projectName)); // done
}

Future<void> _generateAssetsGn(Directory libDir, String projectName) async {
  final assetDir = Directory(join(libDir.path, 'generated'));
  await assetDir.create(recursive: true);
  await File(
    join(assetDir.path, 'assets.dart'),
  ).writeAsString(_assetsFolderCode(projectName)); // done
}

Future<void> _generateMainApp(Directory libDir, String projectName) async {
  await File(
    join(libDir.path, 'main.dart'),
  ).writeAsString(_mainCode(projectName)); //done

  await File(
    join(libDir.path, 'gen_tool.dart'),
  ).writeAsString(_genCode(projectName)); //done

  await File(
    join(libDir.path, 'app.dart'),
  ).writeAsString(_appCode(projectName)); //done

  await File(
    join(libDir.path, 'app_bloc_observer.dart'),
  ).writeAsString(_blocObserverCode(projectName)); //done
}

Future<void> _generatePubspecYaml(
  Directory projectDir,
  String projectName,
) async {
  final flutterCmd = Platform.isWindows ? 'flutter.bat' : 'flutter';

  late final String flutterVersionOutput;
  try {
    final flutterVersionResult = await Process.run(flutterCmd, ['--version']);
    flutterVersionOutput = flutterVersionResult.stdout.toString();
  } catch (e) {
    stderr.writeln(
      'Please ensure that Flutter is installed and available in your PATH.',
    );
    rethrow;
  }

  final sdkMatch = RegExp(
    r'Dart\sSDK\sversion:\s(\d+\.\d+\.\d+)',
  ).firstMatch(flutterVersionOutput);
  final dartVersion = sdkMatch != null ? sdkMatch.group(1)! : '3.0.0';
  final dartVersionClean = dartVersion.replaceAll('^', '');

  final flutterMatch = RegExp(
    r'Flutter\s(\d+\.\d+\.\d+)',
  ).firstMatch(flutterVersionOutput);
  final flutterVersion =
      flutterMatch != null ? flutterMatch.group(1)! : 'unknown';

  final pubspecContent = '''
name: $projectName
description: Clean Flutter Architecture project by Mohammad AD
# Flutter version on machine: $flutterVersion
publish_to: 'none'

environment:
  sdk: '>=$dartVersionClean <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc:
  dio:
  shared_preferences:
  easy_localization:
  intl:
  uuid:
  equatable:
  get_it:
  cached_network_image:
  flutter_screenutil:
  flutter_native_splash:
  dartz:
  flutter_offline: ^5.0.0
  flutter_dotenv: ^5.2.1
  pretty_dio_logger:
  path:
  rs_seek: ^1.0.0
  geolocator: ^14.0.1
  permission_handler: ^12.0.0+1
  change_app_package_name: ^1.5.0
  get:
  flutter_secure_storage: 9.2.4
  connectivity_plus:
  after_layout: ^1.2.0
  platform_device_id_plus: ^1.0.7



  cupertino_icons:
  clean_gen_tool_plus: ^${CleanGenToolPlus.projectVersion}

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints:

flutter:
  uses-material-design: true
  generate: true
  assets:
    - assets/images/
    - assets/icons/
    - assets/lang/
    - .env
''';

  final file = File(join(projectDir.path, 'pubspec.yaml'));
  await file.writeAsString(pubspecContent);

  systemLogAction(
    'Pubspec.yaml generated successfully with Flutter version $flutterVersion',
    'SUCCESS',
  );
}

// ============================ الأكواد ============================

String _appConstantsCode(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as format;

class AC {
   // 📕: error message
  // 📙: warning message
  // 📗: ok status message
  // 📘: action message
  // 📓: canceled status message
  // 📔: Or anything you like and want to recognize immediately by color

  static const String appName = '$projectName';
  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];
  static const String localeKey = 'app_locale';
  static const String themeKey = 'app_theme';
  static const Color xMainColor = Color.fromRGBO(14, 82, 145, 1);
  static const Color xMainColorLight = Color.fromRGBO(187, 155, 250, 0.2);
  static const Color xMainColorDark = Color.fromRGBO(162, 130, 226, 1);
  static const Color xMainColorBold = Color.fromRGBO(217, 217, 217, 1);
  static const Color xMainColorText = Color.fromRGBO(165, 165, 165, 1);
  static const Color appPrimaryColor = Color.fromRGBO(14, 82, 145, 1);
  static const Color appSecondaryColor = Color.fromRGBO(238, 154, 45, 1);
  static const Color xWhitest = Color(0xFFFFFFFF);
  static const Color xOffWhite = Color.fromRGBO(236, 240, 241, 1);
  static const Color xOffWhite2 = Color.fromRGBO(97, 105, 119, 1);
  static const Color xOffWhite3 = Color.fromRGBO(244, 245, 247, 1);
  static const Color xImageBackColor = xMainColor;
  static const Color xDiscoverColor = Color.fromRGBO(56, 195, 240, 1);
  static const Color xStarsColor = Color.fromRGBO(242, 153, 74, 1);
  static const Color xTransP = xStarsColor;
  static const Color xGrey = Color(0xFF838E8F);
  static const Color xGreyLight = Color.fromRGBO(244, 244, 244, 1);
  static const Color xGreyLighter = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color xVotingBlue = Color.fromRGBO(111, 86, 237, 1);
  static const Color xButtonsColor = xVotingBlue;
  static const Color xButtonsColorSubGradient =
      Color.fromRGBO(111, 120, 237, 1);
  static const Color xSuccessPrimary = Color.fromRGBO(85, 58, 211, 1);
  static const Color xTextPrimary = Color.fromRGBO(86, 72, 114, 1);
  static const Color xProgressColor = Color.fromRGBO(246, 208, 96, 1);
  static const Color xOrangeColor = xProgressColor;
  static const Color xWhite = Colors.white;
  static const Color xBlack = Colors.black;
  static const Color xRed = Colors.red;
  static const Color xTransparent = Colors.transparent;
  static const Color secondColor = Color(0xFFDFD9FF);
  static const Color xFieldColor = Color.fromRGBO(246, 248, 248, 1);

  static format.DateFormat get dateFormat => format.DateFormat('yyyy-MM-dd');

  static format.DateFormat get timeFormat => format.DateFormat('hh:mm');

  static format.DateFormat get timeMiliFormat => format.DateFormat('mm:ss');

  static format.DateFormat get dateTimeFormat => format.DateFormat('yyyy-MM-ddThh:mm:ss');

  static format.DateFormat get dateTimeFormat24 => format.DateFormat('yyyy-MM-ddTHH:MM:SS');

  static format.DateFormat get dateTimeFormatted => format.DateFormat('yyyy-MM-dd hh:mm:ss');

  static String deviceToken = '';
  static String deviceId = '';

  static final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
}
''';

String _endpointConstantsCode(String projectName) => '''
import 'package:$projectName/core/general_layer/utils/app_env_settings.dart';

class EC {
  static final String baseUrl = Environment.apiKey;
}

''';

String _stringsConstantsCode(String projectName) => '''
class StringsConstants {
  static const Map<String, String> en = {
    'appName': 'My App',
    'welcomeMessage': 'Welcome to My App',
    'login': 'Login',
    'logout': 'Logout',
    'signup': 'Sign Up',
    'settings': 'Settings',
    'profile': 'Profile',
    'home': 'Home',
  };
  static const Map<String, String> ar = {
    'appName': 'تطبيقي',
    'welcomeMessage': 'مرحبًا بك في تطبيقي',
    'login': 'تسجيل الدخول',
    'logout': 'تسجيل الخروج',
    'signup': 'إنشاء حساب',
    'settings': 'الإعدادات',
    'profile': 'الملف الشخصي',
    'home': 'الرئيسية',
  };
}
''';

String _apiConsumerCode(String projectName) => '''
abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {Map<String, dynamic>? body});
  Future<dynamic> put(String path, {Map<String, dynamic>? body});
  Future<dynamic> delete(String path);
}
''';

String _dioConsumerCode(String projectName) => '''
import 'package:$projectName/core/data_layer/errors/exceptions.dart';
import 'package:$projectName/core/data_layer/network/status_code.dart';
import 'package:$projectName/core/general_layer/methods/general_methods.dart';
import 'package:$projectName/core/general_layer/utils/app_env_settings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'api_consumer.dart';
import 'interceptors.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  final AppInterceptors appInterceptors = AppInterceptors();
  final gmd = GetIt.instance<GeneralMethods>();

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = Environment.apiKey
      ..responseType = ResponseType.json
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);

    client.interceptors.addAll(appInterceptors.getInterceptors());
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } catch (error) {
      _handleAnyError(error);
    }
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(path, data: body);
      return response.data;
    } catch (error) {
      _handleAnyError(error);
    }
  }

  @override
  Future<dynamic> put(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.put(path, data: body);
      return response.data;
    } catch (error) {
      _handleAnyError(error);
    }
  }

  @override
  Future<dynamic> delete(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.delete(path, data: body);
      return response.data;
    } catch (error) {
      _handleAnyError(error);
    }
  }

  void _handleAnyError(Object error) {
    if (error is DioException) {
      _handleDioError(error);
    } else {
      if (!kReleaseMode) {
        throw const ServerException('Unknown Network Error');
      }
    }
  }

  void _handleDioError(DioException error) {
    final int statusCode =
        error.response?.statusCode ?? StatusCode.internalServerError;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.unknown:
      case DioExceptionType.connectionError:
        gmd.systemLogError('No Internet Connection', error.type);
        if (!kReleaseMode) {
          throw RetryableException('No Internet Connection');
        }

      case DioExceptionType.cancel:
        gmd.systemLogError('Request Cancelled', error.type);
        if (!kReleaseMode) {
          throw const ServerException('Request Cancelled');
        }

      case DioExceptionType.badResponse:
        switch (statusCode) {
          case StatusCode.badRequest:
            gmd.systemLogError('Bad Request: message', statusCode);
            if (!kReleaseMode) {
              throw ServerException('Bad Request: message', statusCode);
            }
          case StatusCode.unauthorized:
            gmd.systemLogError('Unauthorized: message', statusCode);
            if (!kReleaseMode) {
              throw ServerException('Unauthorized: message', statusCode);
            }
          case StatusCode.forbidden:
            gmd.systemLogError('Forbidden: message', statusCode);
            if (!kReleaseMode) {
              throw ServerException('Forbidden: message', statusCode);
            }
          case StatusCode.notFound:
            gmd.systemLogError('Not Found: message', statusCode);
            if (!kReleaseMode) {
              throw ServerException('Not Found: message', statusCode);
            }
          case StatusCode.conflict:
            gmd.systemLogError('Conflict: message', statusCode);
            if (!kReleaseMode) {
              throw ServerException('Conflict: message', statusCode);
            }
          case StatusCode.internalServerError:
            gmd.systemLogError('Internal Server Error: message', statusCode);
            if (!kReleaseMode) {
              throw ServerException(
                  'Internal Server Error: message', statusCode);
            }
          default:
            gmd.systemLogError('Unexpected Error: message', statusCode);
            if (!kReleaseMode) {
              throw ServerException('Unexpected Error: message', statusCode);
            }
        }
      case DioExceptionType.badCertificate:
        gmd.systemLogError('Bad Certificate Error', error.type);
        if (!kReleaseMode) {
          throw const ServerException('Bad Certificate Error');
        }
    }
  }
}

class RetryableException implements Exception {
  final String message;

  RetryableException(this.message);
}
''';

String _interceptorsCode(String projectName) => '''
import 'package:$projectName/core/general_layer/methods/general_methods.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppInterceptors {
  final gmd = GetIt.instance<GeneralMethods>();

  List<Interceptor> getInterceptors() {
    return [
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers.addAll({
            'Content-Type': 'application/json',
            // 'Authorization': 'Bearer YOUR_TOKEN_HERE',
          });
          handler.next(options);
        },
      ),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        maxWidth: 140,
        responseBody: true,
        error: true,
        logPrint: (object) {
          gmd.systemLogWarning(object.toString());
        },
      ),
    ];
  }
}
''';

String _diServiceLayer(String projectName) => '''
import 'package:$projectName/core/data_layer/network/api_consumer.dart';
import 'package:$projectName/core/data_layer/network/dio_consumer.dart';
import 'package:$projectName/core/data_layer/network/queue_consumer.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/core/general_layer/methods/general_methods.dart';
import 'package:$projectName/core/general_layer/services/network_service.dart';
import 'package:$projectName/core/general_layer/utils/app_env_settings.dart';
import 'package:$projectName/core/general_layer/utils/app_location_service.dart';
import 'package:$projectName/core/general_layer/utils/app_notification_storage.dart';
import 'package:$projectName/core/general_layer/utils/app_secure_storage.dart';
import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'package:$projectName/core/general_layer/widgets/app_general_widgets.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static Future<void> setup() async {
    final getIt = GetIt.instance;
    getIt.registerLazySingleton<AppPreferences>(() => AppPreferences());
    getIt.registerLazySingleton<GeneralMethods>(() => GeneralMethods());
    getIt.registerLazySingleton<NotificationStore>(() => NotificationStore());

    getIt.registerLazySingleton<LocationService>(() => LocationService());
    getIt.registerLazySingleton<Environment>(() => Environment());
    await getIt<Environment>().load();

    getIt.registerLazySingleton<AC>(() => AC());
    getIt.registerLazySingleton<Dio>(() => Dio());

    getIt.registerLazySingleton<GeneralWidgets>(() => GeneralWidgets());

    getIt.registerSingleton<DioConsumer>(DioConsumer(client: getIt<Dio>()));

    getIt.registerLazySingleton<ApiConsumer>(() => getIt<DioConsumer>());
    getIt.registerLazySingleton<NetworkRequestQueueService>(
        () => NetworkRequestQueueService());
    final queueService = getIt<NetworkRequestQueueService>();

    getIt.registerLazySingleton<QueueApiConsumer>(() =>
        QueueApiConsumer(
            realApiConsumer: getIt<DioConsumer>(), queueService: queueService));

    getIt.registerLazySingleton<SecureStorageService>(
        () => SecureStorageService());

  }
}

''';

String _queueConsumer(String projectName) => '''
import 'package:$projectName/core/data_layer/models/const_models/offline_queue_model.dart';
import 'package:$projectName/core/data_layer/network/api_consumer.dart';
import 'package:$projectName/core/data_layer/network/dio_consumer.dart';
import 'package:$projectName/core/general_layer/services/network_service.dart';
import 'package:uuid/uuid.dart';

class QueueApiConsumer implements ApiConsumer {
  final ApiConsumer _realApiConsumer;
  final NetworkRequestQueueService _queueService;

  QueueApiConsumer({
    required ApiConsumer realApiConsumer,
    required NetworkRequestQueueService queueService,
  })  : _realApiConsumer = realApiConsumer,
        _queueService = queueService;

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _realApiConsumer.get(path, queryParameters: queryParameters);
    } on RetryableException catch (_) {
      await _queueService.addRequest(
        OfflineRequest(
          id: const Uuid().v4(),
          path: path,
          method: 'GET',
          queryParameters: queryParameters,
        ),
      );
      // rethrow;
    }
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    try {
      return await _realApiConsumer.post(path, body: body);
    } on RetryableException catch (_) {
      await _queueService.addRequest(
        OfflineRequest(
          id: const Uuid().v4(),
          path: path,
          method: 'POST',
          body: body,
        ),
      );
      // rethrow;
    }
  }

  @override
  Future<dynamic> put(String path, {Map<String, dynamic>? body}) async {
    try {
      return await _realApiConsumer.put(path, body: body);
    } on RetryableException catch (_) {
      await _queueService.addRequest(
        OfflineRequest(
          id: const Uuid().v4(),
          path: path,
          method: 'PUT',
          body: body,
        ),
      );
      // rethrow;
    }
  }

  @override
  Future<dynamic> delete(String path) async {
    try {
      return await _realApiConsumer.delete(path);
    } on RetryableException catch (_) {
      await _queueService.addRequest(
        OfflineRequest(
          id: const Uuid().v4(),
          path: path,
          method: 'DELETE',
        ),
      );
      // rethrow;
    }
  }
}
''';

String _statusCodeCode(String projectName) => '''
class StatusCode {
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internalServerError = 500;
}
''';

String _exceptionsCode(String projectName) => '''
abstract class AppException implements Exception {
  final String message;
  final int statusCode;

  const AppException(this.message, this.statusCode);
}

class ServerException extends AppException {
  const ServerException([super.message = 'Server Error', super.statusCode = 500]);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache Error', super.statusCode = 500]);
}

''';

String _offlineQueueModel(String projectName) => '''
class OfflineRequest {
  final String id;
  final String path;
  final String method;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queryParameters;

  OfflineRequest({
    required this.id,
    required this.path,
    required this.method,
    this.body,
    this.queryParameters,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'path': path,
        'method': method,
        'body': body,
        'queryParameters': queryParameters,
      };

  factory OfflineRequest.fromJson(Map<String, dynamic> json) {
    return OfflineRequest(
      id: json['id'],
      path: json['path'],
      method: json['method'],
      body: json['body'],
      queryParameters: json['queryParameters'],
    );
  }
}
''';

String _failuresCode(String projectName) => '''
abstract class Failure {
  final String message;
  final int statusCode;

  Failure(this.message, this.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'Server Error', super.statusCode = 500]);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = 'Cache Error', super.statusCode = 500]);
}
''';

String _appGeneralWidgets(String projectName) => '''
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rs_seek/rs_seek.dart';

class GeneralWidgets {
  final ac = GetIt.instance<AC>();

  Widget buildLogo() {
    return Column(
      children: [
        RsAspectRatio(child: Image.asset(Assets.imagesLogo)),
        const Text(
          '$projectName',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: AC.xMainColor),
        ),
      ],
    );
  }

  Widget buildSliverAppBar(String title,
      {List<Widget>? actions, Widget? leading}) {
    return SliverAppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: AC.xMainColor,
      actions: actions,
      leading: leading,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: buildLogo(),
      ),
    );
  }

  Widget buildAppBar(String title, {List<Widget>? actions, Widget? leading}) {
    return AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: AC.xMainColor,
        actions: actions,
        leading: leading);
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: _buildOutlineInputBorder(),
          enabledBorder: _buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AC.xMainColor, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    Color? textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        backgroundColor: color ?? AC.xMainColor,
        foregroundColor: textColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: FittedBox(child: Text(text)),
    );
  }

  Widget buildSearchBarWithFocus(
      String title, TextEditingController searchController, FocusNode focusNode,
      {Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: searchController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: AC.xMainColor),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget buildSearchBar(String title, TextEditingController searchController,
      FocusNode focusNode, Function(String) callback) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: searchController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: AC.xMainColor),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: callback,
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: AC.xMainColor,
      ),
    );
  }

  Widget buildErrorWidget(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(
      {required IconData icon,
      required VoidCallback onPressed,
      Color? color,
      double? size}) {
    return IconButton(
      icon: Icon(icon, color: color ?? AC.xMainColor, size: size ?? 24),
      onPressed: onPressed,
    );
  }

  Widget buildTextButton({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    Color? textColor,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? Colors.white,
        backgroundColor: color ?? AC.xMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: AC.xMainColor,
      thickness: 1.5,
      height: 20,
    );
  }

  SnackBar buildSnackBar(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: AC.xMainColor,
      duration: const Duration(seconds: 2),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(message));
  }

  Widget buildBottomNavigationBar(
      {required List<BottomNavigationBarItem> items,
      required int currentIndex,
      required Function(int) onTap}) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AC.xMainColor,
      unselectedItemColor: Colors.grey,
    );
  }

  Widget buildCard({
    required Widget child,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
  }) {
    return Card(
      margin: margin ?? const EdgeInsets.all(8.0),
      color: color ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

 Padding buildPadding({
    required Widget child,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: child,
    );
  }

  Widget buildDropdownButtonFormField<T>({
    required List<T> items,
    required T value,
    required String hint,
    required Function(T?) onChanged,
    String? Function(T?)? validator,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: hint,
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }

  Widget buildFloatingActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? AC.xMainColor,
      foregroundColor: foregroundColor ?? Colors.white,
      child: Icon(icon),
    );
  }

  Widget buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        '© ${DateTime.now().year} $projectName. All rights reserved.',
        style: TextStyle(color: Colors.grey, fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required String subtitle,
    required IconData leadingIcon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(leadingIcon, color: AC.xMainColor),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  Widget buildCheckboxListTile({
    required String title,
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: AC.xMainColor,
    );
  }

  Widget buildSwitchListTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: AC.xMainColor,
    );
  }

  Widget buildTooltip({
    required String message,
    required Widget child,
    Color? backgroundColor,
    TextStyle? textStyle,
  }) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.black87,
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: textStyle ?? const TextStyle(color: Colors.white),
      child: child,
    );
  }

  Widget buildBanner({
    required String message,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Banner(
      message: message,
      location: BannerLocation.topEnd,
      color: backgroundColor ?? AC.xMainColor,
      textStyle: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
      child: Container(),
    );
  }

  Widget buildLanguageSelector({
    required List<String> languages,
    required String selectedLanguage,
    required ValueChanged<String?>? onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: selectedLanguage,
      items: languages.map((String language) {
        return DropdownMenuItem<String>(
          value: language,
          child: Text(language),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: 'Select Language',
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }

  Widget buildDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required Function(DateTime) onDateSelected,
  }) {
    return ElevatedButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null && picked != initialDate) {
          onDateSelected(picked);
        }
      },
      child: Text('Select Date'),
    );
  }

  Widget buildListViewBuilderWithLoadingAndPagination<T>({
    required List<T> items,
    required Widget Function(BuildContext, T) itemBuilder,
    required int itemCount,
    required bool isLoading,
    required VoidCallback onLoadMore,
    required ScrollController scrollController,
  }) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        onLoadMore();
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: isLoading ? itemCount + 1 : itemCount,
      itemBuilder: (context, index) {
        if (isLoading && index == itemCount) {
          return Center(child: CircularProgressIndicator(color: AC.xMainColor));
        }
        return itemBuilder(context, items[index]);
      },
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      primary: false,
    );
  }

  Widget buildGridViewBuilder<T>({
    required List<T> items,
    required Widget Function(BuildContext, T) itemBuilder,
    required int itemCount,
    int crossAxisCount = 2,
    double childAspectRatio = 1.0,
  }) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return itemBuilder(context, items[index]);
      },
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget buildTabBar({
    required List<Tab> tabs,
    required TabController controller,
    required Function(int) onTap,
  }) {
    return TabBar(
      controller: controller,
      tabs: tabs,
      onTap: onTap,
      indicatorColor: AC.xMainColor,
      labelColor: AC.xMainColor,
      unselectedLabelColor: Colors.grey,
    );
  }

  Widget buildTabBarView({
    required List<Widget> children,
    required TabController controller,
  }) {
    return TabBarView(
      controller: controller,
      children: children,
    );
  }

  Widget buildSnackBarWithAction({
    required String message,
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    return SnackBar(
      content: Text(message),
      backgroundColor: AC.xMainColor,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: actionLabel,
        textColor: Colors.white,
        onPressed: onAction,
      ),
    );
  }
}

''';

String _appErrorWidget(String projectName) => '''
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;

  const AppErrorWidget({
    super.key,
    this.message = "Something went wrong",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 16),
              Text(
                message,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.red.shade700, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

''';

String _appValidationUtilsCode(String projectName) => '''
//Please consider removing the backslash \ before each dollar sign \$
class AppUtils {
  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{3,})').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@\$%^&*-])').hasMatch(password);
  }

  static bool isPasswordValid(String password) {
    return hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasNumber(password) &&
        hasMinLength(password) &&
        hasSpecialCharacter(password);
  }

  static bool isNameValid(String name) {
    return RegExp(r'^[a-zA-Z\s]{2,}\$').hasMatch(name);
  }

  static bool isSurnameValid(String surname) {
    return RegExp(r'^[a-zA-Z\s]{2,}\$').hasMatch(surname);
  }

  static bool isFullNameValid(String fullName) {
    return RegExp(r'^[a-zA-Z\s]{2,}\$').hasMatch(fullName);
  }

  static bool isNicknameValid(String nickname) {
    return RegExp(r'^[a-zA-Z0-9_]{3,}\$').hasMatch(nickname);
  }

  static bool isPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static bool isAgeEmpty(String age) {
    return age.isEmpty;
  }

  static bool isAgeValid(String age) {
    return RegExp(r'^(1[89]|[2-9][0-9]|1[01][0-9]|120)\$').hasMatch(age);
  }

  static bool isUsernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9_]{3,}\$').hasMatch(username);
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(email);
  }

  static bool isEmailDomainValid(String email, String domain) {
    return RegExp(r'^[^@]+@' + RegExp.escape(domain) + r'\$').hasMatch(email);
  }

 static bool isPhoneNumberValid(String phoneNumber) {
    switch (phoneNumber.length) {
      case 10:
        return isJordanianPhoneNumberValid(phoneNumber);
      case 11:
        return isSaudiPhoneNumberValid(phoneNumber);
      case 12:
        return isEmiratiPhoneNumberValid(phoneNumber);
      case 13:
        return isEgyptianPhoneNumberValid(phoneNumber);
      case 14:
        return isAmericanPhoneNumberValid(phoneNumber);
      default:
        return false;
    }
  }
static bool isJordanianPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(079|078|077|076|075|074|073|072|071)[0-9]{7}\$').hasMatch(phoneNumber);
  }
  static bool isSaudiPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(5|9)[0-9]{8}\$').hasMatch(phoneNumber);
  }
  static bool isEmiratiPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(5|6|7)[0-9]{8}\$').hasMatch(phoneNumber);
  }
  static bool isEgyptianPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(1|2|3|4|5|6|7|8|9)[0-9]{9}\$').hasMatch(phoneNumber);
  }
  static bool isAmericanPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(1|2|3|4|5|6|7|8|9)[0-9]{10}\$').hasMatch(phoneNumber);
  }
  static bool isUrlValid(String url) {
    return RegExp(
      r'^(https?|ftp):\/\/[^\s/\$.?#].[^\s]*\$',
      caseSensitive: false,
    ).hasMatch(url);
  }

  static bool isDateValid(String date) {
    return RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-(\d{4})\$',
      caseSensitive: false,
    ).hasMatch(date);
  }

  static bool isTimeValid(String time) {
    return RegExp(
      r'^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$',
      caseSensitive: false,
    ).hasMatch(time);
  }

  static bool isDateTimeValid(String dateTime) {
    return RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-(\d{4}) (0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\$',
      caseSensitive: false,
    ).hasMatch(dateTime);
  }

  static bool isPostalCodeValid(String postalCode) {
    return RegExp(
      r'^\d{5}(-\d{4})?\$',
      caseSensitive: false,
    ).hasMatch(postalCode);
  }

  static bool isCreditCardValid(String creditCard) {
    return RegExp(
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})\$',
      caseSensitive: false,
    ).hasMatch(creditCard);
  }

  static bool isHexColorValid(String hexColor) {
    return RegExp(
      r'^#?([0-9a-fA-F]{6}|[0-9a-fA-F]{3})\$',
      caseSensitive: false,
    ).hasMatch(hexColor);
  }

  static bool isIpAddressValid(String ipAddress) {
    return RegExp(
      r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\$',
      caseSensitive: false,
    ).hasMatch(ipAddress);
  }

  static bool isMacAddressValid(String macAddress) {
    return RegExp(
      r'^([0-9a-fA-F]{2}[:-]){5}([0-9a-fA-F]{2})\$',
      caseSensitive: false,
    ).hasMatch(macAddress);
  }

  static bool isUuidValid(String uuid) {
    return RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\$',
      caseSensitive: false,
    ).hasMatch(uuid);
  }
}
''';

String _appPrefsCode(String projectName) => '''
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class AppPreferences {
 static final AppPreferences _instance = AppPreferences._internal();
 late SharedPreferences _prefs;


 factory AppPreferences() {
   return _instance;
 }


 AppPreferences._internal();


 /// ✅ **تهيئة SharedPreferences**
 Future<void> init() async {
   _prefs = await SharedPreferences.getInstance();
 }


 /// ✅ **حفظ البيانات بأي نوع (`String, int, double, bool, List<String>`)**
 Future<void> setData(String key, dynamic value) async {
   if (value is String) {
     await _prefs.setString(key, value);
   } else if (value is int) {
     await _prefs.setInt(key, value);
   } else if (value is double) {
     await _prefs.setDouble(key, value);
   } else if (value is bool) {
     await _prefs.setBool(key, value);
   } else if (value is List<String>) {
     await _prefs.setStringList(key, value);
   } else {
     throw Exception("Unsupported data type");
   }
 }


 /// ✅ **استرجاع البيانات (`String, int, double, bool, List<String>`)**
 dynamic getData(String key) {
   return _prefs.get(key);
 }


 /// ✅ **حذف بيانات مفتاح معين**
 Future<void> removeData(String key) async {
   await _prefs.remove(key);
 }


 /// ✅ **حفظ كائن Model (`T`)**
 Future<void> saveModel<T>(String key, T model, Map<String, dynamic> Function(T) toJson) async {
   final String jsonString = jsonEncode(toJson(model));
   await _prefs.setString(key, jsonString);
 }


 /// ✅ **استرجاع كائن Model (`T`)**
 T? getModel<T>(String key, T Function(Map<String, dynamic>) fromJson) {
   final String? jsonString = _prefs.getString(key);
   if (jsonString != null) {
     final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
     return fromJson(jsonMap);
   }
   return null;
 }


 /// ✅ **حفظ قائمة من النماذج (`List<T>`)**
 Future<void> saveModels<T>(String key, List<T> models, Map<String, dynamic> Function(T) toJson) async {
   final List<String> jsonList = models.map((model) => jsonEncode(toJson(model))).toList();
   await _prefs.setStringList(key, jsonList);
 }


 /// ✅ **استرجاع قائمة من النماذج (`List<T>`)**
 List<T> getModels<T>(String key, T Function(Map<String, dynamic>) fromJson) {
   final List<String>? jsonList = _prefs.getStringList(key);
   if (jsonList != null) {
     return jsonList.map((json) => fromJson(jsonDecode(json))).toList();
   }
   return [];
 }


 Future<void> clearExceptCredentials() async {
   // حفظ بيانات تسجيل الدخول قبل الحذف
   String? savedEmail = _prefs.getString('saved_email');
   String? savedPassword = _prefs.getString('saved_password');
   bool? rememberMe = _prefs.getBool('remember_me');


   // مسح كل البيانات
   await _prefs.clear();


   // استرجاع بيانات تسجيل الدخول
   if (savedEmail != null) await _prefs.setString('saved_email', savedEmail);
   if (savedPassword != null) await _prefs.setString('saved_password', savedPassword);
   if (rememberMe != null) await _prefs.setBool('remember_me', rememberMe);
 }
 bool isLoggedInUser() {
   return _prefs.containsKey("userModel");
 }


}
''';

String _appSecureStorage(String projectName) => '''
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final _storage = FlutterSecureStorage();

  static const _keyAccessToken = 'access_token';

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  Future<void> clearAccessToken() async {
    await _storage.delete(key: _keyAccessToken);
  }
}
''';

String _appOfflineBuilderCode(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class AppOfflineBuilder extends StatelessWidget {
  final Widget? child;

  const AppOfflineBuilder({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        List<ConnectivityResult> connectivity,
        Widget child,
      ) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              child,
              if (!connected)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(20),
                    child: Row(children: [
                      const Icon(Icons.signal_wifi_off,
                          color: Colors.white, size: 45),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No Internet Connection',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Please check your connection and try again.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                )
            ],
          ),
        );
      },
      child: child,
    );
  }
}
 ''';

String _appNotificationStorage(String projectName) => '''
import 'dart:ui';

import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'dart:convert';

import 'package:get_it/get_it.dart';

class NotificationStore {
  static final NotificationStore _instance = NotificationStore._internal();

  factory NotificationStore() => _instance;

  NotificationStore._internal();

  final List<Map<String, dynamic>> _notifications = [];

  final prefs = GetIt.instance<AppPreferences>();

  Future<void> loadNotifications() async {
    final data = prefs.getData('notifications');
    if (data != null) {
      final List decoded = jsonDecode(data);
      _notifications.clear();
      _notifications.addAll(decoded.cast<Map<String, dynamic>>());
    }
  }

  Future<void> saveNotifications() async {
    await prefs.setData('notifications', jsonEncode(_notifications));
  }

  Future<void> addNotification(Map<String, dynamic> notification) async {
    _notifications.insert(0, notification);
    await saveNotifications();
    for (var listener in _listeners) {
      listener();
    }
  }

  List<Map<String, dynamic>> get notifications =>
      List.unmodifiable(_notifications);

  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}
''';

String _appNetWorkStorage(String projectName) => '''
import 'dart:convert';

import 'package:$projectName/core/data_layer/models/const_models/offline_queue_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _key = 'offline_requests';

  static Future<void> saveRequests(List<OfflineRequest> requests) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(requests.map((e) => e.toJson()).toList());
    await prefs.setString(_key, encoded);
  }

  static Future<List<OfflineRequest>> loadRequests() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString(_key);
    if (encoded == null) return [];
    final List<dynamic> decoded = jsonDecode(encoded);
    return decoded.map((e) => OfflineRequest.fromJson(e)).toList();
  }
}

''';

String _appLoggerUtility(String projectName) => '''
import 'package:flutter/foundation.dart';

enum Logger {
  black("30"),
  red("31"),
  green("32"),
  yellow("33"),
  blue("34"),
  magenta("35"),
  cyan("36"),
  white("37");

  final String code;

  const Logger(this.code);

  void log(dynamic text) => debugPrint('\x1B[\${code}m\$text\x1B[0m');
}
''';

String _appLocationServiceCode(String projectName) => '''
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() => _instance;

  LocationService._internal();

  StreamSubscription<Position>? _positionStreamSubscription;
  final StreamController<Position> _positionController =
      StreamController.broadcast();

  Stream<Position> get positionStream => _positionController.stream;
  static String gpsLocation = '';

  Future<bool> initialize() async {
    final permission = await _checkAndRequestPermission();
    if (!permission) return false;

    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      return false;
    }

    return true;
  }

  Future<String?> getCurrentPosition(
      {LocationAccuracy accuracy = LocationAccuracy.high}) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Get.dialog(AlertDialog(
        title: const Text("Location Services Disabled"),
        content:
            const Text("Please enable location services to use this feature."),
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
              await Geolocator.openLocationSettings();

              serviceEnabled = await Geolocator.isLocationServiceEnabled();
              if (!serviceEnabled) {
                if (kDebugMode) {
                  print("Location services still disabled.");
                }
                return;
              }
            },
            child: const Text("Go to Settings"),
          ),
        ],
      ));
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (kDebugMode) {
          print("Location permission denied.");
        }
        return null;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
          accuracy: accuracy,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          distanceFilter: 10,
        ),
      );

      gpsLocation = '\${position.latitude}, \${position.longitude}';
      return gpsLocation;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting current position: \$e");
      }
      return null;
    }
  }

  void startListening({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 10,
  }) async {
    final hasPermission = await initialize();
    if (!hasPermission) return;

    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    ).listen((Position position) {
      _positionController.add(position);
    });
  }

  void stopListening() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  void dispose() {
    stopListening();
    _positionController.close();
  }

  Future<bool> _checkAndRequestPermission() async {
    var permission = await Permission.location.status;
    if (permission.isGranted) return true;

    final result = await Permission.location.request();
    return result.isGranted;
  }
}

''';

String _appEnvSettingsCode(String projectName) => '''
import 'package:$projectName/core/general_layer/methods/general_methods.dart';
import 'package:$projectName/core/general_layer/utils/app_location_service.dart';
import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class Environment {
  // to use these instances , you must register them in your service locator (GetIt) first
  final appPref = GetIt.instance<AppPreferences>();
  final locationService = GetIt.instance<LocationService>();
  GeneralMethods generalMethods = GeneralMethods();

  static String get fileName {
    return kReleaseMode ? '.env' : '.env';
  }

  Future<void> load() async {
  // Uncomment the following lines if you want to initialize app preferences and location service
    // await appPref.init();
    // await locationService.initialize();

    try {
      await dotenv.load(fileName: fileName);
    } catch (e) {
      generalMethods.systemLogError(
          'Failed to load and encrypt environment variables:', e);
      if (!kReleaseMode) {
        throw Exception('Failed to load and encrypt environment variables: e');
      }
    }
  }

  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
 ''';

String _localeServiceCode(String projectName) => '''
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';


import '../utils/app_shared_preferences.dart';


class LocaleService {


 LocaleService();


 static const _defaultLocale = Locale('en');


 /// Load saved locale or fallback
 Locale getCurrentLocale() {


   final localeCode = AppPreferences().getData(AC.localeKey);
   if (localeCode != null) {
     return Locale(localeCode);
   }
   return _defaultLocale;
 }


 /// Save locale and update easy_localization
 Future<void> setLocale(BuildContext context, String languageCode) async {
   await AppPreferences().setData(AC.localeKey, languageCode);
   await context.setLocale(Locale(languageCode));
 }
}


''';

String _timerServiceCode(String projectName) => '''
import 'dart:async';
import 'dart:ui';

class TimerService {
  Timer? _timer;

  void start(int seconds, VoidCallback onTrigger) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: seconds), () {
      onTrigger();
      start(seconds, onTrigger);
    });
  }

  void stop() => _timer?.cancel();
}
''';

String _netWorkServiceCode(String projectName) => '''
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:$projectName/core/data_layer/models/const_models/offline_queue_model.dart';
import 'package:$projectName/core/data_layer/network/api_consumer.dart';
import 'package:$projectName/core/general_layer/utils/app_network_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class NetworkRequestQueueService {
  static final NetworkRequestQueueService _instance =
      NetworkRequestQueueService._internal();

  factory NetworkRequestQueueService() => _instance;

  final realApiConsumer = GetIt.instance<ApiConsumer>();

  final List<OfflineRequest> _queue = [];
  bool _isRunning = false;

  NetworkRequestQueueService._internal() {
    _init();
  }

  Future<void> _init() async {
    _queue.addAll(await LocalStorageService.loadRequests());
    Connectivity().onConnectivityChanged.listen((result) {
      if (!result.contains(ConnectivityResult.none)) {
        _processQueue();
      }
    });
    _processQueue();
  }

  Future<void> addRequest(OfflineRequest request) async {
    _queue.add(request);
    await _persist();
    _processQueue();
  }

  Future<void> _persist() async {
    await LocalStorageService.saveRequests(_queue);
  }

  Future<void> _processQueue() async {
    if (_isRunning) return;
    _isRunning = true;

    while (_queue.isNotEmpty) {
      final request = _queue.first;

      try {
        await _performRequest(request);
        _queue.removeAt(0);
        await _persist();
      } catch (e) {
        break;
      }
    }

    _isRunning = false;
  }

  Future<void> _performRequest(OfflineRequest request) async {
    switch (request.method) {
      case 'GET':
        await realApiConsumer.get(request.path,
            queryParameters: request.queryParameters);
        break;
      case 'POST':
        await realApiConsumer.post(request.path, body: request.body);
        break;
      case 'PUT':
        await realApiConsumer.put(request.path, body: request.body);
        break;
      case 'DELETE':
        await realApiConsumer.delete(request.path);
        break;
      default:
        if (!kReleaseMode) {
          throw Exception("Unknown method \${request.method}");
        }
    }
  }
}

''';

String _themeServiceCode(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';




class AppTheme {




 // 🌓 الوضع الفاتح
 static ThemeData get lightTheme {
   return ThemeData(
     brightness: Brightness.light,
     primaryColor:  AppColor.primaryColor,
     scaffoldBackgroundColor:  AppColor.backgroundColor,
     fontFamily: 'Nunito',
     colorScheme: ColorScheme(
       primary: AppColor.primaryColor, // اللون الثاني
       secondary: Colors.green, // اللون الثانوي الثاني
       surface: Colors.white, // خلفية التطبيقات
       error: Colors.red, // اللون الخاص بالأخطاء
       onPrimary: Colors.white, // اللون عند استخدام الـ primary
       onSecondary: Colors.black, // اللون عند استخدام الـ secondary
       onSurface: AppColor.grayColor, // اللون عند استخدام الـ background
       onError: Colors.white, // اللون عند استخدام الـ error
       brightness: Brightness.light, // مستوى السطوع (فاتح أو غامق)
     ),
     appBarTheme: const AppBarTheme(
       elevation: 0,
       centerTitle: true,
       backgroundColor: Colors.white,
       iconTheme: IconThemeData(color: Colors.black),
       titleTextStyle: TextStyle(
         color: Colors.black,
         fontSize: 18,
         fontWeight: FontWeight.bold,
       ),
     ),
     textTheme: TextTheme(
       displayLarge: textStyle(24.sp, FontWeight.bold, AppColor.black),
       displayMedium: textStyle(20.sp, FontWeight.bold, AppColor.black),
       displaySmall: textStyle(18.sp, FontWeight.w600, AppColor.black),
       headlineMedium: textStyle(16.sp, FontWeight.bold, AppColor.black),
       bodyLarge: textStyle(14.sp, FontWeight.normal, AppColor.black),
       bodyMedium: textStyle(12.sp, FontWeight.normal, AppColor.black),
     ),


     cardColor: AppColor.primaryColor,
     buttonTheme: ButtonThemeData(
       buttonColor: AppColor.backgroundColor,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
       ),
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         foregroundColor: Colors.white,
         backgroundColor: AppColor.primaryColor,
         textStyle: textStyle(16, FontWeight.bold, Colors.white),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8),
         ),
       ),
     ),
     iconTheme: const IconThemeData(color: Colors.black),
   );
 }


 // 🌙 الوضع الداكن
 static ThemeData get darkTheme {
   return ThemeData(
     brightness: Brightness.dark,
     primaryColor: AppColor.primaryColor,
     scaffoldBackgroundColor: AppColor.backgroundColor,
     fontFamily: 'Nunito',
     appBarTheme: const AppBarTheme(
       elevation: 0,
       centerTitle: true,
       backgroundColor: Colors.black,
       iconTheme: IconThemeData(color: Colors.white),
       titleTextStyle: TextStyle(
         color: Colors.white,
         fontSize: 18,
         fontWeight: FontWeight.bold,
       ),
     ),
     textTheme: TextTheme(
       displayLarge: textStyle(24.sp, FontWeight.bold, Colors.white),
       displayMedium: textStyle(20.sp, FontWeight.bold, Colors.white),
       displaySmall: textStyle(18.sp, FontWeight.w600, Colors.white),
       headlineMedium: textStyle(16.sp, FontWeight.bold, Colors.white),
       bodyLarge: textStyle(14.sp, FontWeight.normal, Colors.white),
       bodyMedium: textStyle(12.sp, FontWeight.normal, Colors.grey),
     ),
     cardColor: Colors.grey[900],
     buttonTheme: ButtonThemeData(
       buttonColor: AppColor.primaryColor,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
       ),
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         foregroundColor: Colors.white,
         backgroundColor: AppColor.primaryColor,
         textStyle: textStyle(16, FontWeight.bold, Colors.white),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8),
         ),
       ),
     ),
     iconTheme: const IconThemeData(color: Colors.white),
   );
 }


 // 🎨 دالة لإنشاء TextStyle بسهولة
 static TextStyle textStyle(double size, FontWeight weight, Color color) {
   return TextStyle(
     fontSize: size,
     fontWeight: weight,
     color: color,
   );
 }
}


''';

String _navigationExtCode(String projectName) => '''
//! NAVIGATION EXTENSION
import 'package:flutter/material.dart';


extension NavigationExtensions on BuildContext {
 // Push a new page onto the stack
 void push(Widget page) =>
     Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));


 // Push a named route onto the stack
 Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
     Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);


 // Replace the current route with a new one
 Future<T?> pushReplacement<T, TO>(Widget page) => Navigator.of(
   this,
 ).pushReplacement(MaterialPageRoute(builder: (_) => page));


 // Replace the current route with a named route
 Future<T?> pushReplacementNamed<T, TO>(
   String routeName, {
   Object? arguments,
 }) => Navigator.of(
   this,
 ).pushReplacementNamed<T, TO>(routeName, arguments: arguments);


 // Pop the current route off the stack
 void back() => Navigator.of(this).pop();


 // Pop until the predicate returns true
 void popUntil(RoutePredicate predicate) =>
     Navigator.of(this).popUntil(predicate);


 // Pop the current route and push a new route
 Future<T?> popAndPushNamed<T, TO>(String routeName, {Object? arguments}) =>
     Navigator.of(
       this,
     ).popAndPushNamed<T, TO>(routeName, arguments: arguments);


 // Push a new route and remove all previous routes
 Future<T?> pushAndRemoveUntil<T>(Widget page, RoutePredicate predicate) =>
     Navigator.of(
       this,
     ).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), predicate);


 // Push a named route and remove all previous routes
 Future<T?> pushNamedAndRemoveUntil<T>(
   String routeName, {
   Object? arguments,
 }) => Navigator.of(this).pushNamedAndRemoveUntil<T>(
   routeName,
    (route) => false,
   arguments: arguments,
 );


 // Try to pop the route; returns true if successful, otherwise false
 Future<bool> maybePop() => Navigator.of(this).maybePop();


 // Replace the current route with a new route using a custom route
 Future<T?> replaceWithCustomRoute<T, TO>(Route<T> route) =>
     Navigator.of(this).pushReplacement(route);


 // Push a custom route onto the stack
 Future<T?> pushCustomRoute<T>(Route<T> route) =>
     Navigator.of(this).push(route);
}


''';

String _sizedBoxExtCode(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(height: height.h);
SizedBox horizontalSpace(double width) => SizedBox(width: width.w);
double get screenWidth => 1.sw;
double get screenHeight => 1.sh;

''';

String _loginRepository(String projectName) => '''
// import 'package:dartz/dartz.dart';
// import 'package:$projectName/core/business_layer/bloc/login/login_bloc.dart';
// import 'package:$projectName/core/data_layer/errors/failures.dart';
// import 'package:$projectName/core/data_layer/models/appuser/appuser_model.dart';
// import 'package:$projectName/core/data_layer/network/queue_consumer.dart';
// import 'package:$projectName/core/data_layer/repository/base/base_repository.dart';
//
// class LoginRepository extends BaseRepository {
//   final QueueApiConsumer apiConsumer;
//
//   LoginRepository({required this.apiConsumer});
//
//   Future<Either<Failure, AppUserModel>> userLogin(UserLoginEvent event) {
//     return guardApiCall(() async {
//       final response = await apiConsumer.post('AppUser/login', body: {
//         "companyCode": event.companyId,
//         "paswword": event.password,
//         "userName": event.username,
//         "token": event.token
//       });
//       return AppUserModel.fromJson(response);
//     });
//   }
// }
 ''';

String _baseRepositoryCode(String projectName) => '''
import 'package:dartz/dartz.dart';
import 'package:$projectName/core/data_layer/errors/exceptions.dart';
import 'package:$projectName/core/data_layer/errors/failures.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> guardApiCall<T>(
      Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error : \$e - \${e.runtimeType}'));
    }
  }
}
''';

String _generalMethodsCode(String projectName) => '''
import 'package:$projectName/core/general_layer/utils/app_logger_utility.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:platform_device_id_plus/platform_device_id.dart';

class GeneralMethods {
  static const platform = MethodChannel('packageName/channelName');

  Future<void> invokeNative(
    String method, {
    Map<String, dynamic>? arguments,
  }) async {
    try {
      await platform.invokeMethod(method, arguments);
    } catch (e) {
      systemLogError('Error invoking native method \$method: ', e);
    }
  }

  void systemLogWarning(String message) {
    Logger.yellow.log('📙 [$projectName] [Warning] \$message');
  }

  void systemLogInfo(String message) {
    Logger.green.log('📗 [$projectName] [INFO] \$message');
  }

  void systemLogError(String context, Object e) {
    Logger.red.log('📕 [$projectName] [ERROR] [\$context]: \$e');
  }

  void systemLogAction(String context, Object e) {
    Logger.blue.log('📘 [$projectName] [Action] [\$context]: \$e');
  }


 String formatPosition(Position position) {
 return \'''
 Lat: \${position.latitude}
 Long: \${position.longitude}
 Accuracy: \${position.accuracy}m
 Speed: \${position.speed} m/s
 Bearing: \${position.heading}°
 Timestamp: \${position.timestamp}
 \''';
   }

  Future<String?> getAndroidId() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    return deviceId;
  }
}
''';

String _themeExtCode(String projectName) => '''
//! THEME EXTENSION
import 'package:flutter/material.dart';


extension ThemeExtensions on BuildContext {
 //! Recommended to use: ThemeData get theme => Theme.of(this);
 ThemeData get theme => Theme.of(this);


 // Existing extensions
 IconThemeData get iconTheme => Theme.of(this).iconTheme;


 TextTheme get textTheme => Theme.of(this).textTheme;


 AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;


 InputDecorationTheme get inputDecorationTheme =>
     Theme.of(this).inputDecorationTheme;


 CheckboxThemeData get checkboxTheme => Theme.of(this).checkboxTheme;


 ElevatedButtonThemeData get elevatedButtonTheme =>
     Theme.of(this).elevatedButtonTheme;


 OutlinedButtonThemeData get outlinedButtonTheme =>
     Theme.of(this).outlinedButtonTheme;


 TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;


 CardThemeData get cardTheme => Theme.of(this).cardTheme;


 DialogThemeData get dialogTheme => Theme.of(this).dialogTheme;


 FloatingActionButtonThemeData get floatingActionButtonTheme =>
     Theme.of(this).floatingActionButtonTheme;


 BottomNavigationBarThemeData get bottomNavigationBarTheme =>
     Theme.of(this).bottomNavigationBarTheme;


 NavigationRailThemeData get navigationRailTheme =>
     Theme.of(this).navigationRailTheme;


 SliderThemeData get sliderTheme => Theme.of(this).sliderTheme;


 TabBarThemeData get tabBarTheme => Theme.of(this).tabBarTheme;


 TooltipThemeData get tooltipTheme => Theme.of(this).tooltipTheme;


 PopupMenuThemeData get popupMenuTheme => Theme.of(this).popupMenuTheme;


 MaterialBannerThemeData get bannerTheme => Theme.of(this).bannerTheme;


 DividerThemeData get dividerTheme => Theme.of(this).dividerTheme;


 BottomSheetThemeData get bottomSheetTheme => Theme.of(this).bottomSheetTheme;


 TimePickerThemeData get timePickerTheme => Theme.of(this).timePickerTheme;


 ThemeData get darkTheme => ThemeData.dark();


 ThemeData get lightTheme => ThemeData.light();


 // Additional extensions
 ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;


 ChipThemeData get chipTheme => Theme.of(this).chipTheme;


 DataTableThemeData get dataTableTheme => Theme.of(this).dataTableTheme;


 DrawerThemeData get drawerTheme => Theme.of(this).drawerTheme;


 ExpansionTileThemeData get expansionTileTheme =>
     Theme.of(this).expansionTileTheme;


 ListTileThemeData get listTileTheme => Theme.of(this).listTileTheme;


 MenuThemeData get menuTheme => Theme.of(this).menuTheme;


 NavigationBarThemeData get navigationBarTheme =>
     Theme.of(this).navigationBarTheme;


 PageTransitionsTheme get pageTransitionsTheme =>
     Theme.of(this).pageTransitionsTheme;


 ProgressIndicatorThemeData get progressIndicatorTheme =>
     Theme.of(this).progressIndicatorTheme;


 RadioThemeData get radioTheme => Theme.of(this).radioTheme;


 ScrollbarThemeData get scrollbarTheme => Theme.of(this).scrollbarTheme;


 SwitchThemeData get switchTheme => Theme.of(this).switchTheme;


 TextSelectionThemeData get textSelectionTheme =>
     Theme.of(this).textSelectionTheme;


 BottomAppBarTheme get bottomAppBarTheme => Theme.of(this).bottomAppBarTheme;


 MaterialTapTargetSize get materialTapTargetSize =>
     Theme.of(this).materialTapTargetSize;


 Typography get typography => Theme.of(this).typography;


 VisualDensity get visualDensity => Theme.of(this).visualDensity;


 IconButtonThemeData get iconButtonTheme => Theme.of(this).iconButtonTheme;


ColorScheme get colorScheme => Theme.of(this).colorScheme;
}


''';

String _splashScreenCode(projectName) => '''
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/core/general_layer/extensions/navigation_extensions.dart';
import 'package:$projectName/core/general_layer/routing/app_routes_list.dart';
import 'package:$projectName/generated/assets.dart';
import 'package:rs_seek/rs_seek.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initDiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // You are going to need to add the image to your assets
              // Then generate the assets in a folder named generated
              RsAspectRatio(
                  landscapeRatio: 2.0,
                  portraitRatio: 1.0,
                  child: Image.asset(Assets.imagesLogo)),
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.3,
                  child: LinearProgressIndicator(
                      minHeight: 15,
                      backgroundColor: AC.xOffWhite,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AC.xOrangeColor),
                      borderRadius: BorderRadius.circular(25)))
            ])));
  }

  Future<void> initDiService() async {
    await Future.delayed(Duration(milliseconds: 700));
    if (mounted) context.pushReplacementNamed(Routes.initializerScreen);
  }
}
''';

String _appInitializerCode(String projectName) => '''

import 'package:after_layout/after_layout.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/core/general_layer/extensions/navigation_extensions.dart';
import 'package:$projectName/core/general_layer/methods/general_methods.dart';
import 'package:$projectName/core/general_layer/routing/app_routes_list.dart';
import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer>
    with AfterLayoutMixin<AppInitializer> {
  late final AppPreferences _appPrefs;
  late final GeneralMethods _gmd;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final userInfo = _appPrefs.getData('user_info');
    await Future.delayed(const Duration(milliseconds: 200));

    if (userInfo != null) {
      _navigateToNextScreen();
    } else {
     _navigateToNextScreen();
  }
  }

  Future<void> _initializeApp() async {
    _appPrefs = GetIt.instance<AppPreferences>();
    _gmd = GetIt.instance<GeneralMethods>();
    // you can uncomment the next lines if you want to fetch device ID
    // await Future.wait([
    //   getDeviceId(),
    // ]);
  }


  void _navigateToNextScreen() async {
    final userInfo = _appPrefs.getData('user_info');

    if (userInfo != null) {
      if (!mounted) return;
      context.pushReplacementNamed(Routes.notificationInboxScreen);
    } else {
      if (!mounted) return;
      context.pushReplacementNamed(Routes.initializerScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: LinearProgressIndicator(
                    minHeight: 15,
                    backgroundColor: AC.xOffWhite,
                    valueColor: AlwaysStoppedAnimation<Color>(AC.xOrangeColor),
                    borderRadius: BorderRadius.circular(25)))));
  }

  Future<void> getDeviceId() async {
    final id = await _gmd.getAndroidId();
    _gmd.systemLogInfo('[Device ID] \$id');
    AC.deviceId = id ?? 'no device id';
  }
}

''';

String _localeCubitCode(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';


part 'locale_state.dart';


class LocaleCubit extends Cubit<LocaleState> {
 LocaleCubit() : super(LocaleState(_getInitialLocale()));


 static Locale _getInitialLocale() {
   final savedLocale = AppPreferences().getData(AC.localeKey);
   return savedLocale == 'ar' ? const Locale('ar') : const Locale('en');
 }


 Future<void> changeLocale(Locale newLocale) async {
   await AppPreferences().setData(AC.localeKey, newLocale.languageCode);
   emit(LocaleState(newLocale));
 }
}


''';

String _loginEventCode(String projectName) => '''
part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends LoginEvent {
  final String username;
  final String password;

  const UserLoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
''';

String _loginBlocCode(String projectName) => '''
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UserLoginEvent>(userLogin);
  }

  Future<void> userLogin(UserLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 2));
    if (event.username == 'Admin'.toLowerCase() && event.password == '123') {
      emit(LoginSuccessful('Login has been successful'));
    } else {
      emit(LoginError('Wrong credentials'));
    }
  }
}
''';

String _loginStateCode(String projectName) => '''
part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccessful extends LoginState {
  final String msg;

  LoginSuccessful(this.msg);
}

final class LoginError extends LoginState {
  final String errorMsg;

  LoginError(this.errorMsg);
}
''';

String _themeCubitCode(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';


part 'theme_state.dart';


class ThemeCubit extends Cubit<ThemeState> {
 ThemeCubit() : super(ThemeState(_getInitialTheme()));


 static ThemeMode _getInitialTheme() {
   final savedTheme = AppPreferences().getData(AC.themeKey);
   if (savedTheme == 'dark') return ThemeMode.dark;
   if (savedTheme == 'light') return ThemeMode.light;
   return ThemeMode.system;
 }


 Future<void> changeTheme(ThemeMode newTheme) async {
   await AppPreferences().setData(AC.themeKey, newTheme.name);
   emit(ThemeState(newTheme));
 }
}
''';

String _appRouterCode(String projectName) => '''
import 'package:$projectName/core/general_layer/routing/app_routes_list.dart';
import 'package:$projectName/features/home/presentation/screens/notification_screen.dart';
import 'package:$projectName/features/splash/presentation/screens/initializer_screen.dart';
import 'package:$projectName/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialScreen:
      case Routes.splashScreen:
        return _createRoute(const SplashScreen());
      case Routes.initializerScreen:
        return _createRoute(AppInitializer());
      case Routes.notificationInboxScreen:
        return _createRoute(const NotificationInboxScreen());
      default:
        return _createRoute(const SplashScreen());
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

''';

String _routesCode(String projectName) => '''
class Routes {
  static const String initialScreen = '/';
  static const String splashScreen = '/splashScreen';
  static const String initializerScreen = '/initializerScreen';
  static const String notificationInboxScreen = '/notificationInboxScreen';

  static bool isValidRoute(String route) {
    const validRoutes = [
      '/',
      '/splashScreen',
      '/initializerScreen',
      '/notificationInboxScreen'
    ];
    return validRoutes.contains(route);
  }
}
''';

String _appThemeCode(String projectName) => '''
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        fontFamily: 'Nunito',
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: AC.xMainColor,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Nunito',
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.white),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.white),
        ),
      );
}

''';

String _appColorsCode(String projectName) => '''
import 'package:flutter/material.dart';


class AppColor {
 static const Color primaryColor = Color(0xff1F21A8);
 static const Color backgroundColor = Color(0xffF8FBFC);
 static const Color grayColor = Colors.grey;
 static const Color white = Colors.white;
 static const Color black = Colors.black;
}
''';

String _genCode(String projectName) => '''
// import 'package:clean_gen_tool/clean_gen_tool_plus.dart';
//
// void main() async {
//   await CleanGenToolPlus.generate();
// }
 ''';

String _assetsFolderCode(String projectName) => '''
class Assets {
  Assets._();

  static const String cardealership = '.env';
  static const String langAr = 'assets/lang/ar.json';
  static const String langEn = 'assets/lang/en.json';
  static const String imagesLogo = 'path/to/your/logo.png';
}

''';

String _mainCode(String projectName) => '''
import 'package:easy_localization/easy_localization.dart';
import 'package:$projectName/core/business_layer/bloc/login/login_bloc.dart';
import 'package:$projectName/core/business_layer/cubit/locale/locale_cubit.dart';
import 'package:$projectName/core/business_layer/cubit/theme/theme_cubit.dart';
import 'package:$projectName/core/general_layer/widgets/app_error_widget.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/core/data_layer/di_service_layer.dart';
import 'package:$projectName/core/general_layer/routing/app_router_settings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  ErrorWidget.builder = (errorDetails) =>
  AppErrorWidget(message: errorDetails.exception.toString());
  
  await ServiceLocator.setup().then((value) => runApp(_buildApp()));
}

Widget _buildApp() {
  return EasyLocalization(
      supportedLocales: AC.supportedLocales,
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (_) => LocaleCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LoginBloc()),
      ], child: MyApp(appRouter:  AppRouter())));
}
''';

String _appCode(String projectName) => '''
import 'package:easy_localization/easy_localization.dart';
import 'package:$projectName/core/business_layer/cubit/theme/theme_cubit.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/core/general_layer/routing/app_router_settings.dart';
import 'package:$projectName/core/general_layer/utils/app_offline_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:$projectName/core/general_layer/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (BuildContext context, ThemeState themeState) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: AC.navigatorKey,
          title: AC.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState.themeMode,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: '/',
          builder: (context, child) => AppOfflineBuilder(child: child),
        ),
      ),
    );
  }
}
''';

String _blocObserverCode(String projectName) => '''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:$projectName/core/general_layer/methods/general_methods.dart';


class AppBlocObserver extends BlocObserver {
  final GeneralMethods gmd = GeneralMethods();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    gmd.systemLogAction('🔍 Bloc Created: ', bloc.runtimeType);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    gmd.systemLogAction('🔁 Bloc Change in ', '\${bloc.runtimeType}: \$change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    gmd.systemLogError('❌ Bloc Error in \${bloc.runtimeType}: ', error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    gmd.systemLogAction('🛑 Bloc Closed: ', '\${bloc.runtimeType}');
    super.onClose(bloc);
  }
}

''';

String _notificationScreen(String projectName) => '''
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/core/general_layer/extensions/navigation_extensions.dart';
import 'package:$projectName/core/general_layer/methods/general_methods.dart';
import 'package:$projectName/core/general_layer/routing/app_routes_list.dart';
import 'package:$projectName/core/general_layer/utils/app_notification_storage.dart';
import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:rs_seek/rs_seek.dart';

class NotificationInboxScreen extends StatefulWidget {
  const NotificationInboxScreen({super.key});

  @override
  State<NotificationInboxScreen> createState() =>
      _NotificationInboxScreenState();
}

class _NotificationInboxScreenState extends State<NotificationInboxScreen> {
  final notificationStore = GetIt.I<NotificationStore>();
  final gmd = GetIt.I<GeneralMethods>();
  final appPrefs = GetIt.instance<AppPreferences>();

  String formatTimestamp(String? timestamp) {
    if (timestamp == null) return '';
    try {
      final dateTime = DateTime.parse(timestamp);
      return DateFormat('yyyy-MM-dd • hh:mm a').format(dateTime);
    } catch (e) {
      gmd.systemLogError('Something is wrong', e);
      return 'Invalid date';
    }
  }

  @override
  void initState() {
    super.initState();
    notificationStore.addListener(_onNotificationsUpdated);
    notificationStore.loadNotifications().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    notificationStore.removeListener(_onNotificationsUpdated);
    super.dispose();
  }

  void _onNotificationsUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final notifications = notificationStore.notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Inbox"),
        leading: IconButton(
          icon: const Icon(Icons.admin_panel_settings),
          onLongPress: () {
            appPrefs.removeData('user_info');
            appPrefs.removeData('notifications');
            context.pushReplacementNamed(Routes.splashScreen);
          },
          onPressed: () {},
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: RsTypography.headline(context), color: Colors.white),
        backgroundColor: AC.xMainColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                "No notifications available",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(4),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final message = notifications[index];

                final timestamp = message['timestamp'];
                final command = message['command'] ?? 'unknown';
                final title = message['title'] ?? 'unknown';
                final body = message['body'] ?? 'unknown';
                final screen = message['screen'] ?? 'unknown';

                return Card(
                  color: AC.xMainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            color: AC.xWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          body,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AC.xWhite,
                          ),
                        ),
                        if (screen != null) ...[
                          Row(
                            children: [
                              const Icon(
                                Icons.link,
                                size: 16,
                                color: AC.xWhite,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Route: \$screen',
                                style:
                                    TextStyle(color: AC.xWhite, fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(command, style: buildTextStyle()),
                            Text(formatTimestamp(timestamp),
                                style: buildTextStyle()),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 4);
              },
            ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(
        color: AC.xWhite,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
}

 ''';

String _loginScreenCode(String projectName) => '''
import 'package:$projectName/core/business_layer/bloc/login/login_bloc.dart';
import 'package:$projectName/core/general_layer/extensions/navigation_extensions.dart';
import 'package:$projectName/core/general_layer/routing/app_routes_list.dart';
import 'package:$projectName/core/general_layer/utils/app_validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (ctx, state) {
          if (state is LoginError) {
            _showDialog(ctx, 'Error', state.errorMsg);
          } else if (state is LoginSuccessful) {
           ctx.pushReplacementNamed(Routes.notificationInboxScreen);
            _showDialog(ctx, 'Success', state.msg);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formState,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: usernameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your username' : null,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (!AppUtils.hasMinLength(value)) {
                        return 'At least 3 character';
                      } else if (!AppUtils.hasLowerCase(value)) {
                        return 'Must have a lowercase character';
                      } else if (!AppUtils.hasUpperCase(value)) {
                        return 'Must have an Uppercase character';
                      } else if (!AppUtils.hasNumber(value)) {
                        return 'Must have a number';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      final ctx = context.read<LoginBloc>();
                      final isLoading = state is LoginLoading;
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  final username = usernameController.text;
                                  final password = passwordController.text;
                                  if (formState.currentState!.validate()) {
                                    ctx.add(UserLoginEvent(
                                        username.toLowerCase(), password));
                                  }
                                },
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white))
                              : const Text('Login'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(
      BuildContext context, String title, String msg) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
''';

String _themeStateCode(String projectName) => '''
part of 'theme_cubit.dart';


class ThemeState {
 final ThemeMode themeMode;


 const ThemeState(this.themeMode);


 @override
 bool operator ==(Object other) {
   if (identical(this, other)) return true;
   return other is ThemeState && other.themeMode == themeMode;
 }


 @override
 int get hashCode => themeMode.hashCode;
}
''';

String _localeStateCode(String projectName) => '''
part of 'locale_cubit.dart';


class LocaleState {
 final Locale locale;


 const LocaleState(this.locale);


 @override
 bool operator ==(Object other) {
   if (identical(this, other)) return true;
   return other is LocaleState && other.locale == locale;
 }


 @override
 int get hashCode => locale.hashCode;
}
''';
