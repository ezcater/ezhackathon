class HackathonsController < ApplicationController
    def index
        @hackathons = Hackathon.all
    end
  end