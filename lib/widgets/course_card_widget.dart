import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/app_theme.dart';
import '../models/course.dart';

final _thousandsSep = RegExp(r'(\d)(?=(\d{3})+(?!\d))');

class CourseCardWidget extends StatelessWidget {
  final Course course;

  const CourseCardWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppExtension>();
    if (ext == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.go('/course/${course.id}'),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ThumbnailWidget(gradientColors: course.gradientColors),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _CourseInfoWidget(
                      course: course,
                      starColor: ext.starColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _PriceBadge(price: course.price),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThumbnailWidget extends StatelessWidget {
  final List<int> gradientColors;

  const _ThumbnailWidget({required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: gradientColors.map((c) => Color(c)).toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Icon(Icons.play_circle_outline, color: Colors.white, size: 32),
    );
  }
}

class _CourseInfoWidget extends StatelessWidget {
  final Course course;
  final Color starColor;

  const _CourseInfoWidget({required this.course, required this.starColor});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.title,
          style: (tt.titleSmall ?? const TextStyle()).copyWith(
            fontWeight: FontWeight.w600,
            color: cs.onSurface,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          course.provider,
          style: (tt.bodySmall ?? const TextStyle())
              .copyWith(color: cs.onSurfaceVariant),
        ),
        const SizedBox(height: 6),
        _StarRating(rating: course.rating, starColor: starColor),
        const SizedBox(height: 2),
        Text(
          '${_formatCount(course.studentCount)} students',
          style: (tt.bodySmall ?? const TextStyle()).copyWith(
            fontSize: 11,
            color: cs.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  String _formatCount(int count) => count
      .toString()
      .replaceAllMapped(_thousandsSep, (m) => '${m[1]},');
}

class _StarRating extends StatelessWidget {
  final double rating;
  final Color starColor;

  const _StarRating({required this.rating, required this.starColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (i) => Icon(
          i < rating.floor() ? Icons.star : Icons.star_border,
          color: starColor,
          size: 13,
        ),
      ),
    );
  }
}

class _PriceBadge extends StatelessWidget {
  final double price;

  const _PriceBadge({required this.price});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: cs.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '\$${price.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: cs.onSecondary,
        ),
      ),
    );
  }
}
