import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sina/model/model.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  Box usersBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersBox = Hive.box("Users");
  }

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String nom,
      prenom,
      dateDeNaissance,
      lieuDeNaissance,
      numeroDeCartDentitiC,
      dateDetablisment,
      numeroDePasport,
      dateDetablismentP,
      adress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une Personne"),
      ),
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        nom = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "Nom "),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        prenom = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "Prenom"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        dateDeNaissance = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "Date De Naissance"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        lieuDeNaissance = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "Lieu De Naissance"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        numeroDeCartDentitiC = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "Numero La Cart Dentiti"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        dateDetablisment = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "Date d'établissement (La Cart Dentiti)"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        numeroDePasport = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "Numero de Pasport"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        dateDetablismentP = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          labelText: "date d'etablissment (Pasport)"),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                onChanged: (value) {
                  adress = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "ne me manque pas";
                  }
                },
                decoration: InputDecoration(
                    labelStyle:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    labelText: "L'Adress"),
              ),
            ),
            InkWell(
              onTap: () {
                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.reset();
                  usersBox.add(
                    [
                      nom.toUpperCase(),
                      prenom.toUpperCase(),
                      dateDeNaissance,
                      lieuDeNaissance.toUpperCase(),
                      numeroDeCartDentitiC == null
                          ? "null"
                          : numeroDeCartDentitiC,
                      dateDetablisment == null ? "null" : dateDetablisment,
                      numeroDePasport == null ? "null" : numeroDePasport,
                      dateDetablismentP == null
                          ? "null"
                          : dateDetablismentP.toUpperCase(),
                      adress
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Container(
                        height: 500,
                        width: 700,
                        child: ListView.builder(
                          itemCount: usersBox.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {},
                              title: Text(usersBox.getAt(index)[1]),
                              leading: Text(usersBox
                                  .getAt(
                                    index,
                                  )[0]
                                  .toString()),
                              subtitle: Column(
                                children: [
                                  Text(usersBox
                                      .getAt(
                                        index,
                                      )[2]
                                      .toString()),
                                  Text(usersBox
                                      .getAt(
                                        index,
                                      )[3]
                                      .toString()),
                                  Text(usersBox
                                      .getAt(
                                        index,
                                      )[4]
                                      .toString()),
                                  Text(usersBox
                                      .getAt(
                                        index,
                                      )[5]
                                      .toString()),
                                  Text(usersBox
                                      .getAt(
                                        index,
                                      )[6]
                                      .toString())
                                ],
                              ),
                            );
                          },
                        ),
                      ));
                    },
                  );
                }
              },
              child: Container(
                  height: 100,
                  width: 300,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Ajout une personne",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
