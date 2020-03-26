import 'package:flutter_app/data/provider/genericProvider.dart';

class GenericRepository {
  Future<dynamic> getFoo() => GenericProvider().getFoo();
}
