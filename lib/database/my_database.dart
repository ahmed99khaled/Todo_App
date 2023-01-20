import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';
import 'package:todo/utils_package/date_utils.dart';

class MyDatabase {
  static CollectionReference<Task> getTasksCollection() {
    var tasksCollection = FirebaseFirestore.instance
        .collection('tasks')
        .withConverter<Task>(
            fromFirestore: (snapshot, options) =>
                Task.fromFireStore(snapshot.data()!),
            toFirestore: (task, options) => task.toFireStore());
    return tasksCollection;
  }

  static Future<void> insertTask(Task task) {
    var tasksCollection = getTasksCollection();
    var doc = tasksCollection.doc();
    task.id = doc.id;
    task.dateTime = MyDateUtils.extractDateOnly(task.dateTime);
    return doc.set(task);
  }

  static Future<List<Task>> getTasks(DateTime dateTime) async {
    var querySnapshot = await getTasksCollection()
        .where('dateTime',
            isEqualTo:
                MyDateUtils.extractDateOnly(dateTime).millisecondsSinceEpoch)
        .get();
    var tasksList = querySnapshot.docs.map((doc) => doc.data()).toList();
    return tasksList;
  }

  static Future<void> deleteTask(Task task) {
    var taskDoc = getTasksCollection().doc(task.id);
    return taskDoc.delete();
  }

  static Stream<QuerySnapshot<Task>> getTaskRealTimeUpdates(DateTime dateTime) {
    return MyDatabase.getTasksCollection()
        .where('dateTime',
            isEqualTo:
                MyDateUtils.extractDateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> markAsDone(Task task) {
    return getTasksCollection()
        .doc(task.id)
        .update({'isDone': task.isDone == true ? false : true});
  }

  static Future<void> updateTask(Task task) async {
    return await getTasksCollection().doc(task.id).update({
      'title': task.title,
      'description': task.description,
      'dateTime':
          MyDateUtils.extractDateOnly(task.dateTime).millisecondsSinceEpoch
    });
  }
}
