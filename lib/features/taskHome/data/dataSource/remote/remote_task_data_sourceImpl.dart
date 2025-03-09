import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_flutter/features/taskHome/data/dataSource/remote/remote_task_datasourece.dart';
import 'package:todo_flutter/features/taskHome/data/models/task_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/utils/constants.dart';

class RemoteTaskDataSourceImpl implements TaskDataSource {
  final http.Client _client;

  RemoteTaskDataSourceImpl(this._client);

  @override
  Future<void> createTask({required String title,
    required String tag,
    required DateTime createdAt}) async {
final String createdAtString=createdAt.toIso8601String();
final body=jsonEncode({
  "tag":tag,
  "title":title,
  "createdAt":createdAtString,
});
try {
  final response= await _client.post(Uri.parse('$kBaseUrl/tasks'),
    body: body,
    headers: {
      "content-type": "application/json",
    },
  );
  if(!_isRequestSuccess(response.statusCode)){
    throw APIException(errorMessage: response.body, statusCode: response.statusCode);
  }

}
on APIException catch (e) {

  rethrow;
}
catch (e) {
  throw APIException(errorMessage: (e.toString()), statusCode: 505);
}
   }

  @override
  Future<List<TaskModel>> getTasks() async{

 try {
   final response = await _client.get(Uri.parse('$kBaseUrl/tasks'));
   if (!_isRequestSuccess(response.statusCode)) {
     throw APIException(
         errorMessage: response.body, statusCode: response.statusCode);
   }
   final responseBody = response.body;
   final responceObj = jsonDecode(responseBody) as List<dynamic>;

   final result = responceObj.map((obj) => TaskModel.fromMap(obj)).toList();
   return result;
 }on APIException catch (e) {

   rethrow;
 }
 catch(e){
   throw APIException(errorMessage: e.toString(), statusCode: 505);
 }
 }


bool _isRequestSuccess(int statusCode){
  return statusCode>=200 && statusCode<300;
  }
}