class ContractInfo {
  String contractAddress;
  String ownerAddress;
  String contractDescription;
  String contractCode;
  List<FunctionArgument>? contractArguments;
  FunctionArgument? returnValue;

  ContractInfo(
    {
      required this.contractAddress,
      required this.ownerAddress,
      required this.contractDescription,
      required this.contractCode,
      this.contractArguments,
      this.returnValue
    }
  );
}

class FunctionArgument{
  String type;
  String name;

  FunctionArgument(
    {
      required this.type,
      required this.name
    }
  );
}
