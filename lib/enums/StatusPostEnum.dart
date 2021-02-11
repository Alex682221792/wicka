enum StatusPostEnum { PENDING, IN_PROGRESS, COMPLETED }

class ButtonStyleHelper {
  String getVal(StatusPostEnum btnStyle) {
    switch (btnStyle) {
      case StatusPostEnum.PENDING:
        return "Pendiente";
      case StatusPostEnum.IN_PROGRESS:
        return "En curso";
      case StatusPostEnum.COMPLETED:
        return "Completo";
    }
  }
}
