import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;


  const UserTile({
    super.key, 
    required this.text, 
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Icon(Icons.person),
            Text(text),
          ],
        ),
      ),
    );
  }
}