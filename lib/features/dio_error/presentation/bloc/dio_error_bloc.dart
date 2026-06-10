// lib/features/dio_error/presentation/bloc/dio_error_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dio_error_event.dart';
import 'dio_error_state.dart';

class DioErrorBloc extends Bloc<DioErrorEvent, DioErrorState> {
  DioErrorBloc() : super(DioErrorState.initial()) {
    on<AddDioError>(_onAddDioError);
    on<ClearDioErrors>(_onClearDioErrors);
  }

  void _onAddDioError(AddDioError event, Emitter<DioErrorState> emit) {
    final newError = DioErrorDetails(
      url: event.url,
      errorType: event.errorType,
      message: event.message,
      statusCode: event.statusCode,
    );
    final updatedList = List<DioErrorDetails>.from(state.errors)..add(newError);
    emit(state.copyWith(errors: updatedList));
  }

  void _onClearDioErrors(ClearDioErrors event, Emitter<DioErrorState> emit) {
    emit(DioErrorState.initial());
  }
}
