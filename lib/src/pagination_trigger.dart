import 'package:flutter/material.dart';

/// A zero-size widget that detects when the user scrolls close to its position
/// and triggers a callback based on a threshold, without adding visual whitespace.
class PaginationTrigger extends StatefulWidget {
  final VoidCallback onTrigger;
  final double threshold;

  const PaginationTrigger({
    super.key,
    required this.onTrigger,
    this.threshold = 200,
  });

  @override
  State<PaginationTrigger> createState() => _PaginationTriggerState();
}

class _PaginationTriggerState extends State<PaginationTrigger> {
  ScrollPosition? _position;

  @override
  void didUpdateWidget(PaginationTrigger oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.threshold != widget.threshold) {
      _hasTriggered = false;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _detach();
    _position = Scrollable.maybeOf(context)?.position;
    _position?.addListener(_onScroll);
  }

  @override
  void dispose() {
    _detach();
    super.dispose();
  }

  void _detach() {
    _position?.removeListener(_onScroll);
  }

  bool _hasTriggered = false;

  void _onScroll() {
    if (_position == null ||
        !_position!.hasContentDimensions ||
        _hasTriggered) {
      return;
    }

    // Trigger when user scrolls within [threshold] distance from the bottom
    if (_position!.pixels >= _position!.maxScrollExtent - widget.threshold) {
      _hasTriggered = true;
      widget.onTrigger();
    }
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
