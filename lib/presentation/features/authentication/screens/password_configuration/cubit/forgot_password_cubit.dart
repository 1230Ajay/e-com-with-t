import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tapp/comman/widgets/popups/app_toast.dart';
import 'package:tapp/data/features/authentication/models/email.dart';
import 'package:tapp/domain/features/authentication/usecases/send_reset_password_email.dart';
import 'package:tapp/service_locator.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState());

  void updateEmail(String email){
    emit(state.copyWith(email:email));
  }

  Future<void> sendResetPasswordEmail()async{

    Map<String,dynamic> errors = {
      "email": this._validateEmail(state.email)
    };

    bool isValidated = errors.values.every((e)=>e==null);

    emit(state.copyWith(forgotPasswordErrors: errors));

    if(isValidated){
      emit(state.copyWith(forgotPasswordEmailStatus: ForgotPasswordEmailStatus.SENDING));
      final res =  await ServiceLocator.instance.getIt<SendResetPasswordEmailUseCase>().call(params: EmailParams(email: state.email));
      res.fold((error){
        AppToast.showToast(error);
        emit(state.copyWith(forgotPasswordEmailStatus: ForgotPasswordEmailStatus.INITIAL));
      }, (_){
        emit(state.copyWith(forgotPasswordEmailStatus: ForgotPasswordEmailStatus.SENT));
      });
    }
  }



  String? _validateEmail(String value) => value.contains('@') & value.contains("gmail.com") ? null : "Enter a valid email";

}
