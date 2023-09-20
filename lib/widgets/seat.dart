import 'package:cruv_task/models/seat.dart';
import 'package:flutter/material.dart';

class Seats extends StatefulWidget {
  const Seats(
      {super.key,
      required this.seatIndex,
      required this.seatType,
      this.searchBarText});
  final int seatIndex;
  final String seatType;
  final String? searchBarText;

  @override
  State<Seats> createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  Seat seat = Seat(); // instance of seat cleass
  @override
  // initialise the seat class data memebers
  void initState() {
    seat = Seat(seatIndex: widget.seatIndex, seatType: widget.seatType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // seat  widget
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (widget.searchBarText == widget.seatIndex.toString())
            ? Colors.blue
            : Colors.blue.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.seatIndex.toString(), //seat number
            style: TextStyle(
              fontSize: 16,
              color: (widget.searchBarText ==
                      widget.seatIndex
                          .toString()) // color of seat text change on search seat number
                  ? Colors.white
                  : const Color(0xff126DCA),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.seatType, //seat type
            style: TextStyle(
              fontSize: 12,
              color: (widget.searchBarText ==
                      widget.seatIndex
                          .toString()) // color of seat text change on search seat number
                  ? Colors.white
                  : const Color(0xff126DCA),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
