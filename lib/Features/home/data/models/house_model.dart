class HouseModel {
  String typeHouse;
  String price;
  String airConditioner;
  String wifi;
  String naturalgas;
  String description;
  String gender;
  String numpersOfBad;
  String numpersOfRoms;


  HouseModel({
    required this.numpersOfRoms,
    required this.typeHouse,
    required this.price,
    required this.airConditioner,
    required this.wifi,
    required this.naturalgas,
    required this.description,
    required this.gender,
    required this.numpersOfBad,
   
  });

  HouseModel.fromMap(Map<String, dynamic> map)
      : typeHouse = map['Type House'],
        numpersOfRoms = map['Number Of Rooms'],
        price = map['Price'],
        airConditioner = map['Air Conditioner'],
        wifi = map['Wi-Fi'],
        naturalgas = map['Natural Gas'],
        description = map['Description'],
        gender = map['Gender'],
        numpersOfBad = map['Number Of Beds'];
  // image = map['image'];

  Map<String, dynamic> toMap() {
    return {
      'Type House': typeHouse,
      'Price': price,
      'Air Conditioner': airConditioner,
      'Wi-Fi': wifi,
      'Natural Gas': naturalgas,
      'description': description,
      'Gender': gender,
      'Number Of Beds': numpersOfBad,
     
      'Number Of Rooms': numpersOfRoms,
    };
  }
}
