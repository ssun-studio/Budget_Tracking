import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_expense_event.dart';
part 'get_expense_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
  ExpenseRepository expenseRepository;

  GetExpensesBloc(this.expenseRepository) : super(GetExpensesInitial()) {
    on<Getexpenses>((event, emit) async {
      emit(GetExpensesFailure());
      try {
        List<Expense> expenses = await expenseRepository.getExpenses();
        emit(GetExpensesSuccess(expenses));
      } catch (e) {
        emit(GetExpensesFailure());
      }
    });
  }
}
