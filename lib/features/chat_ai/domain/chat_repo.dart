import 'package:dartz/dartz.dart';
import 'package:fahimak_ai/core/errors/failures.dart';

abstract class ChatRepo {
  Future<Either<Failure, String>> sendMessage({required String message});
}
