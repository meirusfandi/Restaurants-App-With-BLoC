part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object?> get props => <DetailEvent>[];
}

class GetDetailRecipeEvent extends DetailEvent {
  final String restaurantsId;
  const GetDetailRecipeEvent({required this.restaurantsId});

  @override
  List<Object> get props => <Object>[restaurantsId];
}