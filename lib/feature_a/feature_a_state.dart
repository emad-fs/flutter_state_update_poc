part of 'feature_a_cubit.dart';

@immutable
abstract class FeatureAState {}

class FeatureANotLoadedState extends FeatureAState {}

class FeatureALoadedState extends FeatureAState {
  FeatureALoadedState(this.param1, this.param2);

  final double param1;
  final double param2;
}
