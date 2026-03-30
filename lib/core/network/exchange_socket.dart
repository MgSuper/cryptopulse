abstract class ExchangeSocket {
  Stream<Map<String, dynamic>> connect({required List<String> symbols});
  void disconnect();
}
