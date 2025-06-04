import 'dart:io';

import 'package:path/path.dart';

class CleanGenTool {
  static Future<void> generate() async {
    final projectDir = Directory.current;
    final projectName = basename(projectDir.path);
    final libDir = Directory(join(projectDir.path, 'lib'));

    await _generateReadme(projectDir, projectName); //done
    await _generateDotEnv(projectDir, projectName); //done
    await _generateAssetsFolders(projectDir); //done
    await _generatePubspecYaml(projectDir, projectName); //done
    await _generateLocalizationFiles(projectDir); //done
    await _generateMainApp(libDir, projectName); //done
    await _generateFeatures(libDir, projectName); //done
    await _generateCore(libDir, projectName); //done

    print(
        '\nFlutter project is fully ready with Clean Architecture by Mohammad AD - GenTool');
  }
}

Future<void> _generateDotEnv(Directory projectDir, String projectName) async {
  final readmeFile = File(join(projectDir.path, '.env'));
  await readmeFile.writeAsString('''
   //Make sure to add your API keys and other environment variables here.

   API_KEY=https://url:port/api/
   API_IMAGES_KEY=https://url:port/assets/images/
   API_KEY_FB_ANDROID=API_KEY_FB_ANDROID
   API_KEY_FB_IOS=API_KEY_FB_IOS

   //Mohammad AD 
''');
}

