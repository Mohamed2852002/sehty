import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/hive_helper.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final HiveHelper _hiveHelper = HiveHelper.instance;
  static const String _boxName = 'settings';
  static const String _keyLanguage = 'language';

  ProfileBloc() : super(const ProfileInitial()) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<GetSavedLanguageEvent>(_onGetSavedLanguage);
  }

  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    await _hiveHelper.put(_boxName, _keyLanguage, event.locale);
    emit(LanguageChangedState(event.locale));
  }

  Future<void> _onGetSavedLanguage(
    GetSavedLanguageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final String? savedLanguage = await _hiveHelper.get<String>(
      _boxName,
      _keyLanguage,
    );
    emit(LanguageChangedState(savedLanguage ?? 'ar'));
  }
}
