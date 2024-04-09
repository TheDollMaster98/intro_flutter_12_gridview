import 'package:flutter/material.dart';
import 'package:intro_flutter_12_gridview/model/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text("GridView"),
          centerTitle:
              true, // Questo rende il testo del titolo centrato nell'AppBar
        ),
        body: Center(child: body()));
  }
}

// GridView.builder:
// Questo è un modo più efficiente per creare una vista a griglia in Flutter.
// Crea solo gli elementi che sono visibili sullo schermo, e quando scorri, crea i nuovi elementi e scarta quelli vecchi.
// Questo è molto più efficiente in termini di memoria per liste grandi.

Widget body() => GridView.builder(
      // SliverGridDelegateWithFixedCrossAxisCount viene utilizzato per creare una griglia con un numero fisso di tessere nell'asse trasversale.
      // L'asse trasversale è l'asse perpendicolare alla direzione di scorrimento (cioè, da sinistra a destra).
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Il numero di tessere nell'asse trasversale.
        childAspectRatio:
            0.9, // Il rapporto tra l'asse trasversale e l'asse principale di ogni figlio.
        crossAxisSpacing:
            10, // Il numero di pixel logici tra ogni figlio lungo l'asse trasversale.
        mainAxisSpacing:
            10, // Il numero di pixel logici tra ogni figlio lungo l'asse principale.
      ),
      itemCount: products.length, // Il numero totale di elementi nella lista.
      itemBuilder: (context, index) => ProductTile(products[
          index]), // La funzione builder, chiamata per ogni elemento nella lista.
    );

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Metto una SizedBox per l'immagine, in modo da non creare overflow
        // causato dall'aspect ratio. Tutti i componenti di una griglia hanno
        // aspect ratio = 1.
        // Però in questo caso l'asse Y è più grande di quella X.
        SizedBox(height: 110, child: Image.network(productModel.imageUrl)),
        ListTile(
          title: Text(productModel.name),
          // Converto la variabile double in una stringa con 2 decimali
          subtitle: Text("${productModel.price.toStringAsFixed(2)} €"),
        )
      ],
    );
  }
}
