import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/constant/color_const.dart';
import 'package:emart_app/constant/firebase_consts.dart';
import 'package:emart_app/controller/chat_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/ui/screen/chat_screen/components/sender_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          '${controller.friendName}',
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: StreamBuilder(
                        stream: FirestoreServices.getChatMessages(
                            controller.chatDocId.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text(
                                'Send a message...',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          } else {
                            return
                                // ListView.builder(
                                //   itemCount: snapshot.data!.docs.length,
                                //   itemBuilder: (BuildContext context, int index) {
                                //     var data = snapshot.data!.docs[index];
                                //     return senderBubble(data);
                                //   });
                                ListView(
                              children: snapshot.data!.docs
                                  .mapIndexed((currentValue, index) {
                                var data = snapshot.data!.docs[index];

                                return Align(
                                    alignment:
                                        data['uid'] == auth.currentUser!.uid
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    child: senderBubble(data));
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
            ),
            10.heightBox,
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.msgController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.sendMsg(controller.msgController.text);
                      controller.msgController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: redColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emart_app/constant/color_const.dart';
// import 'package:emart_app/controller/chat_controller.dart';
// import 'package:emart_app/services/firestore_services.dart';
// import 'package:emart_app/ui/screen/chat_screen/components/sender_bubble.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(ChatController());
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         title: const Text(
//           'Title',
//           style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Obx(
//               () => controller.isLoading.value
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Expanded(
//                       child: StreamBuilder<QuerySnapshot>(
//                         stream: FirestoreServices.getChatMessages(
//                             controller.chatDocId.toString()),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           } else if (snapshot.hasError) {
//                             return const Center(
//                               child: Text('Error retrieving messages'),
//                             );
//                           } else if (snapshot.data == null ||
//                               snapshot.data!.docs.isEmpty) {
//                             return const Center(
//                               child: Text(
//                                 'Send a message...',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             );
//                           } else {
//                             return ListView.builder(
//                               itemCount: snapshot.data!.docs.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 var data = snapshot.data!.docs[index].data()
//                                     as Map<String, dynamic>;
//                                 return senderBubble(data);
//                               },
//                             );
//                           }
//                         },
//                       ),
//                     ),
//             ),
//             10.heightBox,
//             Container(
//               padding: const EdgeInsets.all(8),
//               margin: const EdgeInsets.all(8),
//               height: 80,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: controller.msgController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         hintText: 'Type a message...',
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       controller.sendMsg(controller.msgController.text);
//                       controller.msgController.clear();
//                     },
//                     icon: const Icon(
//                       Icons.send,
//                       color: redColor,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