Future<void> _generateAssetsFolders(Directory projectDir) async {
  final assetDirs = [
    'assets/images',
    'assets/icons',
    'assets/lottie',
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


# How To Use

First add the package to your pubspec.yaml:
```yaml
dependencies:
  clean_gen_tool: ^1.0.1
```
Or run the following command in your terminal:
With Dart:
```bash
  dart pub add clean_gen_tool
```
With Flutter:
```bash
  flutter pub add clean_gen_tool
```
Import it
```bash
  import 'package:clean_gen_tool/clean_gen_tool.dart';
```
Create a new file named `gen_tool.dart` in the `lib` directory of your Flutter project.
and add the following code to it:
```dart
import 'package:clean_gen_tool/clean_gen_tool.dart';

 void main() async {
   await CleanGenTool.generate();
 }
```
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
    * constants / routing / theme / env settings / offline builder / shared preference

The project is built following the Clean Architecture principles, broken down into three main
layers:

* business_layer – Manages state using Cubits (Bloc)
* data_layer – Handles models, networking, and repositories
* general_layer – Contains constants, services, utilities, routing, and more

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

Built with ❤️
Special thanks to Abdullah Essam for the inspiration and guidance.

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
    'data_layer/network': {
      'api_consumer.dart': _apiConsumerCode(projectName), // done
      'dio_consumer.dart': _dioConsumerCode(projectName), // done
      'interceptors.dart': _interceptorsCode(projectName), // done
      'status_code.dart': _statusCodeCode(projectName), // done
    },
    'data_layer/errors': {
      'exceptions.dart': _exceptionsCode(projectName), // done
      'failures.dart': _failuresCode(projectName), // done
    },
    'general_layer/utils': {
      'app_validation_utils.dart': _appUtilsCode(projectName), // done
      'app_shared_preferences.dart': _appPrefsCode(projectName), // done
      'app_offline_builder.dart': _appOfflineBuilderCode(projectName), // done
      'app_env_settings.dart': _appEnvSettingsCode(projectName), // done
    },
    'general_layer/services': {
      'locale_service.dart': _localeServiceCode(projectName), // done
      'theme_service.dart': _themeServiceCode(projectName), // done
    },
    'general_layer/routing': {
      'app_router.dart': _appRouterCode(projectName), //done
      'routes.dart': _routesCode(projectName), //done
    },
    'general_layer/theme': {
      'app_theme.dart': _appThemeCode(projectName), //done
      'app_colors.dart': _appColorsCode(projectName), //done
    },
    'business_layer/bloc/login': {
      'login_bloc.dart': _loginBlocCode(projectName), //done
      'login_event.dart': _loginEventCode(projectName), //done
      'login_state.dart': _loginStateCode(projectName), //done
    },
    'business_layer/cubit/category': {
      'category_cubit.dart': _categoryCubitCode(projectName), //done
      'category_state.dart': _categoryStateCode(projectName), //done
    },
    'business_layer/cubit/locale': {
      'locale_cubit.dart': _localeCubitCode(projectName), //done
      'locale_state.dart': _localeStateCode(projectName), //done
    },
    'business_layer/cubit/login': {
      'login_cubit.dart': _loginCubitCode(projectName), //done
      'login_state.dart': _loginStateCode(projectName), //done
    },
    'business_layer/cubit/theme': {
      'theme_cubit.dart': _themeCubitCode(projectName), //done
      'theme_state.dart': _themeStateCode(projectName), //done
    },
    'data_layer/models/category': {
      'category_model.dart': _categoryModelCode(projectName), //done
    }, //done
    'data_layer/repository/base': {
      'base_repository.dart': _baseRepositoryCode(projectName), //done
    },
    'data_layer/repository/category': {
      'category_repository.dart': _categoryRepositoryCode(projectName), //done
    },
    'general_layer/extensions': {
      'navigation_extensions.dart': _navigationExtCode(projectName), //done
      'sizedbox_extensions.dart': _sizedBoxExtCode(projectName), //done
      'theme_extensions.dart': _themeExtCode(projectName), //done
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
  final onboardingDir = Directory(
    join(featuresDir.path, 'onboarding/presentation/screens'),
  );
  final loginDir = Directory(
    join(featuresDir.path, 'login/presentation/screens'),
  );

  await splashDir.create(recursive: true);
  await onboardingDir.create(recursive: true);
  await loginDir.create(recursive: true);

  await File(
    join(splashDir.path, 'splash_screen.dart'),
  ).writeAsString(_splashScreenCode(projectName)); //done

  await File(
    join(onboardingDir.path, 'onboarding_screen.dart'),
  ).writeAsString(_onboardingScreenCode(projectName));

  await File(
    join(loginDir.path, 'login_screen.dart'),
  ).writeAsString(_loginScreenCode(projectName));
}

Future<void> _generateMainApp(Directory libDir, String projectName) async {
  await File(join(libDir.path, 'main.dart'))
      .writeAsString(_mainCode(projectName));
  await File(join(libDir.path, 'gen_tool.dart'))
      .writeAsString(_genCode(projectName));
  await File(join(libDir.path, 'app.dart'))
      .writeAsString(_appCode(projectName));
  await File(
    join(libDir.path, 'app_bloc_observer.dart'),
  ).writeAsString(_blocObserverCode(projectName));
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
  equatable:
  get_it:
  cached_network_image:
  flutter_screenutil:
  flutter_animate:
  freezed_annotation:
  json_annotation:
  flutter_native_splash:
  animate_do:
  lottie:
  google_fonts:
  flutter_launcher_icons:
  animator:
  dartz:
  flutter_svg:
  cupertino_icons:
  flutter_offline: ^5.0.0
  flutter_dotenv: ^5.2.1
  pretty_dio_logger:
  path:

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner:
  freezed:
  json_serializable:
  bloc_test:
  mockito:
  flutter_lints:

flutter:
  uses-material-design: true
  generate: true
  assets:
    - assets/images/
    - assets/icons/
    - assets/lottie/
    - assets/lang/
    - .env
''';

  final file = File(join(projectDir.path, 'pubspec.yaml'));
  await file.writeAsString(pubspecContent);

  print(
      'Pubspec.yaml generated successfully with Flutter version $flutterVersion');
}

// ============================ الأكواد ============================

String _appConstantsCode(String projectName) => '''
import 'package:flutter/material.dart';

class AC {
  static const String appName = 'My App';
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
}
''';

String _endpointConstantsCode(String projectName) => '''
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EC {
  static final String baseUrl = dotenv.env['API_KEY']!;
  static final String baseImageUrl = dotenv.env['API_IMAGES_KEY']!;
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
import 'package:dio/dio.dart';
import 'package:$projectName/core/data_layer/errors/exceptions.dart';
import 'package:$projectName/core/data_layer/network/status_code.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_consumer.dart';
import 'interceptors.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = dotenv.env['API_KEY']!
      ..responseType = ResponseType.json
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);

    client.interceptors.addAll(AppInterceptors.getInterceptors());
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> put(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.put(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> delete(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.delete(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  void _handleDioError(DioException error) {
    final int statusCode =
        error.response?.statusCode ?? StatusCode.internalServerError;
    final String message = error.response?.data?['message'] ?? error.message;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const ServerException('Connection Timeout');

      case DioExceptionType.cancel:
        throw const ServerException('Request Cancelled');

      case DioExceptionType.badResponse:
        switch (statusCode) {
          case StatusCode.badRequest:
            throw ServerException('Bad Request: message', statusCode);
          case StatusCode.unauthorized:
            throw ServerException('Unauthorized: message', statusCode);
          case StatusCode.forbidden:
            throw ServerException('Forbidden: message', statusCode);
          case StatusCode.notFound:
            throw ServerException('Not Found: message', statusCode);
          case StatusCode.conflict:
            throw ServerException('Conflict: message', statusCode);
          case StatusCode.internalServerError:
            throw ServerException(
                'Internal Server Error: message', statusCode);
          default:
            throw ServerException('Unexpected Error: message', statusCode);
        }

      case DioExceptionType.unknown:
      default:
        throw ServerException('Unknown Error: message', statusCode);
    }
  }
}
''';

String _interceptorsCode(String projectName) => '''
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppInterceptors {
  static List<Interceptor> getInterceptors() {
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
        maxWidth: 120,
      ),
    ];
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
  const ServerException(
      [super.message = 'Server Error', super.statusCode = 500]);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache Error', super.statusCode = 500]);
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

String _appUtilsCode(String projectName) => '''
class AppUtils {
 static bool isEmailValid(String email) {
   return RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(email);
 }


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
   return RegExp(r'^(?=.{8,})').hasMatch(password);
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
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'No Internet Connection',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
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

String _appEnvSettingsCode(String projectName) => '''
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    return kReleaseMode ? '.env' : '.env';
  }

  static Future<void> load() async {
    try {
      await dotenv.load(fileName: fileName);
    } catch (e) {
      throw Exception('Failed to load and encrypt environment variables: e');
    }
  }
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
      return Left(ServerFailure('Unexpected Error'));
    }
  }
}
''';

String _categoryModelCode(String projectName) => '''
class MainService {
  List<MainServiceData>? data;
  String? message;
  bool? isSuccess;

  MainService({this.data, this.message, this.isSuccess});

  MainService.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MainServiceData>[];
      json['data'].forEach((v) {
        data!.add(MainServiceData.fromJson(v));
      });
    }
    message = json['message'];
    isSuccess = json['isSucess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['isSucess'] = isSuccess;
    return data;
  }
}

