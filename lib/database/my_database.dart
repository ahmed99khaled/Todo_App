import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';

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
    return doc.set(task);
  }

  static Future<List<Task>> getTasks() async {
    var querySnapshot = await getTasksCollection().get();
    var tasksList = querySnapshot.docs.map((doc) => doc.data()).toList();
    return tasksList;
  }

  static Future<void> deleteTask(Task task) {
    var taskDoc = getTasksCollection().doc(task.id);
    return taskDoc.delete();
  }

  static Stream<QuerySnapshot<Task>> getTaskRealTimeUpdates() {
    return MyDatabase.getTasksCollection().snapshots();
  }

  static Future<void> markAsDone(Task task) {
    return getTasksCollection().doc(task.id).update({'isDone': true});
  }
}
