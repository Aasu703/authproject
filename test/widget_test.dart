// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:authproject/features/dio_error/presentation/bloc/dio_error_bloc.dart';
import 'package:authproject/features/dio_error/presentation/bloc/dio_error_event.dart';
import 'package:authproject/features/dio_error/presentation/bloc/dio_error_state.dart';

void main() {
  group('DioErrorBloc Tests', () {
    late DioErrorBloc dioErrorBloc;

    setUp(() {
      dioErrorBloc = DioErrorBloc();
    });

    tearDown(() {
      dioErrorBloc.close();
    });

    test('initial state should be empty', () {
      expect(dioErrorBloc.state.errors, isEmpty);
      expect(dioErrorBloc.state.errorCount, 0);
    });

    test('AddDioError event should append error to list', () async {
      dioErrorBloc.add(const AddDioError(
        url: 'https://example.com/api',
        errorType: 'connectionTimeout',
        message: 'Timeout occurred',
        statusCode: 504,
      ));

      // Wait for the bloc event to process
      await expectLater(
        dioErrorBloc.stream,
        emits(predicate<DioErrorState>((state) {
          return state.errorCount == 1 &&
              state.errors.first.url == 'https://example.com/api' &&
              state.errors.first.errorType == 'connectionTimeout' &&
              state.errors.first.message == 'Timeout occurred' &&
              state.errors.first.statusCode == 504;
        })),
      );
    });

    test('ClearDioErrors event should clear all errors', () async {
      dioErrorBloc.add(const AddDioError(
        url: 'https://example.com/api',
        errorType: 'connectionTimeout',
        message: 'Timeout occurred',
      ));

      await expectLater(
        dioErrorBloc.stream,
        emits(predicate<DioErrorState>((state) => state.errorCount == 1)),
      );

      dioErrorBloc.add(ClearDioErrors());

      await expectLater(
        dioErrorBloc.stream,
        emits(predicate<DioErrorState>((state) => state.errorCount == 0)),
      );
    });
  });
}
