import 'package:flutter/material.dart';

import 'package:fake_data/models/model_api.dart';

class ListWidget extends StatelessWidget {
 final SmulatorApi data;
   ListWidget({
    @required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
          alignment: Alignment.center,
          height: 100,
          width: double.infinity,
          child: Text(data.name),
          ),
        ],
      ),
    );
  }
}
