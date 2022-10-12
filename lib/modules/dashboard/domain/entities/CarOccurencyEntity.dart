class CarOccurencyEntity {
  final int id;
  final String tag;
  final DateTime datetime;

  const CarOccurencyEntity({
    this.id,
    this.tag,
    this.datetime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tag': tag,
      'datetime': datetime,
    };
  }
}
