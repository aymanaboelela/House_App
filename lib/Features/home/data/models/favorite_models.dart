class IsfavoriteModel {
  final String id;

  IsfavoriteModel({required this.id});

  factory IsfavoriteModel.fromMap(Map<String, dynamic> map) {
    return IsfavoriteModel(
      id: map['ididhouses'] ?? '',
    );
  }

  // Convert the IsfavoriteModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'ididhouses': id,
    };
  }
}
