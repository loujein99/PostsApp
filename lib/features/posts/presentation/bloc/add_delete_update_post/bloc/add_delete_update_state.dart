part of 'add_delete_update_bloc.dart';

abstract class AddDeleteUpdateState extends Equatable {
  const AddDeleteUpdateState();
  
  @override
  List<Object> get props => [];
}

class AddDeleteUpdateInitial extends AddDeleteUpdateState {}
