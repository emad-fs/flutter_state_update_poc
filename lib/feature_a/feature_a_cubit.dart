import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feature_a_state.dart';

/// CubitA needs some data from FeatureB and FeatureC.
class FeatureACubit extends Cubit<FeatureAState> {
  FeatureACubit() : super(FeatureANotLoadedState());

  /// This function does not know if [param1B] and [param1C] come from futures.
  /// just do the calculations based on input parameters.
  void calculateFinalResult(double param1B, double param1C) {
    emit(FeatureALoadedState(param1B + param1C, -1));
  }
}
