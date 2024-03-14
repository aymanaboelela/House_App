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
        idHouse = map['id House']?? "" ,// Add null check and default value
        typeHouse = map['Type House'] ?? '', // Add null check and default value
        numpersOfRoms =
            map['Number Of Rooms'] ?? '', // Add null check and default value
        price = map['Price'] ?? '', // Add null check and default value
        nameOfUniversity =
            map['Name Of University'] ?? '', // Add null check and default value
        airConditioner =
            map['Air Conditioner'] ?? false, // Add null check and default value
        wifi = map['Wi-Fi'] ?? false, // Add null check and default value
        singelRome =
            map['Rome Singel'] ?? false, // Add null check and default value
        naturalgas =
            map['Natural Gas'] ?? false, // Add null check and default value
        description =
            map['Description'] ?? '', // Add null check and default value
        gender = map['Gender'] ?? '', // Add null check and default value
        numpersOfBad =
            map['Number Of Beds'] ?? '', // Add null check and default value
        url = map['Urls'] ?? [];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id House': idHouse,
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
