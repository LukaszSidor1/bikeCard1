public class TemperatureConverter {
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal fahrenheitToCelsius(Decimal fh) {
      Decimal cs = (fh - 32) * 5/9;
      System.debug('Executing Anonymous Apex!');
      return cs.setScale(2);
    }
  }