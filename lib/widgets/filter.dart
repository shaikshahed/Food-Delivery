import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int _selectedRating = 0;

  final Map<String, bool> _selectedOffers = {
    'Delivery': false,
    'Pick Up': false,
    'Offer': false,
    'Online payment available': false,
  };

  final Map<String, bool> _selectedDeliveryTime = {
    '10 - 20 min': false,
    '20 min': false,
    '30 min': false,
  };

  final Map<String, bool> _selectedPricing = {
    '\$': false,
    '\$\$': false,
    '\$\$\$': false,
  };

  void _onStarPressed(int index) {
    setState(() {
      _selectedRating = index;
    });
  }

  void _toggleSelection(Map<String, bool> selectionMap, String key) {
    setState(() {
      selectionMap[key] = !selectionMap[key]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filter your search",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300]),
                  child: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "OFFERS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: _selectedOffers.keys
                      .where((offer) => offer != 'Online payment available')
                      .map((offer) {
                    return GestureDetector(
                      onTap: () => _toggleSelection(_selectedOffers, offer),
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(color: Colors.grey[300]!, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: _selectedOffers[offer]!
                              ? Colors.orange
                              : Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            offer,
                            style: TextStyle(
                                color: _selectedOffers[offer]!
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _toggleSelection(
                      _selectedOffers, 'Online payment available'),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey[300]!, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: _selectedOffers['Online payment available']!
                          ? Colors.orange
                          : Colors.transparent,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Online payment available',
                        style: TextStyle(
                          color: _selectedOffers['Online payment available']!
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "DELIVER TIME",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: _selectedDeliveryTime.keys.map((time) {
                return GestureDetector(
                  onTap: () => _toggleSelection(_selectedDeliveryTime, time),
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey[300]!, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: _selectedDeliveryTime[time]!
                          ? Colors.orange
                          : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        time,
                        style: TextStyle(
                            color: _selectedDeliveryTime[time]!
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "PRICING",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: _selectedPricing.keys.map((pricing) {
                return GestureDetector(
                  onTap: () => _toggleSelection(_selectedPricing, pricing),
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey[300]!, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: _selectedPricing[pricing]!
                          ? Colors.orange
                          : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        pricing,
                        style: TextStyle(
                          color: _selectedPricing[pricing]!
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "RATING",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!, width: 2)),
                  child: IconButton(
                    icon: Icon(
                      index < _selectedRating ? Icons.star : Icons.star,
                      color:
                          index < _selectedRating ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () => _onStarPressed(index + 1),
                  ),
                );
              }),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'FILTER',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
