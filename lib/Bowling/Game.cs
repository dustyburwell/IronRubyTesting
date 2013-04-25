using System.Collections.Generic;
using System.Linq;

namespace Bowling
{
  public class Game
  {
    public int score(IEnumerable<int> pins)
    {
      int[] apins = pins.ToArray();

      if (apins.Length <= 3)
      {
        return pins.Aggregate((a, b) => a + b);
      }

      if (is_strike(apins))
        return score_strike(apins) + score_rest_of(pins, 1);
      if (is_spare(apins))
        return score_spare(apins) + score_rest_of(pins, 2);
        
      return apins[0] + apins[1] + score_rest_of(pins, 2); 
    }
  
    private int score_rest_of(IEnumerable<int> pins, int less)
    {
      return score(pins.Skip(less).ToArray());
    }

    private int score_strike(int[] pins)
    {
      return 10 + pins[1] + pins[2];
    }

    private bool is_spare(int[] pins)
    {
      return pins[0] + pins[1] == 10;
    }

    private bool is_strike(int[] pins)
    {
      return pins[0] == 10;
    }

    private int score_spare(int[] pins)
    {
      return 10 + pins[2];
    }
  }
}
