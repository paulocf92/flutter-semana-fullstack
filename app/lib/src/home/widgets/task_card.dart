import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.access_alarm),
              Text('dadsdsd'),
            ],
          ),
          Text('Título'),
          LinearProgressIndicator(),
          Text('1/5'),
        ],
      ),
    );
  }
}
