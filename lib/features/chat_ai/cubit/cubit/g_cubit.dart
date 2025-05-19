import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'g_state.dart';

class GCubit extends Cubit<GState> {
  GCubit() : super(GInitial());
}
