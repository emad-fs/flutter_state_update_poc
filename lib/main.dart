import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_update_poc/feature_a/feature_a_cubit.dart';
import 'package:flutter_state_update_poc/feature_b/feature_b_cubit.dart';
import 'package:flutter_state_update_poc/feature_c/feature_c_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => FeatureACubit()),
          BlocProvider(create: (_) => FeatureBCubit()),
          BlocProvider(create: (_) => FeatureCCubit()),
        ],
        child: const POC(),
      ),
    );
  }
}

class POC extends StatefulWidget {
  const POC({Key? key}) : super(key: key);

  @override
  State<POC> createState() => _POCState();
}

class _POCState extends State<POC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('start'),
              onPressed: _startCalculations,
            ),
            BlocBuilder<FeatureCCubit, FeatureCState>(
              builder: (context, stateC) {
                return BlocBuilder<FeatureBCubit, FeatureBState>(
                  builder: (context, stateB) {
                    return BlocBuilder<FeatureACubit, FeatureAState>(
                      builder: (context, stateA) {
                        String featureA = 'loading';
                        String featureB = 'loading';
                        String featureC = 'loading';
                        if (stateB is FeatureBLoadedState) {
                          featureB = stateB.param1.toString();
                        }
                        if (stateC is FeatureCLoadedState) {
                          featureC = stateC.param1.toString();
                        }

                        if (stateA is FeatureALoadedState) {
                          featureA = stateA.param1.toString();
                        }
                        if (stateB is FeatureBLoadedState &&
                            stateC is FeatureCLoadedState) {
                          FeatureACubit featureACubit =
                              BlocProvider.of<FeatureACubit>(context);
                          featureACubit.calculateFinalResult(
                              stateB.param1, stateC.param1);
                        }
                        return Column(
                          children: [
                            Text('FeatureA: $featureA}'),
                            Text('FeatureB: $featureB}'),
                            Text('FeatureC: $featureC}'),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _startCalculations() {
    FeatureBCubit featureBCubit = BlocProvider.of<FeatureBCubit>(context);
    FeatureCCubit featureCCubit = BlocProvider.of<FeatureCCubit>(context);

    featureBCubit.fetchBValues();
    featureCCubit.fetchCValues();
  }
}
