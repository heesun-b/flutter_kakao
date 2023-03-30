import 'package:flutter/material.dart';
import 'package:flutter_kakao/screens/profile_screen.dart';

import '../model/user.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({required this.user, Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        onTap: (){
          Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileScreen(user: user,),));
        },
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              user.backgroundImage // 주소
            ),
          ),
        title: Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        subtitle: Text(
          user.intro,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

