import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/chat_icon_button.dart';
import 'package:flutter_kakao/components/my_chat.dart';
import 'package:flutter_kakao/components/other_chat.dart';
import 'package:flutter_kakao/components/time_line.dart';
import 'package:flutter_kakao/model/chat.dart';
import 'package:flutter_kakao/model/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ChatRoomScreen extends StatefulWidget {
  ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final List<MyChat> chats = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFb2c7da),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title:
                Text("홍길동", style: Theme.of(context).textTheme.headlineSmall),
            actions: [
              Icon(
                FontAwesomeIcons.search,
                size: 20,
              ),
              SizedBox(width: 25),
              Icon(
                FontAwesomeIcons.bars,
                size: 20,
              ),
              SizedBox(width: 25)
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TimeLine(time: "2023년 3월 31일 금요일"),
                        OtherChat(
                            name: "홍길동", time: "오전 10:10", text: "안녕하세요"),
                        MyChat(text: "네 안녕하세요", time: "오전 10:11"),
                        ...List.generate(
                              chats.length, (index) => chats[index]),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                color: Colors.white,
                child: Row(
                  children: [
                    ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: _textEditingController,
                          maxLines: 1,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          onSubmitted: _handleSubmitted,
                        ),
                      ),
                    ),
                    ChatIconButton(icon: Icon(FontAwesomeIcons.smile)),
                    ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

  void _handleSubmitted(text) {
    _textEditingController.clear();

    setState(() {
      chats.add(MyChat(
          text: text, time: DateFormat("a k:m").format(new DateTime.now()).replaceAll("AM", "오전",).
      replaceAll("PM", "오후")));
    });
  }
}
