import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/shrine/shrine_notifier.dart';

class CurrentShrine extends ConsumerStatefulWidget {
  const CurrentShrine({super.key});

  @override
  CurrentShrineState createState() => CurrentShrineState();
}

class CurrentShrineState extends ConsumerState<CurrentShrine> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shrineNotifierProvider);

    return state.when(
      data: (shrines) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: shrines.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
          ), 
          itemBuilder: (context, index) {
            return SizedBox(
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
                          color: Color(0x99ffffff),
                        ),
                        child: Text(shrines[index].name, style: const TextStyle(
                          fontWeight: FontWeight.w400
                        ),),
                      ),
                    )
                  ],
                )
              )
            );
          }
        );
      }, 
      error: (_, error) {
        return const Text("error!!!");
      }, 
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}