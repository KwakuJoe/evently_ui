import 'package:barcode/barcode.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/presentation/pages/tickets/widgets/ticket_cutout.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({super.key});

     final ThemeController themeController = Get.find<ThemeController>();
  final String ticketId = "TICKET123456"; // Your ticket data
  final Barcode _barcode = Barcode.code128();

  @override
  Widget build(BuildContext context) {
    // Generate the barcode as an SVG
    final String svgString = _barcode.toSvg(ticketId, width: 200, height: 80);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My ticket'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Stack(
            children: [
              // Main Ticket Shape
              Container(
                width: double.infinity,
                height: 650,
                decoration: BoxDecoration(
                  color: themeController.isDarkMode.value
                      ? const Color(0xFF08060E)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
        
              const Positioned(
                bottom: 130,
                left: -20,
                child: TicketCutOut(),
              ),
              const Positioned(
                bottom: 130,
                right: -20,
                child: TicketCutOut(),
              ),
        
              // Dotted Line Divider
              Positioned(
                bottom: 150,
                left: 20,
                right: 20,
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Dash(
                      direction: Axis.horizontal,
                      length: MediaQuery.of(context).size.width * 0.7,
                      // length: 4,
                      // length: 300,
                      dashLength: 10,
                      dashColor: Theme.of(context).scaffoldBackgroundColor,
                      dashGap: 10,
                    ),
                  ),
                ),
              ),
        
              // image
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images.squarespace-cdn.com/content/v1/52744b67e4b0782c048b666f/1720187750179-D85337Q4VXFTIGGFCGWP/5+British+GP+Fan+Poster+Race+Week+GP+Events+1.jpg', // Replace with your image URL
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
        
              const Positioned(
                top: 220,
                right: 25,
                left: 25,
                child: Text(
                  'NBA Finals | Boston VS Golden State Warriors | Finals',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
        
              // Sub title
              const Positioned(
                top: 290,
                right: 25,
                left: 25,
                child: Text(
                  '8 December 2023 - Olympus Arena Italy',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    // color: themeController.isDarkMode.value
                    //     ? Colors.white54
                    //     : Colors.black45,
                  ),
                ),
              ),
        
              // order number & total
              Positioned(
                top: 350,
                right: 25,
                left: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order number',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: themeController.isDarkMode.value
                                  ? Colors.white54
                                  : Colors.black45),
                        ),
                        const Text(
                          'CLOR1233333',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: themeController.isDarkMode.value
                                  ? Colors.white54
                                  : Colors.black45),
                        ),
                        const Text(
                          'GHS 250',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
        
              // date & time
              Positioned(
                top: 420,
                right: 25,
                left: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ticket',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: themeController.isDarkMode.value
                                  ? Colors.white54
                                  : Colors.black45),
                        ),
                        const Text(
                          'VIP Balcony Seated',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: themeController.isDarkMode.value
                                  ? Colors.white54
                                  : Colors.black45),
                        ),
                        const Text(
                          '18:00 AM',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
        
              Positioned(
                bottom: 10,
                right: 25,
                left: 25,
                child: SizedBox(
                  child: Center(
                    child: Text(
                      'Scan the this QR Code at the event center',
                      style: TextStyle(
                          fontSize: 12,
                          color: themeController.isDarkMode.value
                              ? Colors.white54
                              : Colors.black45),
                    ),
                  ),
                ),
              ),
              //bottom details
              Positioned(
                top: 530,
                right: 35,
                left: 35,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: SvgPicture.string(
                        color: themeController.isDarkMode.value ? Colors.white : Colors.black,
                          svgString), // Use SvgPicture to display it
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


            // SizedBox(
            //   width: 200,
            //   height: 80,
            //   child: SvgPicture.string(svgString), // Use SvgPicture to display it
            // ),