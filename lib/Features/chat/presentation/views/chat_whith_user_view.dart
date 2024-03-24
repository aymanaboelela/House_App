import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/Splach/view/widgets/splash_view_body.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/add_not_facation_cubit.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/custom_chat_bubble.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/custom_chat_text_field.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_state.dart';
import 'package:house_app_one/Features/communication/data/models/message_model.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/widgets/custom_app_bar.dart';
import 'package:lottie/lottie.dart';

class ChatWhithUserView extends StatefulWidget {
  const ChatWhithUserView({Key? key}) : super(key: key);
  @override
  State<ChatWhithUserView> createState() => _ChatWhithUserViewState();
}

class _ChatWhithUserViewState extends State<ChatWhithUserView> {
  TextEditingController textEditingController = TextEditingController();
  bool isMessageLoading = false;
  String? errorMessage;
  void chat() {
    if (textEditingController.text.isNotEmpty) {
      BlocProvider.of<ChatMessageCubit>(context).senderdMessage(
        isAdmin: false,
        userToken: userToken!,
        message: textEditingController.text,
      );

      BlocProvider.of<ChatMessageCubit>(context)
          .addMessageinChateCard(textEditingController.text, userToken!);

//add notfacation in admine
      BlocProvider.of<AddNotFacationCubit>(context).sendNotification(
          "رساله من مستخدم ", textEditingController.text, "token in admin ");
      textEditingController.clear();
    }
    setState(() {});
  }

  List<MessageModel> messageModel = [];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatMessageCubit>(context)
        .recivedMessage(usertoken: userToken.toString());
    return Scaffold(
      appBar: CustomAppBar.customAppBar(title: "الدعم الفني"),
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
                ? Center(child: LottieBuilder.asset(AppAssets.Loding1))
                : Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ListView.builder(
                      reverse: true,
                      // shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: messageModel.length,
                      itemBuilder: (context, index) =>
                          messageModel[index].isAdmin == false
                              ? ChatBubbleForFriend(
                                  isAdmain: false,
                                  message: messageModel[index].message,
                                  time: messageModel[index].timeTamp,
                                )
                              : ChatBubbleForCurrentUser(
                                  isAdmain: true,
                                  time: messageModel[index].timeTamp,
                                  message: messageModel[index].message,
                                ),
                    ),
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
