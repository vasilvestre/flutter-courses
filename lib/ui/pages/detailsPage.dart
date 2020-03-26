import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/rickAndMortyResultList.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = "/detailChar";

  @override
  Widget build(BuildContext context) {
    final Characters character = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(character.name),
          //leading: Image.network(character.image),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
              child: Column(
            children: <Widget>[
              Image.network(character.image),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Status")),
                  Expanded(
                      child: Text(character.status, textAlign: TextAlign.right))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Species")),
                  Expanded(
                      child:
                      Text(character.species, textAlign: TextAlign.right)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Gender")),
                  Expanded(
                      child: Text(character.gender, textAlign: TextAlign.right))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Origin"),
                  ),
                  Expanded(
                      child: Text(
                        character.origin.name,
                        textAlign: TextAlign.right,
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Last Location")),
                  Expanded(
                      child: Text(character.location.name,
                          textAlign: TextAlign.right)),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: character.episode.length + 1,
                  itemBuilder: (context, episodePosition) {
                    if (episodePosition == 0) {
                      return Text("Is in following episodes");
                    }
                    if (character.episode[episodePosition - 1] != null) {
                      return Text(character.episode[episodePosition - 1]);
                    } else
                      return Text("");
                  },
                  separatorBuilder: (context, index) =>
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                ),
              )
            ],
              )),
        ));
  }
}

class TitleWidget extends Widget {
  @override
  Element createElement() {
    // TODO: implement createElement
    return null;
  }
}
