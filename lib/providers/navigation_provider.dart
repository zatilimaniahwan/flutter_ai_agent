import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationState {
  final int selectedIndex;

  const NavigationState({this.selectedIndex = 0});

  NavigationState copyWith({int? selectedIndex}) =>
      NavigationState(selectedIndex: selectedIndex ?? this.selectedIndex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationState &&
          runtimeType == other.runtimeType &&
          selectedIndex == other.selectedIndex;

  @override
  int get hashCode => selectedIndex.hashCode;
}

class NavigationNotifier extends Notifier<NavigationState> {
  @override
  NavigationState build() => const NavigationState();

  void selectTab(int index) {
    assert(index >= 0 && index < 4, 'Nav index out of range');
    state = state.copyWith(selectedIndex: index);
  }
}

final navigationProvider =
    NotifierProvider<NavigationNotifier, NavigationState>(
        NavigationNotifier.new);
