import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feature_c_state.dart';

class FeatureCCubit extends Cubit<FeatureCState> {
  FeatureCCubit() : super(FeatureCNotLoadedState());

  Future<void> fetchCValues() async {
    double param1 = await Future<double>.delayed(const Duration(milliseconds: 500),() => 4,);
    double param2 = await Future<double>.delayed(const Duration(milliseconds: 500,),() => 1,);

    emit(FeatureCLoadedState(param1, param2));
  }
}
