import 'package:flutter/material.dart';
import 'package:flutter_kakao/model/chat.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({required this.chat, Key? key}) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(chat.image),
          ),
          title: Text(
            chat.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          subtitle: Text(chat.content),
          contentPadding: const EdgeInsets.all(0),
        )
      ],
    );
  }
}
