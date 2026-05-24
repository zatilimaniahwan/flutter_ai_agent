class Course {
  final String id;
  final String title;
  final String provider;
  final double rating;
  final int studentCount;
  final double price;
  final List<int> gradientColors;
  final String? imageUrl;

  const Course({
    required this.id,
    required this.title,
    required this.provider,
    required this.rating,
    required this.studentCount,
    required this.price,
    required this.gradientColors,
    this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Course && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Course($id: $title)';
}

const List<Course> mockCourses = [
  Course(
    id: 'course-001',
    title: 'Advanced UI/UX Design',
    provider: 'Design Academy',
    rating: 4.8,
    studentCount: 12450,
    price: 49.99,
    gradientColors: [0xFF7B2FF7, 0xFFE040FB],
  ),
  Course(
    id: 'course-002',
    title: 'Python for Beginners',
    provider: 'Code Institute',
    rating: 4.5,
    studentCount: 8320,
    price: 29.99,
    gradientColors: [0xFF0288D1, 0xFF26C6DA],
  ),
  Course(
    id: 'course-003',
    title: 'Python for Intermediate',
    provider: 'Code Institute',
    rating: 4.2,
    studentCount: 3760,
    price: 39.99,
    gradientColors: [0xFFE53935, 0xFFFF8A65],
  ),
  Course(
    id: 'course-004',
    title: 'Digital Marketing Mastery',
    provider: 'Growth Lab',
    rating: 4.6,
    studentCount: 5190,
    price: 59.99,
    gradientColors: [0xFF43A047, 0xFF80CBC4],
  ),
];
