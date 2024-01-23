class HouseModel {
  String idHouse;
  String typeHouse;
  String price;
  bool airConditioner;
  bool wifi;
  bool naturalgas;
  String description;
  String gender;
  String numpersOfBad;
  String numpersOfRoms;
  String ?url;

  HouseModel({
    required this.idHouse,
    required this.numpersOfRoms,
    required this.typeHouse,
    required this.price,
    required this.airConditioner,
    required this.wifi,
    required this.naturalgas,
    required this.description,
    required this.gender,
    required this.numpersOfBad,
    required this.url,
  });

  HouseModel.fromMap(Map<String, dynamic> map)
      : idHouse = map['id House'],
        typeHouse = map['Type House'],
        numpersOfRoms = map['Number Of Rooms'],
        price = map['Price'],
        airConditioner = map['Air Conditioner'],
        wifi = map['Wi-Fi'],
        naturalgas = map['Natural Gas'],
        description = map['Description'],
        gender = map['Gender'],
        numpersOfBad = map['Number Of Beds'],
        url = map['url'];
}
