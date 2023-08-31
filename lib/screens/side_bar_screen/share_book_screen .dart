import 'package:flutter/material.dart';

class ShareBookScreen extends StatelessWidget {
  static const String routeName = '\ShareBookScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'ShareBookScreen',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Divider(
            color: Colors.green[50],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Center(
                        child: Text('Book'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Upload image'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
