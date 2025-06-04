part of '../global_widgets.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  const AppScaffold({
    super.key,
    required this.body,
    this.isLoading = false,
    this.appBar,
    this.bottomNavigationBar,
  });
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: AbsorbPointer(
        absorbing: isLoading,
        child: Stack(
          children: [
            Opacity(opacity: isLoading ? 0.4 : 1.0, child: body),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
