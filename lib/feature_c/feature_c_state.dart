part of 'feature_c_cubit.dart';

@immutable
abstract class FeatureCState {}

class FeatureCNotLoadedState extends FeatureCState {}

class FeatureCLoadedState extends FeatureCState {
  FeatureCLoadedState(this.param1, this.param2);

  final double param1;
  final double param2;
}