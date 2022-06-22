//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fitnow_trainee/controller/cubit/chat_controller/apiUserModel.dart';
// import 'package:fitnow_trainee/controller/dio_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'messageModel.dart';
// import 'messages_states.dart';
//
//
// class MessagesCubit extends Cubit<Messagesstates> {
//   MessagesCubit() : super(IntialMessagesstate());
//
//   static MessagesCubit get(context) => BlocProvider.of(context);
//
//   ApiUserData? model;
//   Future getMyData() async {
//     emit(UserLoadingState());
//     DioHelper.getdatatoken(
//         '/trainee/data',
//     ).then((value) {
//       model = ApiUserData.fromJson(value.data);
//       emit(UserSuccessState());
//     }).catchError((onError){
//       print(onError);
//       emit(UserErrorState());
//     });
//   }
//
//   void sendMessage({
//     String? messageText,
//     Map<String,dynamic>? seen,
//   }) {
//     MessageModel messageModel = MessageModel(
//         senderId: model!.data?.user?.id,
//         content: messageText,
//         seen: seen,
//         timestamp: FieldValue.serverTimestamp());
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(model!.uID)
//         .collection('chats')
//         .doc(receiverId)
//         .collection('message')
//         .add(messageModel.toMap())
//         .then((value) async {
//       emit(SuccessfulMessagesstate());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ErrorMessagesstate());
//     });
//
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(receiverId)
//         .collection('chats')
//         .doc(model!.uID)
//         .collection('message')
//         .add(messageModel.toMap())
//         .then((value) {
//       emit(SuccessfulMessagesstate());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ErrorMessagesstate());
//     });
//   }
//
//   List<MessageModel> chat = [];
//   void getChat(String? receiverId) {
//     FirebaseFirestore.instance
//         .collection("chatRooms")
//         .get().then((value){
//           value.docs.forEach((element) {
//             element.get("user");
//           });
//     })
//       emit(GetChatSuccessState());
//     });
//   }
// }