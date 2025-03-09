import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;
typedef DataMap = Map<String, dynamic>;