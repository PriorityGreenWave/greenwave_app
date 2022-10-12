class CarOccurencyInput {
  final String tag;
  final DateTime datetime;

  const CarOccurencyInput({
    this.tag,
    this.datetime,
  });

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
      'datetime': datetime,
    };
  }
}
