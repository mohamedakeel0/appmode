



import 'package:dartz/dartz.dart';
import 'package:appmode/core/error/faliure.dart';


abstract class BaseUseCase<T,Parameters>{
  Future<Either<Failure,T>> call(Parameters parameters);}
