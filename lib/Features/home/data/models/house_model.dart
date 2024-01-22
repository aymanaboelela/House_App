class HouseModel {
  String typeHouse;
  int price;
  String airConditioner;
  String wifi;
  String naturalgas;
  String description;
  String gender;
  int numpersOfBad;
  String image;

  HouseModel({
    required this.typeHouse,
    required this.price,
    required this.airConditioner,
    required this.wifi,
    required this.naturalgas,
    required this.description,
    required this.gender,
    required this.numpersOfBad,
    required this.image,
  });

  HouseModel.fromMap(Map<String, dynamic> map)
      : typeHouse = map['typeHouse'],
        price = map['price'],
        airConditioner = map['airConditioner'],
        wifi = map['wifi'],
        naturalgas = map['naturalgas'],
        description = map['description'],
        gender = map['gender'],
        numpersOfBad = map['numpersOfBad'],
        image = map['image'];

  Map<String, dynamic> toMap() {
    return {
      'typeHouse': typeHouse,
      'price': price,
      'airConditioner': airConditioner,
      'wifi': wifi,
      'naturalgas': naturalgas,
      'description': description,
      'gender': gender,
      'numpersOfBad': numpersOfBad,
      'image': image,
    };
  }
}
