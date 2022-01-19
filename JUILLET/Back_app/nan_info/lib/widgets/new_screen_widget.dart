import 'package:flutter/material.dart';
import 'package:nan_info/screens/new_detail_screen.dart';

class NewScreenWidget extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  const NewScreenWidget(
      { this.id,  this.imageUrl, this.title});

  void gotoNewdetailScreen(context) {
    Navigator.pushNamed(context, NewDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gotoNewdetailScreen(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl))),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: 200,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
