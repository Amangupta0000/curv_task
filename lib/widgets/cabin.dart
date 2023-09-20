import 'package:cruv_task/provider/search_index_provider.dart';
import 'package:cruv_task/widgets/custom_clip_path.dart';
import 'package:cruv_task/widgets/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CabinWidget extends ConsumerStatefulWidget {
  const CabinWidget({super.key, required this.index});
  final int index;

  @override
  ConsumerState<CabinWidget> createState() => _CabinWidgetState();
}

class _CabinWidgetState extends ConsumerState<CabinWidget> {
  @override
  Widget build(BuildContext context) {
    String searchBarText = ref
        .watch(searchTextProvider); // read the text in search bar to find seats
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipPath(
                      clipper:
                          MyCustomClipperFromTop(), // creates border around seats
                      child: Container(
                        // contains row of three seat widget
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff80CBFF),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Seats(
                            searchBarText: searchBarText,
                            seatIndex: 1 + widget.index * 8,
                            seatType: "UPPER",
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Seats(
                            searchBarText: searchBarText,
                            seatIndex: 2 + widget.index * 8,
                            seatType: "MIDDLE",
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Seats(
                            searchBarText: searchBarText,
                            seatIndex: 3 + widget.index * 8,
                            seatType: "UPPER",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomClipperFromTop(),
                      child: Container(
                        height: 60,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff80CBFF),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Seats(
                        searchBarText: searchBarText,
                        seatIndex: 7 + widget.index * 8,
                        seatType: "SIDE LOW",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomClipperFromBottom(),
                      child: Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff80CBFF),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Seats(
                            searchBarText: searchBarText,
                            seatIndex: 6 + widget.index * 8,
                            seatType: "LOWER",
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Seats(
                            searchBarText: searchBarText,
                            seatIndex: 5 + widget.index * 8,
                            seatType: "MIDDLE",
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Seats(
                            searchBarText: searchBarText,
                            seatIndex: 4 + widget.index * 8,
                            seatType: "UPPER",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomClipperFromBottom(),
                      child: Container(
                        height: 60,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff80CBFF),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Seats(
                        searchBarText: searchBarText,
                        seatIndex: 8 + widget.index * 8,
                        seatType: "SIDE UP",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
