import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import 'main_screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainScreenCubit(),
      child: Builder(
        builder: (ctx) => _buildScaffold(ctx),
      ),
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<MainScreenCubit, MainScreenInitial>(
          builder: (_, state) {
            return Text('Click ${state.value()} times')
                .fontSize(20)
                .textColor(Colors.red);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<MainScreenCubit>().increment(),
        child: const Icon(Icons.add).iconColor(Colors.orange),
      ),
    );
  }
}
