import 'package:flutter/material.dart';
import 'package:new_app/providers/favourites_provider.dart';
import 'package:provider/provider.dart';

class DeleteAllDialogue extends StatelessWidget {
  const DeleteAllDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete all items ?'),
      content: Text('Do you want to delete all the favourite items?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.read<FavouritesProvider>().clearAllFavouriteItems();
            Navigator.of(context).pop();
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}
