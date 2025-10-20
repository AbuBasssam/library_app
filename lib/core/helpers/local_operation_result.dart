class LocalOperationResult<T> {
  final bool isSuccess;
  final T? data;
  final List<String>? errors;

  const LocalOperationResult._({
    required this.isSuccess,
    this.data,
    this.errors,
  });

  /// Success operation
  factory LocalOperationResult.success(T value) {
    return LocalOperationResult._(
      isSuccess: true,
      data: value,
    );
  }

  /// Failure operation with Errors
  factory LocalOperationResult.failure(List<String> errors) {
    return LocalOperationResult._(
      isSuccess: false,
      errors: errors,
    );
  }

  /// Failure operation with single Error
  factory LocalOperationResult.failureWithError(String error) {
    return LocalOperationResult._(
      isSuccess: false,
      errors: [error],
    );
  }
}
