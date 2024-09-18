import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mix_tutorial/theme_data.dart';
import 'package:flutter_mix_tutorial/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<String?> visibleQuote = ValueNotifier(null);
  final ValueNotifier<int?> visibleQuoteIndex = ValueNotifier(null);
  var listOfDisplayedIndexes = <int>[];
  int currentDisplayedIndex = 0;
  @override
  void initState() {
    super.initState();
    fetchRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor.resolve(context),
        title: Text(
          "Great Quotes",
          style: largeText.resolve(context).copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: smallSpace.resolve(context),
                width: double.infinity,
              ),
              ValueListenableBuilder<int?>(
                valueListenable: visibleQuoteIndex,
                builder: (__, index, _) {
                  return Text(
                    index == null ? '' : '#${index + 1}',
                    style: midText.resolve(context).copyWith(
                        color: secondaryColor.resolve(context),
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              SizedBox(
                height: smallSpace.resolve(context),
              ),
              ValueListenableBuilder<String?>(
                valueListenable: visibleQuote,
                builder: (__, quote, _) {
                  return SizedBox(
                      width: 300,
                      height: largeSpace.resolve(context) + 100,
                      child: Text(
                        quote ?? '',
                        textAlign: TextAlign.center,
                        style: midText
                            .resolve(context)
                            .copyWith(color: secondaryColor.resolve(context)),
                      ));
                },
              ),
              SizedBox(
                height: largeSpace.resolve(context),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runAlignment: WrapAlignment.center,
                runSpacing: 20,
                children: [
                  CustomButton(
                      onPressed: showPreviousQuote, btnTitle: 'Previous'),
                  CustomButton(
                      customStyle: baseBtnStyle.applyVariant(nextVariant),
                      onPressed: fetchRandomQuote,
                      btnTitle: 'Next'),
                  CustomButton(
                      shouldEnable: false,
                      onPressed: () {},
                      btnTitle: 'Delete this')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  fetchRandomQuote() {
    final randomIndex = Random().nextInt(quotes.length);
    visibleQuote.value = quotes[randomIndex];
    visibleQuoteIndex.value = randomIndex;
    listOfDisplayedIndexes.add(randomIndex);
    currentDisplayedIndex = listOfDisplayedIndexes.length - 1;
  }

  showPreviousQuote() {
    if (currentDisplayedIndex == 0) {
      return;
    }
    final previousQuoteIndex =
        listOfDisplayedIndexes[currentDisplayedIndex - 1];
    visibleQuote.value = quotes[previousQuoteIndex];
    visibleQuoteIndex.value = previousQuoteIndex;
    currentDisplayedIndex--;
  }

  var quotes = <String>[
    "Many of life’s failures are people who did not realize how close they were to success when they gave up.",
    "Life is like a coin. You can spend it any way you wish, but you only spend it once.",
    "Never let the fear of striking out keep you from playing the game.",
    "Don’t settle for what life gives you; make life better and build something",
    "I believe every human has a finite number of heartbeats. I don't intend to waste any of mine",
    "The best way to predict your future is to create it.",
    "If you want to live a happy life, tie it to a goal, not to people or things",
    "You must expect great things of yourself before you can do them",
    "It had long since come to my attention that people of accomplishment rarely sat back and let things happen to them. They went out and happened to things",
    "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success",
    "You’re braver than you believe, and stronger than you seem, and smarter than you think",
    "You don't have to be great to start, but you have to start to be great."
  ];
}
