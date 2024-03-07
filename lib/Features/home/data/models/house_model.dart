class HouseModel {
  String id;
  String idHouse;
  String typeHouse;
  String price;
  String nameOfUniversity;
  bool airConditioner;
  bool wifi;
  bool naturalgas;
  bool singelRome;
  String description;
  String gender;
  String numpersOfBad;
  String numpersOfRoms;
  List<dynamic> url;

  HouseModel({
    required this.id,
    required this.idHouse,
    required this.numpersOfRoms,
    required this.typeHouse,
    required this.price,
    required this.nameOfUniversity,
    required this.airConditioner,
    required this.wifi,
    required this.singelRome,
    required this.naturalgas,
    required this.description,
    required this.gender,
    required this.numpersOfBad,
    required this.url,
  });

  HouseModel.fromMap(String id, Map<String, dynamic> map)
      : id = id,
        idHouse = map['id House'],
        typeHouse = map['Type House'],
        numpersOfRoms = map['Number Of Rooms'],
        price = map['Price'],
        nameOfUniversity = map['Name Of University'],
        airConditioner = map['Air Conditioner'],
        wifi = map['Wi-Fi'],
        singelRome = map['Rome Singel'],
        naturalgas = map['Natural Gas'],
        description = map['Description'],
        gender = map['Gender'],
        numpersOfBad = map['Number Of Beds'],
        url = map['Urls'] ?? [];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idHouse': idHouse,
      'typeHouse': typeHouse,
      'numpersOfRoms': numpersOfRoms,
      'price': price,
      'nameOfUniversity': nameOfUniversity,
      'airConditioner': airConditioner,
      'wifi': wifi,
      'singelRome': singelRome,
      'naturalgas': naturalgas,
      'description': description,
      'gender': gender,
      'numpersOfBad': numpersOfBad,
      'url': url,
    };
  }

  
}
