// any use case with no params will implment this class
import '../utils/typedef.dart';

abstract class UseCase<T> {
  const UseCase();
  FutureResult<T> call();
}
// any use case with params will implment this class
// because we need to pass params
abstract class UseCaseWithParams<T, Params> {
  const UseCaseWithParams();
  FutureResult<T> call(Params params);
}