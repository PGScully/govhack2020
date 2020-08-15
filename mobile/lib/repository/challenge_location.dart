class ChallengeLocation {
  int id;
  String title;
  String description;
  double latitude;
  double longitude;
  String imageUrl;
  String thumbnailUrl;

  ChallengeLocation({
    this.id,
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.imageUrl = '',
    this.thumbnailUrl = '',
  });
}
