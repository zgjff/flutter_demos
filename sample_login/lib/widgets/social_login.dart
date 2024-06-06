import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'background_text_button.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Continue with social media')
            .textColor(Colors.grey)
            .fontSize(18),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BackgroundTextButton(
                title: 'Facebook',
                color: Colors.blue[400],
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: BackgroundTextButton(
                title: 'Github',
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
