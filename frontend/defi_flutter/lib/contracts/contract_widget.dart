import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:defi_flutter/like_button.dart';
import 'package:flutter/material.dart';

class ContractWidget extends StatefulWidget {
  final ContractInfo _info;
  final VoidCallback? onClick;

  const ContractWidget({
    super.key,
    required ContractInfo info,
    this.onClick,
  }) : _info = info;

  @override
  _ContractWidgetState createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget> {
  @override
  void initState() {
    super.initState();
  }

  void _handleLikeButtonTap() {
    setState(() {
      widget._info.likes = widget._info.isLiked ? widget._info.likes - 1 : widget._info.likes + 1;
      widget._info.isLiked = !widget._info.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: InkWell(
        onTap: widget.onClick,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    _toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        LikeButton(
                          initialIsLiked: widget._info.isLiked,
                          onTap: _handleLikeButtonTap,
                        ),
                        Text(widget._info.likes.toString())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _toString() {
    return "Smart contract address: ${widget._info.contractAddress}\nSmart contract owner address ${widget._info.ownerAddress}";
  }
}