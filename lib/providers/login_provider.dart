import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpie_practical_interview/repo/login_repo.dart';

final loginProvider = AutoDisposeAsyncNotifierProvider(LoginNotifier.new);

class LoginNotifier extends AutoDisposeAsyncNotifier<void> {
  late final LoginRepo _repo = ref.read(loginRepo);

  @override
  FutureOr build() {}

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _repo.login(username, password));
  }
}
