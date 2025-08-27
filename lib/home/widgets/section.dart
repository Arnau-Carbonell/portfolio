import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: _AnimatedEntrance(child: child),
        ),
      ),
    );
  }
}

class _AnimatedEntrance extends StatefulWidget {
  const _AnimatedEntrance({required this.child});
  final Widget child;

  @override
  State<_AnimatedEntrance> createState() => _AnimatedEntranceState();
}

class _AnimatedEntranceState extends State<_AnimatedEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );
  late final Animation<double> _opacity =
  CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
  late final Animation<Offset> _offset = Tween(
    begin: const Offset(0, .06),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 80), _c.forward);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _offset, child: widget.child),
    );
  }
}