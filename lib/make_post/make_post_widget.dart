import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:prefs/prefs.dart';
import 'package:geocoding/geocoding.dart';
import '../auth/auth_util.dart';
import 'package:http/http.dart' as http;
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';

class MakePostWidget extends StatefulWidget {
  final VoidCallback callback;
  const MakePostWidget({Key key, this.callback}) : super(key: key);

  @override
  _MakePostWidgetState createState() => _MakePostWidgetState();
}

class _MakePostWidgetState extends State<MakePostWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String city;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = Prefs.getBool("dark_mode_enabled");
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Crear publicacion',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: Color(0xFF95A1AC),
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: darkMode ? FlutterFlowTheme.background : Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                validateFileFormat(
                                    selectedMedia.storagePath, context)) {
                              showUploadMessage(context, 'Uploading file...',
                                  showLoading: true);
                              final downloadUrl = await uploadData(
                                  selectedMedia.storagePath,
                                  selectedMedia.bytes);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrl != null) {
                                setState(() => uploadedFileUrl = downloadUrl);
                                showUploadMessage(context, 'Success!');
                              } else {
                                showUploadMessage(
                                    context, 'Failed to upload media');
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F5F8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/emptyState@2x.png',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: Color(0x3A000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Descripcion....',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 32, 20, 12),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          FlutterFlowPlacePicker(
            iOSGoogleMapsApiKey: 'AIzaSyCQaUC_ME4HxAb8ljxRyffB2kBQG83BhWg',
            androidGoogleMapsApiKey: 'AIzaSyCQaUC_ME4HxAb8ljxRyffB2kBQG83BhWg',
            webGoogleMapsApiKey: 'AIzaSyCQaUC_ME4HxAb8ljxRyffB2kBQG83BhWg',
            onSelect: (place) {
              setState(() => placePickerValue = place);
              widget.callback();
            },
            defaultText: "Ubicacion",
            icon: Icon(
              Icons.place,
              color: Colors.white,
              size: 16,
            ),
            buttonOptions: FFButtonOptions(
              width: 200,
              height: 40,
              color: FlutterFlowTheme.primaryColor,
              textStyle: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final socialPostsCreateData = createSocialPostsRecordData(
                  postCreated: getCurrentTimestamp,
                  postImage: uploadedFileUrl,
                  postDescription: textController.text,
                  postUserImage: currentUserPhoto,
                  postUser: currentUserReference,
                );
                await SocialPostsRecord.collection
                    .doc()
                    .set(socialPostsCreateData);

                final locationPostsCreateData = createLocationPostsRecordData(
                  postCreated: getCurrentTimestamp,
                  postLocation: placePickerValue.city,
                  postUser: currentUserReference,
                  postUserImage: currentUserPhoto,
                );
                await LocationPostsRecord.collection
                    .doc()
                    .set(locationPostsCreateData);
                Navigator.pop(context);
              },
              text: 'Publicar',
              options: FFButtonOptions(
                width: 270,
                height: 60,
                color: Color(0xFF4B39EF),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
