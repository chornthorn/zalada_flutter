import 'package:flutter/material.dart';

class LazyListView extends StatefulWidget {
  const LazyListView({
    super.key,
    required this.children,
    this.fixedSize,
    this.physics,
    this.scrollDirection,
    this.shrinkWrap,
    this.cacheExtent = 1000,
  });

  final List<Widget> children;
  final int? fixedSize;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final bool? shrinkWrap;
  final double cacheExtent;

  @override
  State<LazyListView> createState() => _LazyListViewState();
}

class _LazyListViewState extends State<LazyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: widget.cacheExtent,
      physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
      scrollDirection: widget.scrollDirection ?? Axis.vertical,
      shrinkWrap: widget.shrinkWrap ?? false,
      itemCount: widget.fixedSize ?? widget.children.length,
      itemBuilder: (context, index) {
        return widget.children[index];
      },
    );
  }
}
