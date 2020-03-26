import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/pokemon.dart';
import 'package:flutter_app/data/models/pokemonListResult.dart';
import 'package:flutter_app/data/provider/pokemonProvider.dart';

class PokemonDetailsPage extends StatelessWidget {
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final PokemonListResult pokemonResult =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonResult.name),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: PokemonProvider().getPokemon(pokemonResult.url),
        builder: (BuildContext context, AsyncSnapshot<Pokemon> data) {
          if (data.hasData) {
            Pokemon pokemon = data.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (pokemon.sprites.frontDefault != null)
                      Image.network(
                        pokemon.sprites.frontDefault,
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                      ),
                    if (pokemon.sprites.frontFemale != null)
                      Image.network(
                        pokemon.sprites.frontFemale,
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                      ),
                    if (pokemon.sprites.frontShiny != null)
                      Image.network(
                        pokemon.sprites.frontShiny,
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                      ),
                    if (pokemon.sprites.frontShinyFemale != null)
                      Image.network(
                        pokemon.sprites.frontShinyFemale,
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                      ),
                  ],
                ),
                Text(pokemon.types.first.type.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      backgroundColor: Color(pokemon.types.first.slot),
                    )),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        title: Text('Height'),
                        subtitle: Text(pokemon.height.toString()),
                      ),
                    ),
                    Flexible(
                        child: ListTile(
                      title: Text('Weight'),
                      subtitle: Text(pokemon.weight.toString()),
                    )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border(
                          bottom: BorderSide(),
                          left: BorderSide(),
                          top: BorderSide(),
                          right: BorderSide())),
                  child: Text(
                    pokemon.toString(),
                  ),
                )
              ],
            );
          } else {
            return Container(
              height: 0.0,
              width: 0.0,
            );
          }
        },
      ),
    );
  }
}
