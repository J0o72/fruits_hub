import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruit_hub/core/networking/error.dart';
part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(AppError error) = Failure<T>;
}
