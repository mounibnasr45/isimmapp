import 'package:dio/dio.dart';
import '../../../domain/marks.dart';

class MarksModelView {
  String studentId;
  int sem = 1;
  MarksModelView({required this.studentId});
  Future<List<MarksMessage>> getAllStudentMarks() async {
    List<MarksMessage> list1 =
        await MarksRepo.getAllNews(studentId, sem.toString());
    // if (DateTime.now().isAfter(DateTime(DateTime.now().year, 2, 15))) {
    //   sem = 2;
    // list1 +=
    //    await MarksRepo.getAllNews(studentId, sem.toString());

    // }

    return list1;
  }
}

class MarksRepo {
  static Future<List<MarksMessage>> getAllNews(
      String studentId, String sem) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/marks/ofStudent=$studentId/InSemester=$sem',
      );
      var marks = Marks.fromJson(response.data);
      if (marks.success! && marks.message!.isNotEmpty) return marks.message!;
    } catch (e) {
      print(e);
    }

    return [];
  }
}
