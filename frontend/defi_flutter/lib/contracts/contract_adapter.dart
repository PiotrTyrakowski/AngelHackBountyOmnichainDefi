class ContractAdapter {
  // lista
  static List<(String, List<(String, String)>)> getContractMethods(
      String contractId) {
    return [];
  }

  // true on failure, false otherwise
  static bool executeContractMethod(
      String contractId, String methodName, List<(String, String)> args) {
    return true;
  }
}
