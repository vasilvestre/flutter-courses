import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/repository/RickAndMortyRepository.dart';
import 'package:flutter_app/models/rickAndMortyResultList.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'detailsPage.dart';

class RickAndMortyListPage extends StatefulWidget {
  RickAndMortyListPage({Key key, this.title}) : super(key: key);
  static const String routeName = '/list';

  final String title;

  @override
  _RickAndMortyListPageState createState() => _RickAndMortyListPageState();
}

class _RickAndMortyListPageState extends State<RickAndMortyListPage> {
  Future<RickAndMortyResultList> rickAndMortyListResponse;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    rickAndMortyListResponse = RickAndMortyRepository().getAll(1);
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
                future: rickAndMortyListResponse,
                builder: (BuildContext context,
                    AsyncSnapshot<RickAndMortyResultList> data) {
                  if (data.hasData) {
                    RickAndMortyResultList rickAndMortyList = data.data;
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: rickAndMortyList.results.length,
                      itemBuilder: (context, index) {
                        Characters rickAndMortyCharacter =
                            rickAndMortyList.results[index];
                        if (rickAndMortyCharacter != null) {
                          return ListTile(
                            onTap: () => Navigator.pushNamed(
                                context, DetailsPage.routeName,
                                arguments: rickAndMortyCharacter),
                            leading: CachedNetworkImage(
                              imageUrl: rickAndMortyCharacter.image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: imageProvider)),
                              ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            title: Text(rickAndMortyCharacter.name),
                            trailing: Text('Crée le ' +
                                DateFormat("d/MM/yyyy").format(DateTime.parse(
                                    rickAndMortyCharacter.created))),
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
                })));
  }
}