class MainServiceData {
  String? descAr;
  String? descOt;
  String? icon;
  int? activeForUserAdd;
  int? activeForAppDisplay;
  int? sortOrder;
  List<MainSubServiceMappings>? mainSubServiceMappings;
  String? id;
  String? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;

  MainServiceData(
      {this.descAr,
      this.descOt,
      this.icon,
      this.activeForUserAdd,
      this.activeForAppDisplay,
      this.sortOrder,
      this.mainSubServiceMappings,
      this.id,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate});

  MainServiceData.fromJson(Map<String, dynamic> json) {
    descAr = json['descAr'];
    descOt = json['descOt'];
    icon = json['icon'];
    activeForUserAdd = json['activeForUserAdd'];
    activeForAppDisplay = json['activeForAppDisplay'];
    sortOrder = json['sortOrder'];
    if (json['mainSubServiceMappings'] != null) {
      mainSubServiceMappings = <MainSubServiceMappings>[];
      json['mainSubServiceMappings'].forEach((v) {
        mainSubServiceMappings!.add(MainSubServiceMappings.fromJson(v));
      });
    }
    id = json['id'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['descAr'] = descAr;
    data['descOt'] = descOt;
    data['icon'] = icon;
    data['activeForUserAdd'] = activeForUserAdd;
    data['activeForAppDisplay'] = activeForAppDisplay;
    data['sortOrder'] = sortOrder;
    if (mainSubServiceMappings != null) {
      data['mainSubServiceMappings'] =
          mainSubServiceMappings!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    data['modifiedBy'] = modifiedBy;
    data['modifiedDate'] = modifiedDate;
    return data;
  }
}

class MainSubServiceMappings {
  String? mainServiceId;
  String? mainServiceName;
  String? subServiceId;
  String? subServiceName;
  String? id;
  String? createdBy;
  String? createdDate;
  Null modifiedBy;
  Null modifiedDate;

  MainSubServiceMappings(
      {this.mainServiceId,
      this.mainServiceName,
      this.subServiceId,
      this.subServiceName,
      this.id,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate});

  MainSubServiceMappings.fromJson(Map<String, dynamic> json) {
    mainServiceId = json['mainServiceId'];
    mainServiceName = json['mainServiceName'];
    subServiceId = json['subServiceId'];
    subServiceName = json['subServiceName'];
    id = json['id'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mainServiceId'] = mainServiceId;
    data['mainServiceName'] = mainServiceName;
    data['subServiceId'] = subServiceId;
    data['subServiceName'] = subServiceName;
    data['id'] = id;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    data['modifiedBy'] = modifiedBy;
    data['modifiedDate'] = modifiedDate;
    return data;
  }
}
 ''';

String _categoryRepositoryCode(String projectName) => '''
//This is just a sample repository for categories
import 'package:dartz/dartz.dart';
import 'package:$projectName/core/data_layer/errors/failures.dart';
import 'package:$projectName/core/data_layer/models/category/category_model.dart';
import 'package:$projectName/core/data_layer/network/api_consumer.dart';
import 'package:$projectName/core/data_layer/repository/base/base_repository.dart';

class CategoryRepository extends BaseRepository {
  final ApiConsumer apiConsumer;

  CategoryRepository({required this.apiConsumer});

  Future<Either<Failure, MainService>> getAllCategories() {
    return guardApiCall(() async {
      final response = await apiConsumer.get('MainService/all');
      return MainService.fromJson(response);
    });
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
import 'package:$projectName/core/general_layer/extensions/navigation_extensions.dart';
import 'package:$projectName/core/general_layer/routing/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.pushReplacementNamed(Routes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            Text('Splash Screen', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
''';

String _categoryStateCode(String projectName) => '''
part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final MainService data;

  CategoryLoaded(this.data);
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}

''';

String _categoryCubitCode(String projectName) => '''
import 'package:dartz/dartz.dart';
import 'package:$projectName/core/data_layer/errors/failures.dart';
import 'package:$projectName/core/data_layer/models/category/category_model.dart';
import 'package:$projectName/core/data_layer/repository/category/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    final Either<Failure, MainService> result =
        await categoryRepository.getAllCategories();

    result.fold(
      (failure) => emit(CategoryError(failure.message)),
      (data) => emit(CategoryLoaded(data)),
    );
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

String _loginCubitCode(String projectName) => '''
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(String username, String password) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (username == 'Admin' && password == '123') {
      emit(LoginSuccessful('Login has been successful'));
    } else {
      emit(LoginError('Wrong credentials'));
    }
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
import 'package:$projectName/core/data_layer/models/category/category_model.dart';
import 'package:$projectName/core/general_layer/routing/routes.dart' show Routes;
import 'package:$projectName/features/Login/presentation/screens/login_screen.dart';
import 'package:$projectName/features/home/presentation/screens/app_category_details_screen.dart';
import 'package:$projectName/features/home/presentation/screens/app_home_screen.dart';
import 'package:$projectName/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:$projectName/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialScreen:
      case Routes.splashScreen:
        return _createRoute(const SplashScreen());
      case Routes.onBoardingScreen:
        return _createRoute(const OnboardingScreen());
      case Routes.homeScreen:
        return _createRoute(const AppHomeScreen());
      case Routes.homeDetailsScreen:
        final item = settings.arguments as MainServiceData;
        return _createRoute(AppCategoryDetailsScreen(category: item));
      case Routes.loginScreen:
        return _createRoute(LoginScreen());

      default:
        return null;
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
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
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String homeScreen = '/homeScreen';
  static const String homeDetailsScreen = '/homeDetailsScreen';
}
''';

String _appThemeCode(String projectName) => '''
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
          iconTheme: IconThemeData(color: AppColor.white),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.white),
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
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.white),
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
// import 'package:clean_gen_tool/clean_gen_tool.dart';
//
// void main() async {
//   await CleanGenTool.generate();
// }
 ''';

String _mainCode(String projectName) => '''
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:$projectName/core/business_layer/bloc/login/login_bloc.dart';
import 'package:$projectName/core/business_layer/cubit/category/category_cubit.dart';
import 'package:$projectName/core/business_layer/cubit/locale/locale_cubit.dart';
import 'package:$projectName/core/business_layer/cubit/theme/theme_cubit.dart';
import 'package:$projectName/core/data_layer/network/dio_consumer.dart';
import 'package:$projectName/core/data_layer/repository/category/category_repository.dart';
import 'package:$projectName/core/general_layer/routing/app_router.dart';
import 'package:$projectName/core/general_layer/utils/app_env_settings.dart';
import 'package:$projectName/core/general_layer/utils/app_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_bloc_observer.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await AppPreferences().init();
  await Environment.load();

  runApp(EasyLocalization(
    supportedLocales: AC.supportedLocales,
    path: 'assets/lang',
    fallbackLocale: const Locale('en'),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(
          create: (context) {
            final dio = Dio();
            final apiConsumer = DioConsumer(client: dio);
            final categoryRepository =
                CategoryRepository(apiConsumer: apiConsumer);
            return CategoryCubit(categoryRepository);
          },
        ),
      ],
      child: MyApp(appRouter: AppRouter()),
    ),
  ));
}
''';

String _appCode(String projectName) => '''
import 'package:easy_localization/easy_localization.dart';
import 'package:$projectName/core/business_layer/cubit/theme/theme_cubit.dart';
import 'package:$projectName/core/general_layer/constants/app_constants.dart';
import 'package:$projectName/core/general_layer/routing/app_router.dart';
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


class AppBlocObserver extends BlocObserver {
 @override
 void onCreate(BlocBase bloc) {
   super.onCreate(bloc);
   print('🔍 Bloc Created: \${bloc.runtimeType}');
 }


 @override
 void onChange(BlocBase bloc, Change change) {
   super.onChange(bloc, change);
   print('🔁 Bloc Change in \${bloc.runtimeType}: \$change');
 }


 @override
 void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
   print('❌ Bloc Error in \${bloc.runtimeType}: \$error');
   super.onError(bloc, error, stackTrace);
 }


 @override
 void onClose(BlocBase bloc) {
   print('🛑 Bloc Closed: \${bloc.runtimeType}');
   super.onClose(bloc);
 }
}
''';

String _loginScreenCode(String projectName) => '''
import 'package:$projectName/core/business_layer/bloc/login/login_bloc.dart';
import 'package:$projectName/core/general_layer/extensions/navigation_extensions.dart';
import 'package:$projectName/core/general_layer/routing/routes.dart';
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
            _showDialog(ctx, 'Success', state.msg).then(
              (value) => ctx.pushReplacementNamed(Routes.homeScreen),
            );
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

String _onboardingScreenCode(String projectName) => '''
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class OnboardingScreen extends StatefulWidget {
 const OnboardingScreen({super.key});


 @override
 State<OnboardingScreen> createState() => _OnboardingScreenState();
}


class _OnboardingScreenState extends State<OnboardingScreen> {
 final controller = PageController();
 bool isLastPage = false;


 @override
 void dispose() {
   controller.dispose();
   super.dispose();
 }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
     body: Padding(
       padding: EdgeInsets.symmetric(horizontal: 24.w),
       child: Column(
         children: [
           SizedBox(height: 60.h),
           Expanded(
             child: PageView(
               controller: controller,
               onPageChanged: (index) => setState(() => isLastPage = index == 2),
               children: const [
                 OnboardPage(title: 'Welcome', description: 'This is onboarding 1'),
                 OnboardPage(title: 'Explore', description: 'This is onboarding 2'),
                 OnboardPage(title: 'Start', description: 'This is onboarding 3'),
               ],
             ),
           ),
   
           SizedBox(height: 20.h),
           SizedBox(
             width: double.infinity,
             child: ElevatedButton(
               onPressed: () {
                 if (isLastPage) {
                 } else {
                   controller.nextPage(
                     duration: const Duration(milliseconds: 500),
                     curve: Curves.easeInOut,
                   );
                 }
               },
               child: Text(isLastPage ? 'Get Started' : 'Next'),
             ),
           ),
           SizedBox(height: 40.h),
         ],
       ),
     ),
   );
 }
}


class OnboardPage extends StatelessWidget {
 final String title;
 final String description;
 const OnboardPage({super.key, required this.title, required this.description});


 @override
 Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 24.w),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Icon(Icons.flutter_dash, size: 120.r),
         SizedBox(height: 20.h),
         Text(
           title,
           style: GoogleFonts.nunito(
             fontSize: 26.sp,
             fontWeight: FontWeight.bold,
           ),
         ),
         SizedBox(height: 12.h),
         Text(
           description,
           textAlign: TextAlign.center,
           style: GoogleFonts.nunito(fontSize: 16.sp),
         ),
       ],
     ),
   );
 }
}


''';

String signupScreenCode(String projectName) => '''
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUpScreen extends StatelessWidget {
 const SignUpScreen({super.key});


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Sign Up')),
     body: Padding(
       padding: EdgeInsets.all(20.w),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           const TextField(decoration: InputDecoration(labelText: 'Name')),
           SizedBox(height: 16.h),
           const TextField(decoration: InputDecoration(labelText: 'Email')),
           SizedBox(height: 16.h),
           const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password')),
           SizedBox(height: 24.h),
           ElevatedButton(
             onPressed: () {},
             child: const Text('Create Account'),
           ),
         ],
       ),
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
