import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sina/model/model.dart';
import 'package:sina/view/detailPage.dart';

class Search extends SearchDelegate {
  @override
  buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    var usersBox = Hive.box("Users");
    List<String> _products = [];
    for (int i = 0; i < usersBox.length; i++) {
      _products.add(usersBox.getAt(i)[0]);
    }
    List<String> prod = query.isEmpty
        ? _products
        : _products.where((element) => element.contains(query)).toList();
    return ListView.builder(
      itemCount: prod.length,
      itemBuilder: (context, index) {
        var u = usersBox.getAt(index);

        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return detailpage(
                    u[0],
                    u[1],
                    u[2],
                    u[3],
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
          },
          title: Text(
            prod[index].toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: Text(usersBox.getAt(
            index,
          )[2]),
          subtitle: Text(
            usersBox
                .getAt(
                  index,
                )[1]
                .toString()
                .toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: Icon(
            Icons.person,
            color: Colors.blue,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var usersBox = Hive.box("Users");
    List<String> _products = [];
    for (int i = 0; i < usersBox.length; i++) {
      _products.add(usersBox.getAt(i)[0]);
    }
    List<String> prod = query.isEmpty
        ? _products
        : _products.where((element) => element.contains(query)).toList();
    return ListView.builder(
      itemCount: prod.length,
      itemBuilder: (context, index) {
        var u = usersBox.getAt(index);

        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return detailpage(
                    u[0],
                    u[1],
                    u[2],
                    u[3],
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
          },
          title: Text(
            prod[index].toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: Text(usersBox.getAt(
            index,
          )[2]),
          subtitle: Text(
            usersBox
                .getAt(
                  index,
                )[1]
                .toString()
                .toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: Icon(
            Icons.person,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
