import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);

  final List<Trip> favoriteTrips;

  FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
    return Center(
      child: Text('لبس لديك اي رحلة في المفضلة'),
    );
    }else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            season: favoriteTrips[index].season,
            tripType: favoriteTrips[index].tripType,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }

  }
}
