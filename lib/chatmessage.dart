import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key,
      required this.sender,
      required this.text,
      this.isImage = false})
      : super(key: key);

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == 'user' ? Vx.red200 : Vx.green200)
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: isImage
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    text,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const CircularProgressIndicator.adaptive(),
                  ),
                )
              : text.trim().text.bodyText1(context).make().px8(),
        ),
      ],
    ).py16();
  }
}