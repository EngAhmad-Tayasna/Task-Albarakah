import 'package:hive/hive.dart';

import 'result_model.dart';

part 'handle_model.g.dart';

@HiveType(typeId: 1)
class HandleModel extends ResultModel {
  @HiveField(0)
  String message;

  HandleModel({
    required this.message,
  });

  @override
  String toString() => 'HandleModel(message: $message)';
}
