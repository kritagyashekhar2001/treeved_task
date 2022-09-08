import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<AmountValueChanged>((event, emit) {
      emit(AmountUpdate(event.value));
    });
    on<MonthlyCardSelected>((event, emit) {
      emit(CardIndexSelected(event.index));
    });
    on<BankSelected>((event, emit) {
      emit(BankIndexSelected(event.index));
    });
  }
}
