import 'package:authproject/features/items/presentation/bloc/item_event.dart';
import 'package:authproject/features/items/presentation/bloc/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authproject/features/items/presentation/bloc/item_bloc.dart';
import '../widgets/item_list_item.dart';
import '../widgets/bottom_loader.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ItemBloc>().add(FetchItems());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paginated Items'), centerTitle: true),
      body: BlocConsumer<ItemBloc, ItemState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.items.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case ItemStatus.initial:
            case ItemStatus.loading: // FIX: Added loading status support
              // If we already have items loaded, keep showing the list (the infinite scroll loader handles the bottom spinner)
              // Otherwise, show a fullscreen spinner for the initial page load.
              if (state.items.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              // Fallthrough to success rendering strategy to keep existing view state visible
              continue successCase;

            successCase:
            case ItemStatus.success:
              if (state.items.isEmpty) {
                return const Center(child: Text('no items'));
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.items.length
                    : state.items.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  // Safely render the BottomLoader spinner at the end of the list
                  if (index >= state.items.length) {
                    return const BottomLoader();
                  }
                  return ItemListItem(item: state.items[index]);
                },
              );

            case ItemStatus.failure:
              if (state.items.isEmpty) {
                return const Center(child: Text('failed to fetch items'));
              }
              // If there are existing items, re-route to show the active items list with the error handled by the SnackBar listener
              continue successCase;
          }
        },
      ),
    );
  }
}
