import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/add_not_facation_cubit.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/color.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/custom_chat_bubble.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/custom_chat_text_field.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_state.dart';
import 'package:house_app_one/Features/communication/data/models/message_model.dart';

class ChatWhithAdminView extends StatefulWidget {
  const ChatWhithAdminView({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<ChatWhithAdminView> createState() => _ChatWhithUserViewState();
}

class _ChatWhithUserViewState extends State<ChatWhithAdminView> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  TextEditingController textEditingController = TextEditingController();
  bool isMessageLoading = false;
  String? errorMessage;
  void chat() {
    if (textEditingController.text.isNotEmpty) {
      BlocProvider.of<ChatMessageCubit>(context).senderdMessage(
        isAdmin: true,
        userToken: widget.token,
        message: textEditingController.text,
      );
      textEditingController.clear();
      BlocProvider.of<AddNotFacationCubit>(context).sendNotification(
          "رساله جديديده", textEditingController.text, widget.token.toString());
    }
    setState(() {});
  }

  List<MessageModel> messageModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      appBar: AppBar(
        centerTitle: true,
        elevation: BorderSide.strokeAlignOutside,
        backgroundColor: MyColors.purple,
        shadowColor: MyColors.darkGrey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text(
          "صفحه الادمن",
          style: GoogleFonts.cairo(),
        ),
      ),
      body: BlocConsumer<ChatMessageCubit, ChatMessageState>(
        listener: (context, state) {
          if (state is ChatMessageLoading) {
            isMessageLoading = true;
          }
          if (state is ChatSenderMessageSuccess) {
            isMessageLoading = false;
          }
          if (state is ChatReciverMessageSuccess) {
            isMessageLoading = false;
            messageModel = state.data;
          }
          if (state is ChatMessageFailure) {
            isMessageLoading = false;
            errorMessage = state.message;
          }
        },
        builder: (context, state) {
          if (state is ChatReciverMessageSuccess) {
            isMessageLoading = false;
            messageModel = state.data;
          }
          return isMessageLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ListView.builder(
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: messageModel.length,
                    itemBuilder: (context, index) =>
                        messageModel[index].isAdmin == true
                            ? ChatBubbleForCurrentUser(
                                time: messageModel[index].timeTamp,
                                message: messageModel[index].message,
                              )
                            : ChatBubbleForFriend(
                                message: messageModel[index].message,
                                time: messageModel[index].timeTamp,
                              ),
                  ),
                );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CustomChatTextField(
          controller: textEditingController,
          onPressed: () => chat(),
          onSubmitted: (_) => chat(),
        ),
      ),
    );
  }
}
