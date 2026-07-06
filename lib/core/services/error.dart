abstract class AppError {
  final String? message;

  AppError({this.message});
}

class ServerError extends AppError {
  ServerError({super.message});

  @override
  String toString() {
    return 'ServerError: $message';
  }
}
