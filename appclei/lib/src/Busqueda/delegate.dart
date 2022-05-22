import 'package:flutter/material.dart';

class Delegate extends SearchDelegate {
  
  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: const Icon( Icons.clear ), 
          onPressed: () => query = ''
        )
      ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon( Icons.arrow_back_ios ),
      onPressed: () => close(context, null )
    );
  }

  @override
  Widget buildResults(BuildContext context) {

      return const Text('no hay valor en el query');
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return 
          const Text('buildSuggestions');
  }

  

}