import 'package:dartz/dartz.dart';
import '../failure.dart';

abstract class UseCase<Type, Parameters> {
  Future<Either<MyFailure, Type>> execute({required Parameters param});
}
