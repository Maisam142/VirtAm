import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/back_component.dart';
import '../../../component/form_component.dart';
import '../../../component/text_component.dart';
import 'add_location_view_model.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddLocationViewModel viewModel =
    Provider.of<AddLocationViewModel>(context);
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackComponent(
              text: 'enter your location',
              onPressed: (){},
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  FormComponent(
                    controller: viewModel.searchController,
                    hintText: 'Search for a place',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                    onPressed: () {
                    },
                  ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Image(image: AssetImage('images/loc_send.png'),
                          width: 20,
                          height: 20,),
                        TextComponent(text: '  Use my current location'),
                      ],

                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
