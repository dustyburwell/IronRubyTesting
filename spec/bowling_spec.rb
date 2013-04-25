require 'rspec'
require File.dirname(__FILE__) + '/../lib/Bowling/bin/Debug/bowling.dll'

include Bowling

describe Game do
  let (:game) { Game.new }

  it "should score 300 for a perfect game" do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    12.times.each {|x| ls.add(10)}
    game.score(ls).should be == 300
  end

  it "should score 0 for a gutter game" do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    12.times.each {|x| ls.add(0)}
    game.score(ls).should be == 0
  end
  
  it "should score 20 for a game of all ones"  do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    20.times.each {|x| ls.add(1)}
    game.score(ls).should be == 20
  end
  
  it "should score a 20 when a 5 is thrown after a spare" do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    ([5,5,5] + 17.times.map { 0 }).each {|x| ls.add(x)}
    game.score(ls).should be == 20
  end
  
  it "should score a 24 when a strike is followed by a 3 and 4" do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    ([10,3,4] + 17.times.map { 0 }).each {|x| ls.add(x)}
    game.score(ls).should be == 24
  end

  it "should score 10 when a strike is followed by two gutter balls" do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    ([10] + 19.times.map { 0 }).each {|x| ls.add(x)}
    game.score(ls).should be == 10
  end

  it "should score 20 when a gutter is followed by rolls of 10 and 5 pins" do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    ([0,10,5] + 17.times.map { 0 }).each {|x| ls.add(x)}
    game.score(ls).should be == 20
  end
  
   it "should score 150 for rolls of all 5" do
    ls = System::Collections::Generic::List.of(Fixnum).new()
    21.times.map { 5 }.each {|x| ls.add(x)}
    game.score(ls).should be == 150
  end
end