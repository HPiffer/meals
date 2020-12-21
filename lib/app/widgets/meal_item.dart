import 'package:flutter/material.dart';
import 'package:meals/app/models/meal.dart';

// =========================================== //
// Meal Item Widget
// =========================================== //
class MealItem extends StatelessWidget {
  // =========================================== //
  // Variables
  // =========================================== //
  final Meal meal;

  const MealItem({
    this.meal,
  });

  // =========================================== //
  // Functions
  // =========================================== //
  void _selectMeal() {}

  // =========================================== //
  // Widget Build
  // =========================================== //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //* Imagem e nome
            Stack(
              children: <Widget>[
                //* Borda circular da imagem
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //* Network Image
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover, //? Faz a foto cobrir a área determinada
                  ),
                ),
                //* Nome da refeição
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            //* Informações rápidas
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //* Duração
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min')
                    ],
                  ),
                  //* Dificuldade
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(meal.complexityText)
                    ],
                  ),
                  //* Valor
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(meal.constText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
