import 'package:cruv_task/provider/search_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({super.key});

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  // function for finding seatnumber
  void searchSeat(String value, WidgetRef ref) {
    ref
        .read(searchTextProvider.notifier)
        .update((state) => value); // read the changes in input field
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(); //search bar controller
    return Stack(alignment: AlignmentDirectional.topEnd, children: [
      TextField(
        //take seat number from user
        onSubmitted: (value) {
          searchSeat(value, ref);
        },
        maxLength: 2,
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter Seat Number...",
          hintStyle: TextStyle(color: Colors.blue[400]),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 5.0, color: Colors.blue.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      InkWell(
        // search button for finding seat
        onTap: () {
          FocusScope.of(context).unfocus();

          if (_controller.text == '') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Pleas enter valid seat number"),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 225,
                  right: 20,
                  left: 20),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.blue[400],
            ));
          } else {
            searchSeat(_controller.text, ref);
          }
        },
        child: Container(
          height: 64,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue[400],
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
              child: Text(
            "Find",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      )
    ]);
  }
}
