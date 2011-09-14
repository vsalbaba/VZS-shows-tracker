# encoding: UTF-8

class StatisticsController < ApplicationController
  before_filter :login_required
  def stats
    @statistics = User.all.map {|user| Statistic.new user}
  end
end

