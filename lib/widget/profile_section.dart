import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.mainAxisAlignment,
  });
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 38,
              backgroundImage: NetworkImage(
                'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(
          'John Doe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
