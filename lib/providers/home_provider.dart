import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final int selectedCategoryIndex;

  const HomeState({this.selectedCategoryIndex = 0});

  HomeState copyWith({int? selectedCategoryIndex}) => HomeState(
        selectedCategoryIndex:
            selectedCategoryIndex ?? this.selectedCategoryIndex,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState &&
          runtimeType == other.runtimeType &&
          selectedCategoryIndex == other.selectedCategoryIndex;

  @override
  int get hashCode => selectedCategoryIndex.hashCode;
}

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeState();

  void selectCategory(int index) {
    assert(index >= 0, 'Category index must be non-negative');
    state = state.copyWith(selectedCategoryIndex: index);
  }
}

final homeProvider =
    NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

final searchQueryProvider = StateProvider<String>((ref) => '');
