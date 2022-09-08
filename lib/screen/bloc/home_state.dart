part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class AmountUpdate extends HomeState {
  final double value;

  const AmountUpdate(this.value);
  @override
  List<Object> get props => [value];
}

class CardIndexSelected extends HomeState {
  final int index;

  const CardIndexSelected(this.index);
  @override
  List<Object> get props => [index];
}

class BankIndexSelected extends HomeState {
  final int index;

  const BankIndexSelected(this.index);
  @override
  List<Object> get props => [index];
}