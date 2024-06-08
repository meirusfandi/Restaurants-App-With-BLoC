import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCaseNoParam<Type> {
  Future<Type> call();
}

abstract class UseCaseNoReturn<Params> {
  call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
