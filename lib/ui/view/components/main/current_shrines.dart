import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/shrine/shrine_detail_notifier.dart';
import 'package:zinjanow_app/ui/notify/shrine/shrine_notifier.dart';
import 'package:zinjanow_app/ui/view/components/common/loading_dots_wave.dart';
import 'package:zinjanow_app/ui/view/root/app_router.dart';

class CurrentShrine extends ConsumerStatefulWidget {
  const CurrentShrine({super.key});

  @override
  CurrentShrineState createState() => CurrentShrineState();
}

class CurrentShrineState extends ConsumerState<CurrentShrine> {

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shrineNotifierProvider);
    final size = MediaQuery.of(context).size;

    return state.when(
      data: (shrines) {
        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(  
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: shrines.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
            ), 
            itemBuilder: (context, index) {
              return SizedBox(
                child: GestureDetector(
                  onTap: () {
                    ref.watch(placeIdProvider.notifier).state = shrines[index].id!;
                    context.router.push(const ShrineDetailRoute());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(shrines[index].photos!.first.url.toString()),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 1.0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                              color: Color(0xA6ffffff),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 3),
                                  child: Text(shrines[index].name!, style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                    )
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            size: 14,
                                          ),
                                          Text(shrines[index].distance!, style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.directions_walk,
                                            size: 14,
                                          ),
                                          Text(shrines[index].duration!, style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                            )
                                          )
                                        ],
                                      )
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                        )
                      ],
                    )
                  ),
                )
              );
            }
          ),
        );
      }, 
      error: (hoge, error) {
        return const Text("failed: dont't get shrines");
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