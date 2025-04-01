part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {
  const OnboardingEvent();
}

class UpdatePageIndecator extends OnboardingEvent {
  int index;
  UpdatePageIndecator({required this.index});
}
