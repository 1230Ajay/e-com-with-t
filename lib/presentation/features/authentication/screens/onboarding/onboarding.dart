import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/data/data_onboarding.dart';
import 'package:tapp/presentation/features/authentication/screens/onboarding/widgets/onboarding_dots_indecator.dart';
import 'package:tapp/presentation/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:tapp/presentation/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:tapp/presentation/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';

import 'bloc/onboarding_bloc.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;

  @override
  void didChangeDependencies() {
    _pageController = PageController(initialPage: 0);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            /// Horizontal Scrollable Pages
            PageView(
              controller: _pageController,
              onPageChanged: (index) => context
                  .read<OnboardingBloc>()
                  .add(UpdatePageIndecator(index: index.toInt())),
              children: OnboardingData.getOnboardingData()
                  .map((page) => OnboardingPage(data: page))
                  .toList(),
            ),

            /// Skip Button
            OnBoardingSkip(),

            /// Dot Navigation
            DotsIndicator(_pageController),

            /// right button
            NextButton(_pageController, state)
          ],
        ),
      );
    });
  }
}
