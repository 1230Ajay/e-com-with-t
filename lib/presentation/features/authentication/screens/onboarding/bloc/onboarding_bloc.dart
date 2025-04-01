import 'package:bloc/bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<UpdatePageIndecator>((event, emit) {
      emit(state.copyWith(page: event.index));
    });
  }
}
