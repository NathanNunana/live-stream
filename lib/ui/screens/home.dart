import 'package:aatv_mobile/providers/stream_provider.dart';
import 'package:aatv_mobile/ui/widgets/_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aatv_mobile/states/_index.dart';
import 'package:video_player/video_player.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});
  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(''),
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final streamNotifier = ref.watch(streamProvider);
    final stateContext = streamNotifier.stateContext;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AATV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: _buildAppState(stateContext.state),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      drawer: const Drawer(),
    );
  }

  Widget _buildAppState(AppState state) {
    if (state is LoadingState) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (state is LoadedState) {
      return LiveStream(state, _controller);
    } else if (state is ErrorState) {
      return _buildError();
    } else {
      return Container();
    }
  }

  Widget _buildError() {
    return const Center(
      child: Text('Error occurred'),
    );
  }
}

class LiveStream extends StatelessWidget {
  final LoadedState state;
  final VideoPlayerController _controller;
  const LiveStream(this.state, this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Container(
                  color: Colors.black,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
        const SizedBox(height: 20),
        // Program Details
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BREAK THROUGH HOUR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Time with Evangelist Akwasi Awuah'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Handle payment action
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              backgroundColor: Colors.blue, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Pay Tithe/Offering/Talk to God',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
