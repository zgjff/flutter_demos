part of 'index.dart';

extension FastCreate on ElevatedButton {
  /// radius为8的RoundedRectangleBorder形状的按钮, 且文字上下padding为12
  // static ElevatedButton radius(
  //     {VoidCallback? onPressed, Color? backgroundColor, Widget? child}) {
  //   return ElevatedButton(
  //     onPressed: onPressed,
  //     style: ButtonStyle(
  //       backgroundColor: WidgetStateProperty.all(backgroundColor),
  //       elevation: WidgetStateProperty.all(0),
  //       padding: WidgetStateProperty.all(
  //         const EdgeInsets.symmetric(vertical: 12),
  //       ),
  //       shape: WidgetStateProperty.all(
  //         RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //       ),
  //     ),
  //     child: child,
  //   );
  // }

  static ElevatedButton radius() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Text('ss'),
    );
  }
}
