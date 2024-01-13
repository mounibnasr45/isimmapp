import 'package:dio/dio.dart';

import 'groupcard.dart';
import 'groupeteacher.dart';
import 'newsmodel.dart';

class NewsModelView {
  List<String> selectedNewsGroup(List<GroupCard> glist) {
    List<String> list = [];
    for (int i = 0; i < glist.length; i++) {
      if (glist[i].state.isTapped()) {
        list.add(glist[i].state.id);
      }
    }
    return list;
  }

  Future<List<TGroup>> showConcernedGroup(String teacherId) async {
    var list = await NewsRepo.getGroup(teacherId);
    return list;
  }

  Future<String> postNewsToGroups(
      String id, NMessage body, List<String> groups) async {
    bool response = await NewsRepo.postNews(body, id, groups);
    if (response) {
      return "Sent to the According group(s)...";
    }
    return "Something went wrong!";
  }
}

class NewsRepo {
  static Future<List<NMessage>> getAllNews(String groupId) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/news/ofGroup/$groupId',
      );
      var news = NewsOfGroup.fromJson(response.data);
      if (news.success! && news.message!.isNotEmpty) return news.message!;
    } catch (e) {
      print(e);
    }

    return [
      NMessage(
        object: "No News yet",
        message: "It may be out of connection or There are no news",
        sender: null,
        //TMessage(name: "Classtek", lastName: "App")
      )
    ];
  }

  static Future<List<TGroup>> getGroup(String teacherId) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/teacher/$teacherId/groups',
      );
      var groups = GroupOfTeacher.fromJson(response.data);
      if (groups.success! && groups.message!.isNotEmpty) return groups.message!;
    } catch (e) {
      print(e);
    }

    return [];
  }

  static Future<bool> postNews(
      NMessage news, String id, List<String> groups) async {
    try {
      var response = await Dio().post(
          'https://schoolsystemmanagement-production-9724.up.railway.app/news/create',
          data: {
            'teacher_Id': id,
            'object': news.object,
            'message': news.message,
            'groups': groups
          });

      return response.data['success'];
    } catch (e) {
      print(e);
    }
    return false;
  }
}
