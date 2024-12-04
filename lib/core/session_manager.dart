class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  static String? _authToken;

  static String? get authToken => _authToken;

  static void setAuthToken(String token) {
    _authToken = token;
  }

  static void clearSession() {
    _authToken = null;
  }
}
