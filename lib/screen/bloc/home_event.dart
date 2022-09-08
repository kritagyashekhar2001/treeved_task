part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AmountValueChanged extends HomeEvent {
  final double value;

  const AmountValueChanged(this.value);
    @override
  List<Object> get props => [];

}

class MonthlyCardSelected extends HomeEvent {
  final int index;

  const MonthlyCardSelected(this.index);
    @override
  List<Object> get props => [];

}
class BankSelected extends HomeEvent {
  final int index;

  const BankSelected(this.index);
    @override
  List<Object> get props => [];

}