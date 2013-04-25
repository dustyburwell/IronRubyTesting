using System.Diagnostics;

namespace Injecting
{
  public class ThingController
  {
    private readonly IThingRepository repository;

    public ThingController(IThingRepository repository)
    {
      this.repository = repository;
    }

    public Thing GetThing(int id)
    {
      return repository.GetThing(id);
    }
  }

  public interface IThingRepository
  {
    Thing GetThing(int id);
    Thing[] GetThings();
  }

  public class ThingRepository
  {
    public Thing GetThing(int id)
    {
      Debugger.Launch();
      return null;
    }
  }

  public class Thing
  {
    public int ThingId { get; set; }
    public string Name { get; set; }
  }
}
