part of 'onboarding_bloc.dart';

class OnboardingState {
  final int? page;
  OnboardingState({this.page});

  OnboardingState copyWith({int? page}) {
    return OnboardingState(page: page ?? 0);
  }
}
