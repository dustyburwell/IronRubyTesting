require 'rspec'
require 'caricature'
require File.dirname(__FILE__) + '/../lib/Injecting/bin/Debug/injecting.dll'

include Caricature
include Injecting

describe ThingController do
  let (:controller) { ThingController.new }

  it "should return things from the repository" do

    repo = Isolation.for(IThingRepository)
    repo.when_receiving(:get_thing) do |exp|
      thing = Thing.new
      thing.thing_id = 45
      thing.name = 'Widget'
      exp.return thing
    end

    controller = ThingController.new(repo)

    actual = controller.get_thing(1)

    actual.thing_id.should be == 45
    actual.name.should be == 'Widget'
  end
end