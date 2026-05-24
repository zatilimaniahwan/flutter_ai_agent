import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/course.dart';
import '../providers/home_provider.dart';
import '../providers/navigation_provider.dart';
import '../widgets/category_tabs_widget.dart';
import '../widgets/course_card_widget.dart';
import '../widgets/hero_banner_widget.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const _categories = [
    'All',
    'Design',
    'Development',
    'Business',
    'Marketing',
  ];

  static const _destinationLabels = ['Home', 'Courses', 'My Learning', 'Profile'];

  static const _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.menu_book_outlined),
      selectedIcon: Icon(Icons.menu_book),
      label: 'Courses',
    ),
    NavigationDestination(
      icon: Icon(Icons.play_lesson_outlined),
      selectedIcon: Icon(Icons.play_lesson),
      label: 'My Learning',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);
    final navState = ref.watch(navigationProvider);
    final navNotifier = ref.read(navigationProvider.notifier);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            final body = navState.selectedIndex == 0
                ? _DashboardBody(
                    categories: _categories,
                    selectedCategoryIndex: homeState.selectedCategoryIndex,
                    onCategoryTap: homeNotifier.selectCategory,
                  )
                : _PlaceholderBody(
                    label: _destinationLabels[navState.selectedIndex],
                  );

            if (isWide) {
              return ColoredBox(
                color: cs.surfaceContainerHighest,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: ClipRect(child: body),
                  ),
                ),
              );
            }
            return body;
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navState.selectedIndex,
        onDestinationSelected: navNotifier.selectTab,
        destinations: _destinations,
      ),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  final List<String> categories;
  final int selectedCategoryIndex;
  final ValueChanged<int> onCategoryTap;

  const _DashboardBody({
    required this.categories,
    required this.selectedCategoryIndex,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SearchBarWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: HeroBannerWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: CategoryTabsWidget(
            categories: categories,
            selectedIndex: selectedCategoryIndex,
            onTap: onCategoryTap,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Courses',
                  style: (tt.titleMedium ?? const TextStyle()).copyWith(
                    fontWeight: FontWeight.w700,
                    color: cs.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: (tt.labelMedium ?? const TextStyle())
                        .copyWith(color: cs.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 4)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => CourseCardWidget(course: mockCourses[i]),
            childCount: mockCourses.length,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}

class _PlaceholderBody extends StatelessWidget {
  final String label;

  const _PlaceholderBody({required this.label});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$label screen',
      child: Center(
        child: Text(
          label,
          style: (Theme.of(context).textTheme.titleMedium ?? const TextStyle())
              .copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
