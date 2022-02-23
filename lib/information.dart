import 'package:flutter/material.dart';
import 'package:invitaion/invitation_card.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var letterController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
        icon: const Icon(
          Icons.keyboard_arrow_left
        ),
        label: const Text(
          'أعرض الدعوة',
          style: TextStyle(
          ),
        ),
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => InvitationCard(
                    name: nameController.text,
                    location: locationController.text,
                    letter: letterController.text,
                  ),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'داش ترحب بكم',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45,
                  vertical: 50,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(

                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'أدخل اسم المدعو',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      TextField(
                        controller: locationController,
                        decoration: const InputDecoration(
                          labelText: 'أدخل عنوان المدعو',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      TextField(
                        controller: letterController,
                        decoration: const InputDecoration(
                          labelText: 'أدخل الرسالة',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const   Hero(
                        tag: 'dash',
                        child:  Padding(
                          padding:  EdgeInsets.only(
                            right: 130,
                            top: 30,
                          ),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              'https://events.flutter.dev/engage/assets/img/community-hero.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }