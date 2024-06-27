import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class MovieCoverImage extends StatelessWidget {
  const MovieCoverImage({
    super.key,
    required this.pic,
  });

  final String pic;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      pic,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.grey.shade200,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ],
          ),
        );
      },
      errorBuilder: (context, _, stackTrace) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Movie pic url is error, Please replace')
                .fontSize(30)
                .textColor(Colors.red)
                .textAlignment(TextAlign.center)
                .expanded(),
          ],
        );
      },
    );
  }
}
