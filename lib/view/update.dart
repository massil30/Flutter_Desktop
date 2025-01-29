import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sina/view/detailPage.dart';
import 'package:sina/view/list.dart';

update(
    Box usersBox,
    context,
    index,
    nom,
    prenom,
    dateDeNaissance,
    lieuDeNaissance,
    numeroCartIdetit,
    dateDetablissment,
    numeroDePasport,
    dateDetablissmentP,
    adress) {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String familyname, name, dn, ln, ndcd, dtdc, ndp, ddp, adres;
  return Scaffold(
    body: Scaffold(
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
                      initialValue: nom,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        familyname = value;
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
                      initialValue: prenom,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        name = value;
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
                      initialValue: dateDeNaissance,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        dn = value;
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
                      initialValue: lieuDeNaissance,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ne me manque pas";
                        }
                      },
                      onChanged: (value) {
                        ln = value;
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
                      initialValue: numeroCartIdetit,
                      onChanged: (value) {
                        ndcd = value;
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
                      initialValue: dateDetablissment,
                      onChanged: (value) {
                        dtdc = value;
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
                      initialValue: numeroDePasport,
                      onChanged: (value) {
                        ndp = value;
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
                      initialValue: dateDetablissmentP,
                      onChanged: (value) {
                        ddp = value;
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
                initialValue: adress,
                onChanged: (value) {
                  adres = value;
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
                  usersBox.putAt(
                    index,
                    [
                      familyname == null ? nom : familyname,
                      name == null ? prenom : name,
                      dn == null ? dateDeNaissance : dn,
                      ln == null ? lieuDeNaissance : ln,
                      ndcd == null ? numeroCartIdetit : ndcd,
                      dtdc == null ? dateDetablissment : dtdc,
                      ndp == null ? numeroDePasport : ndp,
                      ddp == null ? dateDetablissmentP : ddp,
                      adres == null ? adress : adres
                    ],
                  );
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      var u = usersBox.getAt(index);

                      return detailpage(
                          u[0].toString(),
                          u[1].toString(),
                          u[2].toString(),
                          u[3].toString(),
                          u[4].toString(),
                          u[5].toString(),
                          u[6].toString(),
                          u[7].toString(),
                          u[8].toString(),
                          index,
                          context,
                          usersBox);
                    },
                  ));
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
                      "Mise a jour d'une personne",
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
    ),
  );
}
