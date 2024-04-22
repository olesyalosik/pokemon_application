import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:detailed_view/src/bloc/detailed_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:home/home.dart';

class DetailedViewForm extends StatefulWidget {
  const DetailedViewForm({super.key});

  @override
  State<DetailedViewForm> createState() => _DetailedViewFormState();
}

class _DetailedViewFormState extends State<DetailedViewForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailedViewBloc, DetailedViewState>(
      builder: (BuildContext context, DetailedViewState state) {
        if (state is DetailedViewStateSuccess) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                Dimension.appBarWidth,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.borderColor.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 6,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: AppBar(
                  leading: InkWell(
                    onTap: () => appLocator<AppRouter>().push(HomeRoute()),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(Dimension.borderRadius),
                  )),
                  backgroundColor: AppColors.primaryColor,
                  title: Text(
                    state.pokemonDetailsModel.name,
                  ),
                  titleTextStyle: TextStyles.comfortaa_bold_24.copyWith(
                    color: AppColors.textColor,
                  ),
                  centerTitle: true,
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(Dimension.padding),
                    child: CachedNetworkImage(
                      imageUrl: state.pokemonDetailsModel.imageURL,
                      imageBuilder:
                          (BuildContext context, ImageProvider imageProvider) =>
                              Container(
                        height: Dimension.pictureSize,
                        width: Dimension.pictureSize,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor,
                              width: Dimension.borderWidth),
                          borderRadius:
                              BorderRadius.circular(Dimension.borderRadius),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      Dimension.padding,
                    ),
                    child: SizedBox(
                      height: Dimension.typesHeight,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(
                          Dimension.smallPadding,
                        ),
                        itemCount: state.pokemonDetailsModel.types.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(
                                Dimension.padding,
                              ),
                              child: Text(
                                'Types: ',
                                style: TextStyles.comfortaa_bold_16
                                    .copyWith(color: AppColors.textColor),
                              ),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.center,
                              width: Dimension.containerHeight,
                              height: Dimension.itemHeight,
                              decoration: BoxDecoration(
                                color: AppColors.cardColor,
                                borderRadius: BorderRadius.circular(
                                  Dimension.charBorderRadius,
                                ),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: Dimension.borderWidth,
                                ),
                              ),
                              child: Text(
                                '${state.pokemonDetailsModel.types[index - 1]}',
                                style: TextStyles.comfortaa_bold_14.copyWith(
                                  color: AppColors.textColor,
                                ),
                              ),
                            );
                          }
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: Dimension.divider,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      Dimension.padding,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Weight:',
                          style: TextStyles.comfortaa_bold_16
                              .copyWith(color: AppColors.textColor),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: Dimension.smallPadding,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: Dimension.containerHeight,
                            height: Dimension.itemHeight,
                            decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(
                                  Dimension.charBorderRadius),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: Dimension.borderWidth,
                              ),
                            ),
                            child: Text(
                              '${state.pokemonDetailsModel.weight} kg',
                              style: TextStyles.comfortaa_bold_14.copyWith(
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      Dimension.padding,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Height:',
                          style: TextStyles.comfortaa_bold_16.copyWith(
                            color: AppColors.textColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: Dimension.smallPadding,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: Dimension.containerHeight,
                            height: Dimension.itemHeight,
                            decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(
                                Dimension.charBorderRadius,
                              ),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: Dimension.borderWidth,
                              ),
                            ),
                            child: Text(
                              '${state.pokemonDetailsModel.height} cm',
                              style: TextStyles.comfortaa_bold_14.copyWith(
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: state is DetailedViewStateError
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(Dimension.padding),
                          child: Text(
                            AppTitles.networkError,
                            style: TextStyles.comfortaa_bold_24,
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              BlocProvider.of<DetailedViewBloc>(context).add(
                            InitDetailsEvent(url: state.url),
                          ),
                          child: const Icon(
                            Icons.restart_alt_rounded,
                            color: AppColors.primaryColor,
                            size: Dimension.iconSize,
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
            ),
          );
        }
      },
    );
  }
}
