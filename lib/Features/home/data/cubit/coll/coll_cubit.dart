import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'coll_state.dart';

class CollCubit extends Cubit<CollState> {
  String? phoneNumber = "01225796476";

  String? id;
  CollCubit() : super(CollInitial());

  Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> launchWhatsApp(String id) async {
    String massege = " لو سمحت عاوز استفسر عن شقه ID:[$id ] 🏡";
    String urls = "https://wa.me/+2${phoneNumber}/?text=$massege";
    final Uri url = Uri.parse(urls);
    await launchUrl(url);
  }
}
