import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
part 'coll_state.dart';

class CollCubit extends Cubit<CollState> {
  CollCubit() : super(CollInitial());
  Future<void> makePhoneCall({required phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> launchWhatsApp(
      {required String phoneNumber, required String id}) async {
    String massege = "لو سمحت عاوز استفسر عن شقه ID:[$id] 🏡";
    String urls = "https://wa.me/+2${phoneNumber}/?text=$massege";
    final Uri url = Uri.parse(urls);
    await launchUrl(url);
  }
}
