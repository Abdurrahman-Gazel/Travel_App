import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/trip_item.dart';
import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;
  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
   late String? categoryTitle;
   late List<Trip>? displayTrips;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
     categoryTitle = routeArgument['title'];
     displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips!.removeWhere((trip) => trip.id == tripId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips![index].id,
            title: displayTrips![index].title,
            imageUrl: displayTrips![index].imageUrl,
            duration: displayTrips![index].duration,
            season: displayTrips![index].season,
            tripType: displayTrips![index].tripType,
          );
        },
        itemCount: displayTrips!.length,
      ),
    );
  }
}
