class Challenge {
  int id;
  String title;
  String description;
  double latitude;
  double longitude;
  String imageUrl;
  String thumbnailUrl;

  Challenge({
    this.id,
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.imageUrl = '',
    this.thumbnailUrl = '',
  });
}
