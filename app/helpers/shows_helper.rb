module ShowsHelper
  def food_for(show)
    food = []
    food << 'snídaně' if show.breakfast
    food << 'oběd' if show.lunch
    food << 'večeře' if show.dinner
    if food.empty?
      food << 'nezajištěno'
    end
    food.to_sentence
  end

  def reward(show)
    if show.paid
      number_to_currency(@show.pay)
    else
      "#{show.payed_hours} brigádnických hodin"
    end
  end

  def subscribed_class(show, user)
    case current_user.subscribed_to?(show)
    when true then
      'subscribed'
    when false then
      'not_subscribed'
    else
      ''
    end
  end

  def subscribed_notice(show, user)
    content_tag :p, :class => subscribed_class(show, user) do
      case user.subscribed_to? show
      when true then
        'Na tuto ukázku jste přihlášeni'
      when false then
        'Na tuto ukázku jste řekli že nepojedete'
      when nil then
        ''
      end
    end
  end
end

