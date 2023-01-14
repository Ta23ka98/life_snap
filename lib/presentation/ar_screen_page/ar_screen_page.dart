import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/presentation/ar_screen_page/ar_screen_page_notifier.dart';
import 'package:ar_location_view/ar_location_view.dart';
import 'package:life_snap/presentation/ar_screen_page/widgets/post_card.dart';
import 'package:life_snap/state/annotation_state/annotation.dart';

class ArScreenPage extends HookConsumerWidget {
  const ArScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(arScreenPageNotifierProvider.notifier);
    final state = ref.watch(arScreenPageNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("LifeSnap"),
          centerTitle: true,
        ),
        body: ArLocationWidget(
            annotations: state.annotations,
            showDebugInfoSensor: false,
            radarPosition: RadarPosition.bottomRight,
            radarWidth: 100,
            annotationWidth: 250,
            annotationHeight: 350,
            annotationViewBuilder: (context, annotation) {
              return PostCard(
                key: ValueKey(annotation.uid),
                annotation: annotation as Annotation,
              );
            },
            onLocationChange: (Position position) async {
              Future.delayed(const Duration(milliseconds: 0), () async {
                await vm.getAnnotations(position);
              });
            }));
  }
}
