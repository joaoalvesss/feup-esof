import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileInfo extends StatelessWidget {
  final String shelterId;

  const ProfileInfo({Key? key, required this.shelterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalRef =
        FirebaseFirestore.instance.collection('shelter').doc(shelterId);
    return StreamBuilder<DocumentSnapshot>(
      stream: animalRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.data() != null) {
          final data = snapshot.data!.data() as Map<String, dynamic>;
          final shelterName = data['name'];
          final shelterAddress = data['adress'];
          final shelterEmail = data['email'];
          final shelterPhone = data['phone'];

          return Material(
            child: Container(
              width: 350,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: const Color.fromRGBO(121, 81, 58, 1),
                  width: 6,
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          shelterName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(4),
                        child: Text(shelterAddress),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            const Icon(Icons.phone),
                            Text(
                              shelterPhone.toString(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Segunda - Sexta'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Sábado / Domingo')
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('09:00 - 12:30 / 13:00 - 17:30'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Encerrado')
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
