import 'package:flutter/material.dart';

class Delegate extends SearchDelegate {
  
  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon( Icons.clear ), 
          onPressed: () => this.query = ''
        )
      ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon( Icons.arrow_back_ios ),
      onPressed: () => this.close(context, null )
    );
  }

  @override
  Widget buildResults(BuildContext context) {

      return Text('no hay valor en el query');
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return 
          Text('buildSuggestions');
  }

  

}