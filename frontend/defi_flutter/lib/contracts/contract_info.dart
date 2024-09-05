class ContractInfo {
  String contractAddress;
  String ownerAddress;
  String contractDescription;
  String contractTitle;
  String contractCode;
  int numberOfLikes; 
  bool isLiked = false;

  ContractInfo(
    {
      required this.contractAddress,
      required this.ownerAddress,
      required this.contractDescription,
      required this.contractTitle,
      required this.contractCode,
      required this.numberOfLikes,
      this.isLiked = false
    }
  );
}

