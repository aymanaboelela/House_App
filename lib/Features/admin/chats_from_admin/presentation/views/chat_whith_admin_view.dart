import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/add_not_facation_cubit.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/get_notfacation/get_notfacation_cubit.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/custom_chat_bubble.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/custom_chat_text_field.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_state.dart';
import 'package:house_app_one/Features/communication/data/models/message_model.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/widgets/custom_app_bar.dart';
import 'package:lottie/lottie.dart';

class ChatWhithAdminView extends StatefulWidget {
  const ChatWhithAdminView({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<ChatWhithAdminView> createState() => _ChatWhithUserViewState();
}

class _ChatWhithUserViewState extends State<ChatWhithAdminView> {
  @override
  void initState() {
    BlocProvider.of<AddNotFacationCubit>(context)
        .addTokenInFirebaseWithAdmin(adminToken!);
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

      BlocProvider.of<AddNotFacationCubit>(context).sendNotification(
          "📌رساله جديده", textEditingController.text, widget.token.toString());
      textEditingController.clear();
    }
    setState(() {});
  }

  List<MessageModel> messageModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      appBar: CustomAppBar.customAppBar(title: "صفحه الادمن"),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundChat),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocConsumer<ChatMessageCubit, ChatMessageState>(
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
                ? Center(
                    child: Lottie.asset(AppAssets.Loding1),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ListView.builder(
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: messageModel.length,
                        itemBuilder: (context, index) =>
                            messageModel[index].isAdmin == true
                                ? ChatBubbleForFriend(
                                    isAdmain: true,
                                    message: messageModel[index].message,
                                    time: messageModel[index].timeTamp,
                                  )
                                : ChatBubbleForCurrentUser(
                                    isAdmain: false,
                                    time: messageModel[index].timeTamp,
                                    message: messageModel[index].message,
                                  )),
                  );
          },
        ),
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
