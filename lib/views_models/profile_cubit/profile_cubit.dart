import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/profile_models.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getProfileData() {
    emit(ProfileLoading());

    Future.delayed(const Duration(seconds: 1), () {
      final profile = dummygeneral;
      emit(ProfileLoaded(profileModels: profile));
    });

    //emit(ProfileError(e.toString()));
  }
}
