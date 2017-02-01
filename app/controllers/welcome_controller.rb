require './lib/cric_api/request.rb'

class WelcomeController < ApplicationController
  def home
    cricApires = CricApi::Request.new('https://cricketlive.herokuapp.com', 0)
    isOffline = true
    if !isOffline
      @cricket = cricApires.cricket
      @matchCalendar = cricApires.matchCalendar
      @playerStats = cricApires.playerStats(35320)
      @commentry = cricApires.commentry(1034821)
      @news = cricApires.getNews
      @ballbyball = cricApires.ballByball(1034823)
    else
      @cricket = cricApires.jsonRead('./lib/cric_api/json_data/cricket.json')
      @matchCalendar = cricApires.jsonRead('./lib/cric_api/json_data/schedule.json')
      @playerStats = cricApires.jsonRead('./lib/cric_api/json_data/playerStat.json')
      @commentry = cricApires.jsonRead('./lib/cric_api/json_data/commentary.json')
      @news = cricApires.jsonRead('./lib/cric_api/json_data/news.json')
      @ballbyball = cricApires.jsonRead('./lib/cric_api/json_data/ballbyball.json')
      # binding.pry
    end
    
    # @getlivescore = cricApires.getLiveScores
    
    # @liveUpdates = cricApires.liveUpdates
    
  end
end
