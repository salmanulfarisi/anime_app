import 'package:anime_app/screens/admin/model/charactor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AdminController extends GetxController {
  var currentIndex = 0.obs;
  var currentImageIndex = 0.obs;
  late QueryDocumentSnapshot? snapshotData;

  // key for form
  var formKey = GlobalKey<FormState>();

  // lists
  var imageList = <String>[].obs;

  // list of map
  var producerList = <Map<String, String>>[].obs;
  var linkList = <Map<String, String>>[].obs;
  List<Charactor> charactorList = <Charactor>[].obs;

  // bool
  var isAllFilled = false.obs;
  var isTrending = false.obs;
  var isTopAired = false.obs;
  var isMovie = false.obs;
  var isTv = false.obs;
  var isAiring = false.obs;
  var isFinished = false.obs;
  var isNotyet = false.obs;
  var isFoundedId = false.obs;

  late YoutubePlayerController youtubeController;
  var videoId = YoutubePlayer.convertUrlToId(
      'https://www.youtube.com/watch?v=Q8TXgCzxEnw');
  @override
  void onInit() {
    super.onInit();

    youtubeController = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();

  //   controller = VideoPlayerController.network(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
  //     ..initialize().then((_) {
  //       controller.setLooping(true);
  //       controller.play();
  //       update();
  //     });
  // }

  // main text controllers
  var animeImageController = TextEditingController();
  var animeNameController = TextEditingController();
  var animeVideoController = TextEditingController();
  var animePopularityController = TextEditingController();
  var animeRankController = TextEditingController();
  var animeScoreController = TextEditingController();
  var animeRatingController = TextEditingController();
  var animeCurrentEpisodeController = TextEditingController();
  var animeTotalEpisodeController = TextEditingController();
  var animeStoryController = TextEditingController();
  // more info text controllers
  var animeSourceController = TextEditingController();
  var animeSeasoneController = TextEditingController();
  var animeStudioController = TextEditingController();
  var animeLicensorController = TextEditingController();
  var animeAirFromController = TextEditingController();
  var animeAirToController = TextEditingController();
  var infoController = TextEditingController();
  var japaneseNameController = TextEditingController();
  var synonymsController = TextEditingController();
  var producerController = TextEditingController();
  var producerLinkController = TextEditingController();
  var linkNameController = TextEditingController();
  var linkController = TextEditingController();
  var otherInfoController = TextEditingController();

  // add anime type
  var trendingNoController = TextEditingController();
  var topAiredNoController = TextEditingController();

  // charactor text field
  var charIdController = TextEditingController();
  var charNameController = TextEditingController();
  var charImageController = TextEditingController();

  // add charactor to charactorList
  void addCharactor() {
    if (charNameController.text.isNotEmpty &&
        charImageController.text.isNotEmpty) {
      charactorList.add(Charactor(
          name: charNameController.text, image: charImageController.text));
      charNameController.clear();
      charImageController.clear();
    }
  }

  // all text controllers clear
  void clearAllTextControllers() {
    animeImageController.clear();
    animeNameController.clear();
    animePopularityController.clear();
    animeRankController.clear();
    animeScoreController.clear();
    animeRatingController.clear();
    animeCurrentEpisodeController.clear();
    animeTotalEpisodeController.clear();
    animeStoryController.clear();
    animeSourceController.clear();
    animeSeasoneController.clear();
    animeStudioController.clear();
    animeLicensorController.clear();
    animeAirFromController.clear();
    animeAirToController.clear();
    infoController.clear();
    japaneseNameController.clear();
    synonymsController.clear();
    producerController.clear();
    producerLinkController.clear();
    linkNameController.clear();
    linkController.clear();
    otherInfoController.clear();
    trendingNoController.clear();
    topAiredNoController.clear();
  }

// select anime as Tv
  void selectTv() {
    isTv.value = true;
    isMovie.value = false;
  }

  // select anime as Movie
  void selectMovie() {
    isMovie.value = true;
    isTv.value = false;
  }

  // select anime as Airing
  void selectAiring() {
    isAiring.value = true;
    isFinished.value = false;
    isNotyet.value = false;
  }

  // select anime as Finished
  void selectFinished() {
    isFinished.value = true;
    isAiring.value = false;
    isNotyet.value = false;
  }

  // select anime as Not Yet
  void selectNotyet() {
    isNotyet.value = true;
    isAiring.value = false;
    isFinished.value = false;
  }

  // visible button when all fields are filled
  checkAllFieldsFilled() {
    if (animeNameController.text.isNotEmpty &&
        animePopularityController.text.isNotEmpty &&
        animeRankController.text.isNotEmpty &&
        animeScoreController.text.isNotEmpty &&
        animeRatingController.text.isNotEmpty &&
        animeCurrentEpisodeController.text.isNotEmpty &&
        animeTotalEpisodeController.text.isNotEmpty &&
        animeStoryController.text.isNotEmpty) {
      isAllFilled.value = true;
    } else {
      isAllFilled.value = false;
    }
    return isAllFilled.value;
  }

  // visible button when producer fields are filled
  checkProducerFieldsFilled() {
    if (producerController.text.isNotEmpty &&
        producerLinkController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // visible button when link fields are filled
  checkLinkFieldsFilled() {
    if (linkNameController.text.isNotEmpty && linkController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // visible button when all info fields are filled
  checkInfoFieldsFilled() {
    if (infoController.text.isNotEmpty &&
        japaneseNameController.text.isNotEmpty &&
        synonymsController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // add producer to list of map
  void addProducer(context) {
    if (producerController.text.isNotEmpty &&
        producerLinkController.text.isNotEmpty) {
      producerList.add({
        'name': producerController.text,
        'link': producerLinkController.text,
      });
      VxToast.show(context, msg: 'Producer Added');
      producerController.clear();
      producerLinkController.clear();
    }
  }

  // remove producer from list of map
  void removeProducer(int index, context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Remove Producer'),
              content: Text(
                  'Are you sure you want to remove this producer?\n ${producerList.elementAt(index)['name']}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    producerList.removeAt(index);
                    VxToast.show(context, msg: 'Producer Removed');
                    Navigator.pop(context);
                  },
                  child: const Text('Remove'),
                ),
              ],
            ));
  }

  // add link to list of map
  void addLink(context) {
    if (linkNameController.text.isNotEmpty && linkController.text.isNotEmpty) {
      linkList.add({
        'name': linkNameController.text,
        'link': linkController.text,
      });
      VxToast.show(context, msg: 'Link Added');
      linkNameController.clear();
      linkController.clear();
    }
  }

  // remove link from list of map
  void removeLink(int index, context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Remove Link'),
              content: Text(
                  'Are you sure you want to remove this link?\n ${linkList.elementAt(index)['name']}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    linkList.removeAt(index);
                    VxToast.show(context, msg: 'Link Removed');
                    Navigator.pop(context);
                  },
                  child: const Text('Remove'),
                ),
              ],
            ));
  }

  void addImage(String url, context) {
    if (animeImageController.text.isEmpty) {
      VxToast.show(context, msg: 'Please Enter Image URL');
    } else if (currentImageIndex.value == 0) {
      showAddImageDialog(context);
      VxToast.show(context, msg: 'Image Added');
    } else {
      imageList.add(url);
      currentImageIndex++;
      animeImageController.clear();
      VxToast.show(context, msg: 'Image Added');
    }
  }

  void removeImage(int index, context) {
    imageList.removeAt(index);
    currentImageIndex--;
    VxToast.show(context, msg: 'Image Removed');
  }

  // show add image dialog
  void showAddImageDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Image'),
        content:
            const Text('This Image will show as the main image of the anime'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              imageList.add(animeImageController.text);
              currentImageIndex++;
              animeImageController.clear();
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // show remove image dialog
  void showRemoveImageDialog(int index, context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Image'),
        content: Text(
            'Are you sure you want to remove this image? ${imageList.elementAt(index)} '),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              removeImage(index, context);
              Navigator.pop(context);
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  // validate trending No field did not exceed 10
  validateTrendingNo(context) {
    if (trendingNoController.text.isNotEmpty) {
      if (int.parse(trendingNoController.text) > 10) {
        VxToast.show(context,
            msg: 'Trending No. must be less than 10',
            position: VxToastPosition.top);
        trendingNoController.clear();
      }
    }
  }

  // validate topAring No field did not exceed 10
  validateTopAiringNo(context) {
    if (topAiredNoController.text.isNotEmpty) {
      if (int.parse(topAiredNoController.text) > 10) {
        VxToast.show(context,
            msg: 'Top Airing No. must be less than 10',
            position: VxToastPosition.top);
        topAiredNoController.clear();
      }
    }
  }
}
