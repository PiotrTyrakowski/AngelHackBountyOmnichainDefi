<<<<<<< HEAD
@JS()
library my_lib; //Not avoid the library annotation

import 'package:js/js.dart';
import 'dart:js_util' as jsu;

@JS()
external RunDynamicContractMethod(
    String contract, String abi, String method, String kwargs);

class ContractAdapter {
  // true on failure, false otherwise
  static Future<bool> executeContractMethod(String contractId,
      String methodName, String kwargs, String contractAbi) async {
    var jsPromise =
        RunDynamicContractMethod(contractId, contractAbi, methodName, kwargs);
    String result = await jsu.promiseToFuture<String>(jsPromise);

    print(result);

    return result == "FAIL";
=======
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
>>>>>>> 0fcd17c002aa46823eb07411c861f6694d60cefa
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