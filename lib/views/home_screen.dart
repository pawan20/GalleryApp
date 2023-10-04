import 'package:flutter/material.dart';
import 'package:lennar_app/utils/constants.dart';
import 'package:lennar_app/view_models/home_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final viewModel = HomeScreenViewModel();

  @override
  void initState() {
    viewModel.fetchImages();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      viewModel.loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: Text(
                    'Home',
                    style: headerTextStyle,
                  ),
                ),
                // space12,
                Consumer<HomeScreenViewModel>(
                  builder: (context, vm, _) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vm.imageList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        final imageData = vm.imageList[index];
                        return vm.imageList.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: SizedBox(
                                      height: 190.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: CachedNetworkImage(
                                          imageUrl: imageData!.downloadUrl,
                                          fit: BoxFit.cover,
                                          maxWidthDiskCache: 340,
                                          maxHeightDiskCache: 350,
                                          memCacheWidth: 340,
                                          memCacheHeight: 350,
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  space8,
                                  Text(
                                    'Image: ${imageData.id}',
                                  ),
                                  space8,
                                ],
                              )
                            : Center(child: Text('No images to show ${viewModel.errorMessage}'));
                      },
                    );
                  },
                ),
                if (viewModel.isLoading)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
