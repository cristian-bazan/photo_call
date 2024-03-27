import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:photo_call/dataBase/contacts.dart';
import 'package:photo_call/provider/helper_provider.dart';
import 'package:provider/provider.dart';

class DataCarrousel extends StatefulWidget {
  const DataCarrousel({
    super.key,
  });

  @override
  State<DataCarrousel> createState() => _DataCarrouselState();
}

class _DataCarrouselState extends State<DataCarrousel> {
  @override
  SafeArea build(BuildContext context) {
    final db = Provider.of<HelperProvider>(context);
    List<Contact> listaContactos = db.contactos;

    return SafeArea(
        child: Expanded(
      child: Stack(
        children: [
          FlutterCarousel.builder(
              itemCount: listaContactos.length,
              itemBuilder: (context, index, realIdx) {
                Contact contacto = listaContactos[index];
                return Image.file(File(contacto.image));
              },
              options: CarouselOptions(
                  height: double.infinity,
                  autoPlay: false,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  showIndicator: false)),
          Positioned(
            top: 5,
            right: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/edit');
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
