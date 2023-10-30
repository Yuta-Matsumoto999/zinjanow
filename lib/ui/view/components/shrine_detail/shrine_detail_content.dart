import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/shrine/shrine_detail_notifier.dart';
import 'package:zinjanow_app/ui/view/components/common/loading_dots_wave.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/google_map_view.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/guidance.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/img_slider.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/review_list.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/start_bar.dart';

class ShrineDetailContent extends ConsumerWidget {
  const ShrineDetailContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final state = ref.watch(shrineDetailNotifierProvider);

    return state.when(
      data: (shrine) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(shrine.name!, style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      shrine.rating != null ?
                      Container(
                        child: Text(shrine.rating.toString(), style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),),
                      )
                      : const SizedBox(),
                      shrine.rating != null ?
                      StartBar(
                        rating: shrine.rating,
                      )
                      : const SizedBox()
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 5,
              indent: 0,
              endIndent: 5,
            ),
            GoogleMapView(
              lat: shrine.lat!,
              lng: shrine.lng!,
            ),
            Guidance(
              name: shrine.name!,
              address: shrine.address!,
              distance: shrine.distance!,
              duration: shrine.duration!,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text("Photos", style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),),
            ),
            ImgSlider(photos: shrine.photos!),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text("Reviews", style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),),
            ),
            shrine.reviews != null
            ?  ReviewList(
              reviews: shrine.reviews!,
            )
            : Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text("レビューはありません。"),
            ),
          ],
        );
      },
      error: (_, error) {
        return const Text("error!!!");
      }, 
      loading: () {
        return Container(
          width: size.width,
          height: size.height * 0.1,
          child: const LoadingDotsWave(size: 50)
        );
      }
    );
  }
}