abstract class IAuthRepository {
  Future<String?> getUser();
  Future login(String email, String password);
  Future signUp(String email, String password);
  logout();
}
