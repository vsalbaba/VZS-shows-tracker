module ShowsHelper
  def food_for(show)
    food = []
    food << 'snídaně' if show.breakfast
    food << 'oběd' if show.lunch
    food << 'večeře' if show.dinner
    food.to_sentence
  end
end

