module DonationHelper
  def donation_bg_class(deadline)
    if deadline.today?
      'bg-danger'
    elsif deadline == Date.today.tomorrow
      'bg-warning'
    else
      'bg-success'
    end
  end

  def donation_text_class(deadline)
    if deadline.today?
      'text-danger'
    elsif deadline == Date.today.tomorrow
      'text-warning'
    else
      'text-success'
    end
  end

  def donation_fill_class(deadline)
    if deadline.today?
      'fill-danger'
    elsif deadline == Date.today.tomorrow
      'fill-warning'
    else
      'fill-success'
    end
  end

  def donation_card_class(deadline)
    if deadline.today?
      'card-danger'
    elsif deadline == Date.today.tomorrow
      'card-warning'
    else
      'card-success'
    end
  end
end
