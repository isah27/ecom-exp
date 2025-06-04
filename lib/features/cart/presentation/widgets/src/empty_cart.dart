part of '../cart_widgets.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        AppText(text: "No items in the cart yet!"),
        AppButton(
          text: "Continue Shopping",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
