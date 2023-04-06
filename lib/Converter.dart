class Converter {
  static double ntomm(double value){
    return (value * 25.4);
  }

  static double mmton(double value){
    return (value / 25.4);
  }

  static double ftocm(double value){
    return (value * 30.48);
  }

  static double cmtof(double value){
    return (value / 30.48);
  }

  static double miletokm(double value){
    return (value * 1.61);
  }

  static double kmtomile(double value){
    return (value / 1.61);
  }

  static double ydtom(double value){
    return (value * 0.914);
  }

  static double mtoyd(double value){
    return (value / 0.914);
  }

  static double mtof(double value){
    return (value * 3.28);
  }

  static double ftom(double value){
    return (value / 3.28);
  }
}