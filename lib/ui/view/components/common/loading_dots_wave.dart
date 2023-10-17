import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';

class LoadingDotsWave extends StatelessWidget {
  final double size;
  const LoadingDotsWave({
    Key? key,
    required this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: const Color(CustomColor.mainTheme), 
        size: size
      )
    );
  }
}