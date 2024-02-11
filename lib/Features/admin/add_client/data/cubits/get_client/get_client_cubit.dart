import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_app_one/Features/admin/add_client/data/models/client_model.dart';
import 'package:meta/meta.dart';

part 'get_client_state.dart';

class GetClientCubit extends Cubit<GetClientState> {
  GetClientCubit() : super(GetClientInitial());
  List<clientModel> data = [];

  Future<void> getData() async {
    data.clear();
    try {
      emit(IsLodingGetClient());
      print(" client loading...");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('client')
          .orderBy('Date', descending: true)
          .get();
      querySnapshot.docs.forEach((doc) {
        clientModel house =
            clientModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
        data.add(house);
      });
      emit(IsSucssesGetClient(data: data));
      print("Get client");
    } catch (e) {
      print("Get client is  failed: $e");
      emit(IsFeilerGetClient(error: e.toString()));
    }
  }

  Future<void> searchClientById(String houseMangerId) async {
    try {
      emit(IsLodingGetClient());
      print("Data is loading...");

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('client')
          .where('id House', isEqualTo: houseMangerId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        List<clientModel> matchingClients = [];

        querySnapshot.docs.forEach((doc) {
          clientModel house =
              clientModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
          matchingClients.add(house);
        });

        emit(IsSucssesGetClient(data: matchingClients));
        print("Clients found for ID: $houseMangerId");
      } else {
        print("No clients found for ID: $houseMangerId");
        emit(IsFeilerGetClient(error: "No clients found"));
      }
    } catch (e) {
      print("Data search failed: $e");
      emit(IsFeilerGetClient(error: e.toString()));
    }
  }
}
