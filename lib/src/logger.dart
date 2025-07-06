/// A simple logger that prints messages to the console with color coding.
enum Logger {
  /// black Color codes for different log levels.
  black("30"),
  /// red Colors for different log levels.
  red("31"),
  /// green Colors for different log levels.
  green("32"),
  /// yellow Colors for different log levels.
  yellow("33"),
  /// blue Colors for different log levels.
  blue("34"),
  /// magenta Colors for different log levels.
  magenta("35"),
  /// cyan Colors for different log levels.
  cyan("36"),
  /// white Colors for different log levels.
  white("37");

  /// string representing the ANSI color code.
  final String code;

  const Logger(this.code);

  /// Logs the given [text] with the specified color.
  void log(dynamic text) => debugPrint('\x1B[${code}m$text\x1B[0m');
}
