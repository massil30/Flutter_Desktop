import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sina/view/list.dart';
import 'package:sina/view/update.dart';

detailpage(
    nom,
    pronom,
    dateDeNaissance,
    lieuDeNaissance,
    numerCartIdentiti,
    dateDetablisment,
    numeroPasport,
    dateDeablismentPasport,
    adress,
    index,
    context,
    Box usersBox) {
  return Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: 400,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tu es sûre ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  usersBox.deleteAt(index);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return List();
                                    },
                                  ));
                                },
                                child: Container(
                                  height: 140,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "Supprimer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 140,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "Annuler",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            })
      ],
      title: Text(
        "Detail De La Personne",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return List();
              },
            ));
          },
          child: Icon(Icons.arrow_back)),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return update(
                      usersBox,
                      context,
                      index,
                      nom,
                      pronom,
                      dateDeNaissance,
                      lieuDeNaissance,
                      numerCartIdentiti,
                      dateDeNaissance,
                      numeroPasport,
                      dateDeablismentPasport,
                      adress);
                },
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              height: 100,
              width: 150,
              child: Center(
                  child: Text(
                "Modifier",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nom:  ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(nom.toString().toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              SizedBox(
                width: 30,
              ),
              Text("_Prenom:  ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(pronom.toString().toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Date & Lieu de Naissance: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(
                  "${dateDeNaissance.toString()}   a ${lieuDeNaissance.toString()}  ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Numero Cart Dentiti: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(numerCartIdentiti.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              SizedBox(
                width: 100,
              ),
              Text("Date D'établissement(Dentiti): ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(dateDetablisment.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Numero de Pasport: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(numeroPasport.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              SizedBox(
                width: 100,
              ),
              Text("Date D'établissement (PASPORT): ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(dateDeablismentPasport.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
            ],
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("L'Adress:  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                Text(adress.toString().toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
