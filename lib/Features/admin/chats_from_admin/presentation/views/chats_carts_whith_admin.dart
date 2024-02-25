import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/chats_from_admin/data/cubits/chat_card_cubit/chat_card_cubit.dart';
import 'package:house_app_one/Features/admin/chats_from_admin/data/models/chat_card_model.dart';
import 'package:house_app_one/Features/admin/chats_from_admin/presentation/views/chat_whith_admin_view.dart';
import 'package:house_app_one/Features/admin/chats_from_admin/presentation/widgets/custom_chat_card.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/color.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_cubit.dart';

class ChatsInEdmin extends StatefulWidget {
  const ChatsInEdmin({super.key});
  @override
  State<ChatsInEdmin> createState() => _ChatsInEdminState();
}

class _ChatsInEdminState extends State<ChatsInEdmin> {
  List<ChatCardModel> chats = [];
  void initState() {
    super.initState();
    BlocProvider.of<ChatCardCubit>(context).buildChatCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الرسائل",
          style: GoogleFonts.cairo(),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        elevation: BorderSide.strokeAlignOutside,
        backgroundColor: MyColors.purple,
      ),
      body: BlocBuilder<ChatCardCubit, ChatCardState>(
        builder: (context, state) {
          if (state is ChatCardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatCardSuccess) {
            chats = state.data;
            return ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatCard(
                  lastMessage: chats[index].userToken,
                  name: "مستخدم",
                  time: "12:12",
                  onTap: () async {
                    BlocProvider.of<ChatMessageCubit>(context)
                        .recivedMessage(usertoken: chats[index].userToken);
                    setState(() {});
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatWhithAdminView(
                          token: chats[index].userToken,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          if (state is ChatCardFailure) {
            return Text('Error: ${state.message}');
          } else {
            return Container();
          }
        },
      ),
    );
  }
}