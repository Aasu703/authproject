import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:authproject/features/items/domain/usecases/get_items_usecase.dart';
import 'item_event.dart';
import 'item_state.dart';

export 'item_event.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return events.throttle(duration).switchMap(mapper);
  };
}

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GetItemsUseCase getItemsUseCase;

  // Initialize with the standard structural default constructor configuration
  ItemBloc({required this.getItemsUseCase}) : super(const ItemState()) {
    on<FetchItems>(
      _onFetchItems,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemState> emit) async {
    if (state.hasReachedMax) return;

    // Optional: emit loading status for next chunk if desired, or skip to keep smooth scrolling
    final result = await getItemsUseCase(
      GetItemsParams(
        first: 10,
        after: state.endCursor,
      ), // Pagination parameters for fetching the next page after 10 items
    );

    result.fold(
      (failure) {
        if (state.items.isEmpty) {
          emit(
            state.copyWith(
              status: ItemStatus.failure,
              errorMessage: failure.message,
            ),
          );
        } else {
          emit(state.copyWith(errorMessage: failure.message));
        }
      },
      (connection) {
        emit(
          state.copyWith(
            status: ItemStatus.success,
            items: List.of(state.items)..addAll(connection.items),
            hasReachedMax: !connection.pageInfo.hasNextPage,
            endCursor: connection.pageInfo.endCursor,
            errorMessage: null, // Wipe errors cleanly when fetching succeeds
          ),
        );
      },
    );
  }
}
