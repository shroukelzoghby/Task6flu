import 'package:flutter/material.dart';
import 'package:task6/main.dart';
import 'package:task6/sqldb.dart';

class addContact extends StatefulWidget {
  const addContact({super.key});
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<addContact> {
  Sqldp sqldb = Sqldp();
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Contact'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(hintText: "name"),
                      ),
                      TextFormField(
                        controller: phone,
                        decoration: InputDecoration(hintText: "phone"),
                      ),
                      Container(
                        height: 20,
                      ),
                      MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          int response = await sqldb.insertData(
                              "INSERT INTO contacts (`name` , `phone` ) VALUES ('${name.text}','${phone.text}')");
                          if (response > 0) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => ContactsPage()),
                                (route) => false);
                          }
                        },
                        child: Text('Add Contact'),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
