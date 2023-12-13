import 'package:flutter/material.dart';

class CustomStarRating extends StatefulWidget {
  const CustomStarRating(
      {super.key,
      this.rating = 0.0,
      this.iconSize = 20,
      this.emptyIconData = Icons.star_border_outlined,
      this.filledIconData = Icons.star,
      this.onRatingChange,
      this.readOnly = false,
      this.allowHalfRatings = true,
      this.color = Colors.black,
      this.borderColor = Colors.black});

  final double rating;
  final double iconSize;
  final IconData? emptyIconData;
  final IconData filledIconData;
  final Function(double rating)? onRatingChange;
  final bool readOnly;
  final bool allowHalfRatings;
  final Color color;
  final Color borderColor;

  @override
  State<CustomStarRating> createState() => _CustomStarRatingState();
}

class _CustomStarRatingState extends State<CustomStarRating> {
  late double _rating;
  late double _tempRating;

  @override
  void initState() {
    _rating = round(widget.rating);
    _tempRating = _rating;
    super.initState();
  }

  double round(double num) {
    if (widget.allowHalfRatings) {
      return roundOfToNearestPointFive(num);
    } else {
      return roundOfToNearestInt(num);
    }
  }

  double roundOfToNearestInt(double num) {
    return (num.round()).toDouble();
  }

  double roundOfToNearestPointFive(double num) {
    return (num * 2).round() / 2;
  }

  double multiplier(int index) {
    if ((_rating - index) >= 1) {
      return 1;
    } else if ((_rating - index) > 0) {
      return _rating - index;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.rating < 0 || widget.rating > 5) {
      throw RangeError("The range should be within 0 and 5");
    }

    return SizedBox(
      height: widget.iconSize,
      child: GestureDetector(
        onTapDown: (details) {
          if (!widget.readOnly) {
            if (details.localPosition.dx > 0 &&
                details.localPosition.dx < widget.iconSize * 5) {
              final double newRating =
                  round(details.localPosition.dx / widget.iconSize);
              if (_rating != newRating) {
                setState(
                  () {
                    _rating = newRating;
                    _tempRating = _rating;
                  },
                );
                widget.onRatingChange?.call(_tempRating);
              }
            }
          }
        },
        onHorizontalDragUpdate: (details) {
          if (!widget.readOnly) {
            if (details.localPosition.dx > 0 &&
                details.localPosition.dx < widget.iconSize * 5) {
              final double newRating =
                  round(details.localPosition.dx / widget.iconSize);
              if (_rating != newRating) {
                setState(
                  () {
                    _rating = newRating;
                  },
                );
              }
            }
          }
        },
        onHorizontalDragEnd: (details) {
          if (!widget.readOnly) {
            if (_tempRating != _rating) {
              _tempRating = _rating;
              widget.onRatingChange?.call(_tempRating);
            }
          }
        },
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Icon(
                  widget.emptyIconData,
                  size: widget.iconSize,
                  color: widget.borderColor,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  clipBehavior: Clip.hardEdge,
                  width: widget.iconSize * multiplier(index),
                  child: Icon(
                    widget.filledIconData,
                    size: widget.iconSize,
                    color: widget.color,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
