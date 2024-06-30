import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import 'more_action_bloc.dart';

class MoreActionScreenScreen extends StatelessWidget {
  const MoreActionScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreActionBloc(),
      child: Builder(
        builder: (ctx) => _builderPage(ctx),
      ),
    );
  }

  Widget _builderPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionShowItem(
                content: 'First',
                iconData: Icons.add_circle_outline,
                onPressed: () {
                  context.read<MoreActionBloc>().add(const AddActionEvent());
                },
              ),
              ActionShowItem(
                content: 'Second',
                iconData: Icons.remove_circle_outline,
                onPressed: () {
                  context.read<MoreActionBloc>().add(const ReduceActionEvent());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActionShowItem extends StatelessWidget {
  const ActionShowItem({
    super.key,
    required this.content,
    required this.iconData,
    required this.onPressed,
  });

  final String content;
  final IconData iconData;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<MoreActionBloc, MoreActionState>(builder: (_, state) {
          return Text('$content click ${state.value()} times')
              .textColor(Colors.red)
              .fontSize(20);
        }),
        IconButton(
          onPressed: onPressed,
          icon: Icon(iconData),
          color: Colors.blue,
        ),
      ],
    );
  }
}
