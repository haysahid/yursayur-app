class ReviewModel {
  final String name;
  final int rating;
  final String description;

  const ReviewModel({
    required this.name,
    required this.rating,
    required this.description,
  });
}

final reviews = [
  const ReviewModel(
    name: 'Pakde Joe',
    rating: 4,
    description: 'Muantap...sayurnya masih fresh 🤞',
  ),
  const ReviewModel(
    name: 'Mbak Yu',
    rating: 5,
    description: 'Suka sama bayamnya.. seger segerr 💚',
  ),
  const ReviewModel(
    name: 'Diahputs',
    rating: 4,
    description: '👍👍👍',
  ),
];
