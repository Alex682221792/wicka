enum ButtonStyleEnum { GRADIENT, OUTLINE, SECONDARY, FLAT }

class ButtonStyleHelper {
  int getVal(ButtonStyleEnum btnStyle) {
    switch (btnStyle) {
      case ButtonStyleEnum.GRADIENT:
        return 1;
      case ButtonStyleEnum.OUTLINE:
        return 2;
      case ButtonStyleEnum.SECONDARY:
        return 3;
    }
  }
}
