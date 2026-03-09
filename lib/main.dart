import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/market_provider.dart';
import '03_05_provider_flow/market_entry_provider_screen.dart';

/// ENTRY POINT: The execution starts here.
/// This file initializes the application's infrastructure and Global State.
void main() {
  runApp(
    /// DEPENDENCY INJECTION: We wrap the entire application in a 'ChangeNotifierProvider'.
    /// This ensures that the 'MarketProvider' instance is available to every 
    /// widget within the 'MaterialApp' widget tree.
    ChangeNotifierProvider(
      // INSTANTIATION: Creates the 'MarketProvider' object exactly once.
      create: (context) => MarketProvider(),
      
      // APPLICATION ROOT: The MaterialApp serves as the base for the UI.
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        
        // INITIAL ROUTE: Sets the 'Entry Screen' as the first page the user sees.
        home: MarketEntryProviderScreen(),
      ),
    ),
  );
}