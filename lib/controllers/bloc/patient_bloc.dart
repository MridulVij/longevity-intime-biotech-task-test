import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc() : super(PatientInitial()) {
    on<PatientEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
