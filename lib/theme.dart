import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff015966),
      surfaceTint: Color(0xff1d6774),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2b727f),
      onPrimaryContainer: Color(0xffbcf3ff),
      secondary: Color(0xff4a6268),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcde7ed),
      onSecondaryContainer: Color(0xff50686e),
      tertiary: Color(0xff614674),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a5e8e),
      onTertiaryContainer: Color(0xfff7e3ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8fafa),
      onSurface: Color(0xff191c1d),
      onSurfaceVariant: Color(0xff3f484a),
      outline: Color(0xff6f797b),
      outlineVariant: Color(0xffbfc8cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3132),
      inversePrimary: Color(0xff8ed1df),
      primaryFixed: Color(0xffaaedfc),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff8ed1df),
      onPrimaryFixedVariant: Color(0xff004e5a),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff051f23),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff334a50),
      tertiaryFixed: Color(0xfff2daff),
      onTertiaryFixed: Color(0xff28103b),
      tertiaryFixedDim: Color(0xffdbbaf0),
      onTertiaryFixedVariant: Color(0xff563c69),
      surfaceDim: Color(0xffd8dadb),
      surfaceBright: Color(0xfff8fafa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f4f5),
      surfaceContainer: Color(0xffeceeef),
      surfaceContainerHigh: Color(0xffe6e8e9),
      surfaceContainerHighest: Color(0xffe1e3e3),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003c45),
      surfaceTint: Color(0xff1d6774),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2b727f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223a3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff597177),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff442b58),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a5e8e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8fafa),
      onSurface: Color(0xff0e1213),
      onSurfaceVariant: Color(0xff2f383a),
      outline: Color(0xff4b5456),
      outlineVariant: Color(0xff656f71),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3132),
      inversePrimary: Color(0xff8ed1df),
      primaryFixed: Color(0xff307683),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0b5d6a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff597177),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff41595e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7e6292),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff654a78),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c7c8),
      surfaceBright: Color(0xfff8fafa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f4f5),
      surfaceContainer: Color(0xffe6e8e9),
      surfaceContainerHigh: Color(0xffdbddde),
      surfaceContainerHighest: Color(0xffd0d2d3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003139),
      surfaceTint: Color(0xff1d6774),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00515d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff183034),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354d52),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3a214d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff593e6c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8fafa),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e30),
      outlineVariant: Color(0xff424b4d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3132),
      inversePrimary: Color(0xff8ed1df),
      primaryFixed: Color(0xff00515d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003841),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354d52),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e363b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff593e6c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff412854),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7b9ba),
      surfaceBright: Color(0xfff8fafa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff1f2),
      surfaceContainer: Color(0xffe1e3e3),
      surfaceContainerHigh: Color(0xffd2d5d5),
      surfaceContainerHighest: Color(0xffc4c7c8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8ed1df),
      surfaceTint: Color(0xff8ed1df),
      onPrimary: Color(0xff00363e),
      primaryContainer: Color(0xff2b727f),
      onPrimaryContainer: Color(0xffbcf3ff),
      secondary: Color(0xffb1cbd1),
      onSecondary: Color(0xff1c3439),
      secondaryContainer: Color(0xff354d52),
      onSecondaryContainer: Color(0xffa4bdc3),
      tertiary: Color(0xffdbbaf0),
      onTertiary: Color(0xff3e2551),
      tertiaryContainer: Color(0xff7a5e8e),
      onTertiaryContainer: Color(0xfff7e3ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111415),
      onSurface: Color(0xffe1e3e3),
      onSurfaceVariant: Color(0xffbfc8cb),
      outline: Color(0xff899295),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e3e3),
      inversePrimary: Color(0xff1d6774),
      primaryFixed: Color(0xffaaedfc),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff8ed1df),
      onPrimaryFixedVariant: Color(0xff004e5a),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff051f23),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff334a50),
      tertiaryFixed: Color(0xfff2daff),
      onTertiaryFixed: Color(0xff28103b),
      tertiaryFixedDim: Color(0xffdbbaf0),
      onTertiaryFixedVariant: Color(0xff563c69),
      surfaceDim: Color(0xff111415),
      surfaceBright: Color(0xff363a3b),
      surfaceContainerLowest: Color(0xff0b0f10),
      surfaceContainerLow: Color(0xff191c1d),
      surfaceContainer: Color(0xff1d2021),
      surfaceContainerHigh: Color(0xff272a2b),
      surfaceContainerHighest: Color(0xff323536),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa4e7f6),
      surfaceTint: Color(0xff8ed1df),
      onPrimary: Color(0xff002a31),
      primaryContainer: Color(0xff579aa8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc7e1e7),
      onSecondary: Color(0xff11292e),
      secondaryContainer: Color(0xff7c959b),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffefd2ff),
      onTertiary: Color(0xff331a46),
      tertiaryContainer: Color(0xffa385b8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd5dee0),
      outline: Color(0xffaab3b6),
      outlineVariant: Color(0xff899294),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e3e3),
      inversePrimary: Color(0xff00505b),
      primaryFixed: Color(0xffaaedfc),
      onPrimaryFixed: Color(0xff001418),
      primaryFixedDim: Color(0xff8ed1df),
      onPrimaryFixedVariant: Color(0xff003c45),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff001418),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff223a3f),
      tertiaryFixed: Color(0xfff2daff),
      onTertiaryFixed: Color(0xff1d0430),
      tertiaryFixedDim: Color(0xffdbbaf0),
      onTertiaryFixedVariant: Color(0xff442b58),
      surfaceDim: Color(0xff111415),
      surfaceBright: Color(0xff424546),
      surfaceContainerLowest: Color(0xff050809),
      surfaceContainerLow: Color(0xff1b1e1f),
      surfaceContainer: Color(0xff252829),
      surfaceContainerHigh: Color(0xff303334),
      surfaceContainerHighest: Color(0xff3b3e3f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd2f6ff),
      surfaceTint: Color(0xff8ed1df),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8acddb),
      onPrimaryContainer: Color(0xff000d11),
      secondary: Color(0xffdbf5fb),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffaec7cd),
      onSecondaryContainer: Color(0xff000d11),
      tertiary: Color(0xfffaebff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd7b6ec),
      onTertiaryContainer: Color(0xff16002a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff111415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f4),
      outlineVariant: Color(0xffbbc4c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e3e3),
      inversePrimary: Color(0xff00505b),
      primaryFixed: Color(0xffaaedfc),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff8ed1df),
      onPrimaryFixedVariant: Color(0xff001418),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff001418),
      tertiaryFixed: Color(0xfff2daff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffdbbaf0),
      onTertiaryFixedVariant: Color(0xff1d0430),
      surfaceDim: Color(0xff111415),
      surfaceBright: Color(0xff4d5151),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d2021),
      surfaceContainer: Color(0xff2e3132),
      surfaceContainerHigh: Color(0xff393c3d),
      surfaceContainerHighest: Color(0xff444748),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
