abstract class MyFailure {
  final String message;

  const MyFailure({required this.message});
}

class HomeFailure extends MyFailure {
  HomeFailure({required message})
      : super(
          message:
              'Load data failed check your internet connection, and try again later',
        );
}
