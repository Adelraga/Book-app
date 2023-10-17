import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    /* with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }
*/

    controller.forward();
    Future.delayed(const Duration(seconds: 4), () {
      // Get.to(() => const HomeView(),
      //     transition: Transition.fadeIn, duration: Duration(seconds: 2));

      // context.go('/homeView');
      GoRouter.of(context).push('/homeView');
    });
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeTransition(
          opacity: animation,
          child: Image.asset(
            AssetsData.logo,
            width: 250,
          ),
        ),
        FadeTransition(
          opacity: animation,
          child: Text(
            'Read Free Books',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

void navigateToHome() {}
