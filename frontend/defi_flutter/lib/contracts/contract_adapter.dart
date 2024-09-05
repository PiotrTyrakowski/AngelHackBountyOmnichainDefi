class ContractAdapter {
  // lista
  static List<(String, List<(String, String)>)> getContractMethods(
      String contractId) {
    return smartContractMethods;
  }

  // true on failure, false otherwise
  static bool executeContractMethod(
      String contractId, String methodName, List<(String, String)> args) {
    return true;
  }
}

  List<(String, List<(String, String)>)> smartContractMethods = [
    (
      'transfer',
      [
        ('recipient', 'address'),
        ('amount', 'uint256')
      ]
    ),
    (
      'approve',
      [
        ('spender', 'address'),
        ('amount', 'uint256')
      ]
    ),
    (
      'allowance',
      [
        ('owner', 'address'),
        ('spender', 'address')
      ]
    ),
    (
      'mint',
      [
        ('to', 'address'),
        ('amount', 'uint256')
      ]
    ),
    (
      'burn',
      [
        ('amount', 'uint256')
      ]
    ),
    (
      'setApprovalForAll',
      [
        ('operator', 'address'),
        ('approved', 'bool')
      ]
    ),
    (
      'safeTransferFrom',
      [
        ('from', 'address'),
        ('to', 'address'),
        ('tokenId', 'uint256')
      ]
    ),
    (
      'getApproved',
      [
        ('tokenId', 'uint256')
      ]
    ),
    (
      'balanceOf',
      [
        ('owner', 'address')
      ]
    ),
    (
      'totalSupply',
      []
    )
  ];