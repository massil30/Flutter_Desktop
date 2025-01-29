import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sina/model/model.dart';
import 'package:sina/view/Home.dart';
import 'package:sina/view/detailPage.dart';
import 'package:sina/view/search.dart';

Box usersBox;

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersBox = Hive.box("Users");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Home();
              },
            ));
          },
        ),
        title: Text("voir tous les utilisateurs et rechercher"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  showSearch(context: context, delegate: Search());
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Search Button",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: usersBox.length,
                itemBuilder: (context, index) {
                  var u = usersBox.getAt(index);
                  return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
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
                      },
                      leading: Text(usersBox
                          .getAt(
                            index,
                          )[0]
                          .toString()
                          .toUpperCase()),
                      title: Text(
                          usersBox.getAt(index)[1].toString().toUpperCase()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
