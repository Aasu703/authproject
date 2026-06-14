import 'package:authproject/features/items/presentation/bloc/item_event.dart';
import 'package:authproject/features/items/presentation/bloc/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authproject/features/items/presentation/bloc/item_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../widgets/item_list_item.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/item_shimmer.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Paginated Items'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1E293B),
            ],
          ),
        ),
        child: SafeArea(
          child: BlocConsumer<ItemBloc, ItemState>(
            listener: (context, state) {
              if (state.errorMessage != null && state.items.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: const Color(0xFFEF4444),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case ItemStatus.initial:
                case ItemStatus.loading:
                  if (state.items.isEmpty) {
                    return const ItemShimmer();
                  }
                  continue successCase;

                successCase:
                case ItemStatus.success:
                  if (state.items.isEmpty) {
                    return const Center(
                      child: Text(
                        'No items found',
                        style: TextStyle(color: Colors.white54),
                      ),
                    );
                  }
                  return AnimationLimiter(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(24),
                      itemCount: state.hasReachedMax ? state.items.length : state.items.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: index >= state.items.length
                                  ? const BottomLoader()
                                  : ItemListItem(item: state.items[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  );

                case ItemStatus.failure:
                  if (state.items.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline_rounded, color: Color(0xFFEF4444), size: 48),
                          const SizedBox(height: 16),
                          const Text(
                            'Failed to fetch items',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => context.read<ItemBloc>().add(FetchItems()),
                            child: const Text('Try Again'),
                          ),
                        ],
                      ),
                    );
                  }
                  continue successCase;
              }
            },
          ),
        ),
      ),
    );
  }
}
