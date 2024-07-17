import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part './auth_event.dart';
part './auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _storage = const FlutterSecureStorage();

  AuthBloc() : super(AuthState(token: null));

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SetToken) {
      yield AuthState(token: event.token);
      await _storage.write(key: 'token', value: event.token);
    } else if (event is ClearToken) {
      yield AuthState(token: null);
      await _storage.delete(key: 'token');
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }
}
