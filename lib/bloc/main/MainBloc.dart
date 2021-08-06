import 'package:bpc_test/bloc/main/MainEvent.dart';
import 'package:bpc_test/bloc/main/MainState.dart';
import 'package:bpc_test/models/Transaction.dart';
import 'package:bpc_test/models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    add(MainLoad());
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    yield MainLoading();
    yield MainSuccess(userData: await _loadUser());

    if (event is DeleteTransaction)
    {
      yield MainLoading();
      _deleteTransaction(event.transaction);
      yield MainSuccess(userData: await _loadUser());
    }

    // if (event is MainCreateTask)
    // {
    //   yield MainLoading();
    //   _createTask(event.discription, event.title, event.user);
    //   yield MainSuccess(userData: await _loadUser());
    // }
  }
}

// void _editUser(String newName, String newLastname) async {
//   final databaseReference = FirebaseDatabase.instance.reference();
//   databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}").update({
//     'name': '$newName',
//     'lastname': '$newLastname'
//   });
// }

void _deleteTransaction(Transaction transaction) async {
  final databaseReference = FirebaseDatabase.instance.reference();
  await databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}/transactions/${transaction.id}").remove();
}

Future<UserData> _loadUser() async {
  final databaseReference = FirebaseDatabase.instance.reference();

  return databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}").once().then((DataSnapshot snapshot) {
    Map<String, dynamic> data = new Map<String, dynamic>.from(snapshot.value);
    
    UserData user =  UserData.fromMap(data);
    return user;
  });
}