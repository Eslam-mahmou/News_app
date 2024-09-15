import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/Core/AppRouter/PageRoute.dart';
import 'package:news_app/Core/AppRouter/RoutesGenerator.dart';
import 'package:news_app/Core/Services/AppProvider.dart';
import 'package:news_app/Core/Utils/AppTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Models/articles_model.dart';
import 'package:news_app/Models/source_model.dart';
import 'package:news_app/ObservoerApp.dart';
import 'package:news_app/Injectable/di.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Bloc.observer = MyBlocObserver();
  // Hive.registerAdapter(SourceAdapter());
  // Hive.registerAdapter(ArticleAdapter());
  configureDependencies();
  runApp(ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider()..getLanguage(),
      child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      locale: provider.locale,
      initialRoute: PageRoutes.initial,
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RoutesGenerator.onGenerator,
    );
  }
}
