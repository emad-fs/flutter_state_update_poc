import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feature_b_state.dart';

class FeatureBCubit extends Cubit<FeatureBState> {
  FeatureBCubit() : super(FeatureBNotLoadedState());

  Future<void> fetchBValues() async {
    double param1 = await Future<double>.delayed(const Duration(seconds: 3),() => 3,);
    double param2 = await Future<double>.delayed(const Duration(seconds: 1),() => 1,);
    emit(FeatureBLoadedState(param1, param2));
  }
}
