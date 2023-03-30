import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wordpress_app/services/app_service.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import 'package:wordpress_app/widgets/full_image.dart';
import 'package:wordpress_app/widgets/video_player_widget.dart';

import 'loading_indicator_widget.dart';

class HtmlBody extends StatelessWidget {
  final String content;
  final bool isVideoEnabled;
  final bool isimageEnabled;
  final bool isIframeVideoEnabled;
  final double? textPadding;
  const HtmlBody(
      {Key? key,
      required this.content,
      required this.isVideoEnabled,
      required this.isimageEnabled,
      required this.isIframeVideoEnabled,
      this.textPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Html(
          data: content,
          onLinkTap: (String? url, RenderContext context1,
              Map<String, String> attributes, _) {
            AppService().openLinkWithCustomTab(context, url!);
          },
          style: {
            "body": Style(
                margin: Margins.zero,
                padding: EdgeInsets.zero,
                fontSize: FontSize(18.0),
                lineHeight: LineHeight(1.7),
                whiteSpace: WhiteSpace.normal,
                color: Theme.of(context).colorScheme.secondary,
                fontFamily: 'Manrope'),
            "p,h1,h2,h3,h4,h5,h6": Style(
                margin: Margins.all(textPadding == null ? 20.0 : textPadding!)),
            "figure": Style(margin: Margins.zero, padding: EdgeInsets.zero),
          },
          customRenders: {
            AppService.imageMatcher():
                CustomRender.widget(widget: (context1, buildChildren) {
              String imageUrl = context1.tree.attributes['src'].toString();
              return InkWell(
                  onTap: () =>
                      nextScreen(context, FullScreenImage(imageUrl: imageUrl)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        const LoadingIndicatorWidget(),
                  ));
            }),
            AppService.videoMatcher():
                CustomRender.widget(widget: (context1, buildChildren) {
              String _videoSource = context1.tree.attributes['src'].toString();
              if (isVideoEnabled == false) return Container();
              return VideoPlayerWidget(
                  videoUrl: _videoSource, videoType: 'network');
            }),
            AppService.iframeMatcher():
                CustomRender.widget(widget: (context1, children) {
              final String _videoSource =
                  context1.tree.element!.attributes['src'].toString();
              if (isIframeVideoEnabled == false) {
                return Container();
              } else if (_videoSource.contains('youtube')) {
                return VideoPlayerWidget(
                    videoUrl: _videoSource, videoType: 'youtube');
              } else if (_videoSource.contains('vimeo')) {
                return VideoPlayerWidget(
                    videoUrl: AppService.getVimeoId(_videoSource),
                    videoType: 'vimeo');
              }
              return Container();
            })
          },
        ));
  }
}
