import 'package:flutter/material.dart';
import 'package:myapp/ui/screens/ride_pref/widgets/ride_pref_form_input.dart';
import 'package:myapp/ui/theme/theme.dart';
import 'package:myapp/ui/widgets/actions/BlaButton.dart';
import 'package:myapp/ui/widgets/display/bla_divider.dart';
import 'package:myapp/utils/date_time_util.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    if (widget.initRidePref != null) {
      departure = widget.initRidePref?.departure;
      departureDate = widget.initRidePref!.departureDate;
      arrival = widget.initRidePref?.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departure = null;
      departureDate = DateTime.now();
      arrival = null;
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  String get departurelable =>
      departure != null ? departure!.name : "leaving from";
  String get arrivallable => arrival != null ? arrival!.name : "going to";
  String get dateLabel => DateTimeUtils.formatDateTime(departureDate);
  String get passengerLabel => requestedSeats.toString();
  bool get showDeparturePLaceHolder => departure == null;
  bool get showArrivalPLaceHolder => arrival == null;
  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RidePrefFormInput(
          onclick: () => {},
          text: departurelable,
          mainIcon: Icons.location_on,
          initText: showDeparturePLaceHolder,
          subIcon: Icons.swap_vert,
          onSubIconClick: () => {},
        ),
        const BlaDivider(),
        RidePrefFormInput(
          onclick: () => {},
          text: arrivallable,
          mainIcon: Icons.location_on,
          initText: showDeparturePLaceHolder,
        ),
        const BlaDivider(),
        RidePrefFormInput(
          onclick: () => {},
          text: passengerLabel,
          mainIcon: Icons.person,
        ),
        Blabutton(
          text: "Search",
          type: ButtonType.primary,
          onPressed: () => {},
        ),
      ],
    );
  }
}
