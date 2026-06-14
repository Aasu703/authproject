import 'package:flutter_bloc/flutter_bloc.dart';
import 'dio_error_state.dart';

class DioErrorBloc extends Cubit<DioErrorState> {
  DioErrorBloc() : super(const DioErrorState());

  void pushNetworkError(NetworkError error) {
    final updatedErrors = List<NetworkError>.from(state.errors)..add(error);
    emit(state.copyWith(errors: updatedErrors));
  }

  void clearErrors() {
    emit(const DioErrorState());
  }
}
