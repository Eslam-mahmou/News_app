
import 'package:injectable/injectable.dart';

import '../../Models/source_model.dart';

abstract class SourceRepository{
Future<List<Source>>getSources(String categoryId);
}