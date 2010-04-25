module ShowsHelper
  def food_for(show)
    food = []
    food << 'snídaně' if show.breakfast
    food << 'oběd' if show.lunch
    food << 'večeře' if show.dinner
    food.to_sentence
  end

  def reward(show)
    if show.paid
      number_to_currency(@show.pay)
    else
      "#{show.payed_hours} brigádnických hodin"
    end
  end
end

