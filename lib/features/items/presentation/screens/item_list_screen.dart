import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authproject/features/items/presentation/bloc/item_bloc.dart';
import 'package:authproject/features/items/domain/entities/item.dart';

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
      appBar: AppBar(
        title: const Text('Paginated Products'),
        centerTitle: true,
      ),
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
            case ItemStatus.failure:
              return const Center(child: Text('failed to fetch items'));

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
                  // ✅ Safely render the BottomLoader spinner at the end of the list
                  if (index >= state.items.length) {
                    return const BottomLoader();
                  }
                  return ItemListItem(item: state.items[index]);
                },
              );

            case ItemStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ItemListItem extends StatelessWidget {
  const ItemListItem({required this.item, super.key});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text('${item.id}'),
        ),
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        isThreeLine: true,
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
