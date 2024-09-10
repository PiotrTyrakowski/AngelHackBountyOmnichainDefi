@JS()
library my_lib; //Not avoid the library annotation

import 'package:js/js.dart';
import 'dart:js_util' as jsu;
import 'dart:js' as js;

@JS('RunDynamicContractMethod')
external RunDynamicContractMethod(
    String contract, String abi, String method, String jsonArgNames, String jsonArgTypes, String jsonArgValues);

class ContractAdapter {
  // true on failure, false otherwise
  static Future<String> executeContractMethod(String contractAbi, String contractId,
      String methodName, String jsonArgNames, String jsonArgTypes, String jsonArgValues) async {
    var jsPromise =
       RunDynamicContractMethod(contractId, contractAbi, methodName, jsonArgNames, jsonArgTypes, jsonArgValues);
    
    String result = await jsu.promiseToFuture<String>(jsPromise);

    print(result);

    return result;
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