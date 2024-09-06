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
  }
}
