import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/pokemonListResponse.dart';
import 'package:flutter_app/data/models/pokemonListResult.dart';
import 'package:flutter_app/data/provider/pokemonProvider.dart';
import 'package:flutter_app/data/repository/pokemonRepository.dart';

import 'pokemonDetailsPage.dart';

class PokemonListPage extends StatefulWidget {
  PokemonListPage({Key key, this.title}) : super(key: key);
  static const routeName = "/home";

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  Future<PokemonListResponse> pokemonListResponse;

  @override
  void initState() {
    super.initState();
    pokemonListResponse = PokemonRepository().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: pokemonListResponse,
            builder: (BuildContext context,
                AsyncSnapshot<PokemonListResponse> data) {
              if (data.hasData) {
                PokemonListResponse pokemonList = data.data;
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: PokemonProvider.ITEM_PER_PAGE,
                  itemBuilder: (context, index) {
                    PokemonListResult pokemonResult =
                        pokemonList.results[index];

                    if (pokemonResult != null) {
                      return ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, PokemonDetailsPage.routeName,
                            arguments: pokemonResult),
                        leading: Text('#' +
                            pokemonResult.url.replaceAll(
                                new RegExp(
                                    r'(\/)|(https:\/\/pokeapi.co\/api\/v2\/pokemon\/)'),
                                '')),
                        title: Text(StringUtils.capitalize(pokemonResult.name)),
                        trailing: Icon(Icons.arrow_right),
                      );
                    } else {
                      return Container();
                    }
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                );
              } else {
                return Container(width: 0.0, height: 0.0);
              }
            }),
      ),
    );
  }
}
