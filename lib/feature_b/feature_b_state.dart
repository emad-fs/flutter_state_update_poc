part of 'feature_b_cubit.dart';

@immutable
abstract class FeatureBState {}

class FeatureBNotLoadedState extends FeatureBState {}

class FeatureBLoadedState extends FeatureBState {
  FeatureBLoadedState(this.param1, this.param2);

  final double param1;
  final double param2;
}