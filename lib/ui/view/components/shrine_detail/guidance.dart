import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/shrine/current_location_notifier.dart';

class Guidance extends ConsumerWidget {
  final String? name;
  final String? address;
  final String? distance;
  final String? duration;
  const Guidance({
    Key? key,
    this.name,
    this.address,
    this.distance,
    this.duration
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final currentLocation = ref.read(currentLocationProvider);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200
      ),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.my_location,
                size: 26,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("現在地", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),),
                    Text(currentLocation.value!.address, style: const TextStyle(
                      fontSize: 12
                    ),)
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 28,
                  margin: const EdgeInsets.only(left: 12),
                  child: const DottedLine(
                    direction: Axis.vertical,
                    lineLength: double.infinity,
                    dashLength: 2,
                  )
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.fmd_good,
                color: Color(0xFFB11E1F),
                size: 28,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name!, style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),),
                    Text(address!, style: const TextStyle(
                      fontSize: 12
                    ),)
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.assistant_navigation,
                        size: 18,
                        color: Colors.blue.shade800,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 3),
                        child: Text(distance!, style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ]
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.directions_walk,
                        size: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 3),
                        child: Text(duration!, style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}