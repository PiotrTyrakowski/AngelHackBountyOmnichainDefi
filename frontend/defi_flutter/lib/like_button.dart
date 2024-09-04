import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool initialIsLiked;
  final VoidCallback onTap;

  const LikeButton({
    super.key,
    required this.initialIsLiked,
    required this.onTap,
  });

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.initialIsLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLiked = !_isLiked;
        });
        widget.onTap();
      },
      child: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: _isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}