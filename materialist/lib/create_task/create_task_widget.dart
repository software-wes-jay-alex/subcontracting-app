import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskWidget extends StatefulWidget {
  const CreateTaskWidget({
    Key? key,
    this.projectParameter,
  }) : super(key: key);

  final ProjectsRecord? projectParameter;

  @override
  _CreateTaskWidgetState createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  DateTime? datePicked1;
  DateTime? datePicked2;
  String? statusSelectValue;
  TextEditingController? descriptionController;
  TextEditingController? taskNameController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    taskNameController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    descriptionController?.dispose();
    taskNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '5maeu8hf' /* Create List */,
          ),
          style: FlutterFlowTheme.of(context).title2,
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
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<List<ProjectsRecord>>(
            future: queryProjectsRecordOnce(
              queryBuilder: (projectsRecord) => projectsRecord.where('owner',
                  isEqualTo: currentUserReference),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              List<ProjectsRecord> createTaskFormProjectsRecordList =
                  snapshot.data!;
              return Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 570,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 12),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pop();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x2B000000),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 4, 4, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.projectParameter!
                                                        .projectName!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 12, 0, 0),
                                                    child: Text(
                                                      '${createTaskFormProjectsRecordList.length.toString()} tasks',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 60,
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 30,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'createTask_1_SelectProject',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .leftToRight,
                                                      duration: Duration(
                                                          milliseconds: 220),
                                                    ),
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: TextFormField(
                                    controller: taskNameController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '1eztr6a4' /* Task Name */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Space Grotesk',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 32, 20, 12),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Space Grotesk',
                                        ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: TextFormField(
                                    controller: descriptionController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'p0c23doi' /* Enter description here... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 32, 20, 12),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.start,
                                    maxLines: 4,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: FlutterFlowDropDown<String>(
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        're4r1lkn' /* Not Started */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ptyt1h7n' /* In Progress */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'gcvdijqn' /* Complete */,
                                      )
                                    ],
                                    onChanged: (val) =>
                                        setState(() => statusSelectValue = val),
                                    width: double.infinity,
                                    height: 60,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '9a99unmx' /* Select Status */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 15,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderWidth: 2,
                                    borderRadius: 8,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        24, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            if (kIsWeb) {
                                              final _datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePicked1Date != null) {
                                                setState(
                                                  () => datePicked1 = DateTime(
                                                    _datePicked1Date.year,
                                                    _datePicked1Date.month,
                                                    _datePicked1Date.day,
                                                  ),
                                                );
                                              }
                                            } else {
                                              await DatePicker.showDatePicker(
                                                context,
                                                showTitleActions: true,
                                                onConfirm: (date) {
                                                  setState(
                                                      () => datePicked1 = date);
                                                },
                                                currentTime:
                                                    getCurrentTimestamp,
                                                minTime: getCurrentTimestamp,
                                                locale: LocaleType.values
                                                    .firstWhere(
                                                  (l) =>
                                                      l.name ==
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                  orElse: () => LocaleType.en,
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.44,
                                            height: 50,
                                            constraints: BoxConstraints(
                                              maxWidth: 265,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 5, 12, 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      dateTimeFormat(
                                                        'yMMMd',
                                                        datePicked1,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      'Start Date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Icon(
                                                    Icons.date_range_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          if (kIsWeb) {
                                            final _datePicked2Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: datePicked1!,
                                              firstDate: datePicked1!,
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePicked2Date != null) {
                                              setState(
                                                () => datePicked2 = DateTime(
                                                  _datePicked2Date.year,
                                                  _datePicked2Date.month,
                                                  _datePicked2Date.day,
                                                ),
                                              );
                                            }
                                          } else {
                                            await DatePicker.showDatePicker(
                                              context,
                                              showTitleActions: true,
                                              onConfirm: (date) {
                                                setState(
                                                    () => datePicked2 = date);
                                              },
                                              currentTime: datePicked1!,
                                              minTime: datePicked1!,
                                              locale:
                                                  LocaleType.values.firstWhere(
                                                (l) =>
                                                    l.name ==
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                                orElse: () => LocaleType.en,
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.44,
                                          height: 50,
                                          constraints: BoxConstraints(
                                            maxWidth: 265,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 5, 12, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat(
                                                      'yMMMd',
                                                      datePicked2,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    'Due Date',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                Icon(
                                                  Icons.date_range_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (formKey.currentState == null ||
                                    !formKey.currentState!.validate()) {
                                  return;
                                }

                                final allTasksCreateData = {
                                  ...createAllTasksRecordData(
                                    taskName: taskNameController!.text,
                                    dueDate: datePicked2,
                                    description: descriptionController!.text,
                                    completed: false,
                                    owner: currentUserReference,
                                    status: statusSelectValue,
                                    projectRef:
                                        widget.projectParameter!.reference,
                                  ),
                                  'members': [currentUserReference],
                                };
                                await AllTasksRecord.collection
                                    .doc()
                                    .set(allTasksCreateData);

                                final projectsUpdateData = {
                                  'numberTasks': FieldValue.increment(1),
                                };
                                await widget.projectParameter!.reference
                                    .update(projectsUpdateData);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Task Created Successfully!',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                  ),
                                );

                                context.pushNamed(
                                  'Main_tracker',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 220),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '0pml5dft' /* Create Task */,
                              ),
                              options: FFButtonOptions(
                                width: 270,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
