import 'package:cruv_task/provider/search_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({super.key});

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  void searchSeat(String value, WidgetRef ref) {
    ref.read(searchTextProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    String? text = _controller.text;
    var isTyping = true;
    return Stack(alignment: AlignmentDirectional.topEnd, children: [
      TextField(
        onSubmitted: (value) {
          setState(() {
            isTyping = false;
          });
          print(isTyping);
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
        onTap: () {
          FocusScope.of(context).unfocus();
          searchSeat(_controller.text, ref);
        },
        child: Container(
          height: 64,
          width: 100,
          decoration: BoxDecoration(
            color:
                (text == '') ? Colors.grey[400] : Colors.blue.withOpacity(0.5),
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
