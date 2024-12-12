class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  static String? _authToken;
  static String? _userId; // Variável para armazenar o userId

  static String? get authToken => _authToken;
  static String? get userId => _userId; // Método para acessar o userId

  static void setAuthToken(String token) {
    _authToken = token;
  }

  static void setUserId(String userId) {
    _userId = userId; // Método para definir o userId
  }

  static void clearSession() {
    _authToken = null;
    _userId = null; // Limpar o userId quando a sessão for apagada
  }
}
