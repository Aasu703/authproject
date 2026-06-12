import 'package:equatable/equatable.dart';
import 'package:authproject/features/items/domain/entities/item.dart';

enum ItemStatus { initial, loading, success, failure }

class ItemState extends Equatable {
  final ItemStatus status;
  final List<Item> items;
  final bool hasReachedMax;
  final String? endCursor;
  final String? errorMessage;

  const ItemState({
    this.status = ItemStatus.initial,
    this.items = const <Item>[], // Fixes const collection assignment
    this.hasReachedMax = false,
    this.endCursor,
    this.errorMessage,
  });

  ItemState copyWith({
    ItemStatus? status,
    List<Item>? items,
    bool? hasReachedMax,
    String? endCursor,
    String? errorMessage,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      endCursor: endCursor ?? this.endCursor,
      errorMessage:
          errorMessage ?? this.errorMessage, // Handles optional errors cleanly
    );
  }

  @override
  List<Object?> get props => [
    status,
    items,
    hasReachedMax,
    endCursor,
    errorMessage,
  ];
}
