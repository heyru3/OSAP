import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/widget/header.dart';
import '../controllers/researcher_controller.dart';

class ProfileView extends GetView<ResearcherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    //Todo:generate person's image
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    //Todo:generate person's name
                    'Mr. person\'s name',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                            leading:
                                                Icon(Icons.person_outlined),
                                            title: Text('First name'),
                                            //Todo:generate from database
                                            subtitle: Text('Saladin'),
                                            trailing: GestureDetector(
                                              onTap: () {
                                                //Todo:edit file
                                              },
                                              child: Icon(Icons.edit_outlined),
                                            )),
                                        ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                            leading:
                                                Icon(Icons.person_outlined),
                                            title: Text('Last name'),
                                            //Todo:generate from database
                                            subtitle: Text('Saladin'),
                                            trailing: GestureDetector(
                                              onTap: () {
                                                //Todo:edit file
                                              },
                                              child: Icon(Icons.edit_outlined),
                                            )),
                                        ListTile(
                                            leading: Icon(Icons.email_outlined),
                                            title: Text("Email"),
                                            subtitle:
                                                Text("donaldtrump@gmail.com"),
                                            trailing: GestureDetector(
                                              onTap: () {
                                                //Todo:edit file
                                              },
                                              child: Icon(Icons.edit_outlined),
                                            )),
                                        ListTile(
                                            leading: Icon(Icons.phone_outlined),
                                            title: Text("Phone"),
                                            subtitle: Text("99--99876-56"),
                                            trailing: GestureDetector(
                                              onTap: () {
                                                //Todo:edit file
                                              },
                                              child: Icon(Icons.edit_outlined),
                                            )),
                                        ListTile(
                                            leading: Icon(Icons.lock_outlined),
                                            title: Text("Password"),
                                            subtitle: Text("111111111"),
                                            trailing: GestureDetector(
                                              onTap: () {
                                                //Todo:edit file
                                              },
                                              child: Icon(Icons.edit_outlined),
                                            )),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
