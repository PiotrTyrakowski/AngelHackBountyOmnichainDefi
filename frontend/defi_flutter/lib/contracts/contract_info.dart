import 'dart:convert';

class ContractInfo {
  String contractAddress;
  String contractDescription;
  String contractTitle;
  String contractCode;
  String contractAbi;
  int numberOfLikes;
  bool isLiked = false;

  ContractInfo(
      {required this.contractAddress,
      required this.contractDescription,
      required this.contractTitle,
      required this.contractCode,
      required this.contractAbi,
      required this.numberOfLikes,
      this.isLiked = false});

  List<(String, List<(String, String)>)> getContractMethods() {
    Map<String, dynamic> jsonMap = json.decode(contractAbi);
    List<dynamic> abi = jsonMap['abi'];

    List<(String, List<(String, String)>)> functionInfo = [];

    for (var item in abi) {
      if (item['type'] == 'function') {
        String functionName = item['name'];
        List<(String, String)> inputs = [];

        for (var input in item['inputs']) {
          inputs.add((input['name'], input['type']));
        }

        functionInfo.add((functionName, inputs));
      }
    }

    return functionInfo;
  }
}
