import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organ_dhundho/screens/another_user.dart';

class CommentCard extends StatelessWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Profilescreen2(
              uid: snap.data()['uid'],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                snap.data()['profilePic'],
              ),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: snap.data()['name'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                            text: ' ${snap.data()['text']}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        DateFormat.yMMMd().format(
                          snap.data()['datePublished'].toDate(),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.favorite,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
