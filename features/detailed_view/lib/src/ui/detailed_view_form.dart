import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:detailed_view/src/bloc/detailed_view_bloc.dart';
import 'package:flutter/material.dart';

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
            preferredSize: Size.fromHeight(30),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15.0),
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
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: state.pokemonDetailsModel.imageURL,
                  imageBuilder:
                      (BuildContext context, ImageProvider imageProvider) =>
                          Container(
                    height: 250.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Types',
                  style: TextStyles.comfortaa_light_16
                      .copyWith(color: AppColors.textColor),
                ),
                SizedBox(
                  height: 50.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(5.0),
                    itemCount: state.pokemonDetailsModel.types.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                          child: Text(
                            '${state.pokemonDetailsModel.types[index]}',
                            style: TextStyles.comfortaa_bold_14.copyWith(
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                Text(
                  'Weight: ${state.pokemonDetailsModel.weight}',
                  style: TextStyles.comfortaa_light_16
                      .copyWith(color: AppColors.textColor),
                ),
                Text(
                  'Height: ${state.pokemonDetailsModel.height}',
                  style: TextStyles.comfortaa_light_16
                      .copyWith(color: AppColors.textColor),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: state is DetailedViewStateError
                ? const Text(AppTitles.networkError)
                : const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
          ),
        );
      }
    });
  }
}
