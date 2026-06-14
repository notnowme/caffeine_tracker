class ErrorModel implements Exception {
  final String title;
  final String message;
  final String path;
  const ErrorModel({
    required this.title,
    required this.message,
    required this.path,
  });

  factory ErrorModel.empty() =>
      const ErrorModel(title: '', message: '', path: '');

  ErrorModel copyWith({String? message, String? title, String? path}) {
    return ErrorModel(
      title: title ?? this.title,
      message: message ?? this.message,
      path: path ?? this.path,
    );
  }
}
