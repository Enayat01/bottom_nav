import 'package:bottom_nav/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  static const routeName = '/history';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final counterBloc = CounterBloc();
  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.redAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter :',
                  style: TextStyle(fontSize: 30),
                ),
                StreamBuilder(
                  initialData: 0,
                  stream: counterBloc.counterStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '${snapshot.data}',
                        style: const TextStyle(fontSize: 30),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Text('An error occurred!');
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.increment);
            },
            child: const Text('Increment'),
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.decrement);
            },
            child: const Text('Decrement'),
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.reset);
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
