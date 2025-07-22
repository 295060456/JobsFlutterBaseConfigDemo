import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/pages/Others/RouteAwareBase.dart';

/// PageA
class PageA extends RouteAwareStatefulPage {
  const PageA({super.key, super.onTap, super.buttonChild})
      : super(title: 'Page A');

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends RouteAwareState<PageA> {}

/// PageB
class PageB extends RouteAwareStatefulPage {
  const PageB({super.key, super.onTap, super.buttonChild})
      : super(title: 'Page B');

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends RouteAwareState<PageB> {}

/// PageC
class PageC extends RouteAwareStatefulPage {
  const PageC({super.key, super.onTap, super.buttonChild})
      : super(title: 'Page C');

  @override
  State<PageC> createState() => _PageCState();
}

class _PageCState extends RouteAwareState<PageC> {}
