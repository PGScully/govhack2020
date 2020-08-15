class Offer {
  int id;
  String title;
  String description;
  double latitude;
  double longitude;
  String imageUrl;
  String thumbnailUrl;

  Offer({
    this.id,
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.imageUrl = '',
    this.thumbnailUrl = '',
  });
}
