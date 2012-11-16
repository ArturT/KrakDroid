class Speaker < ActiveRecord::Base
  attr_accessible :description_en, :description_pl, :name, :organizer

  has_many :schedules

  def description
    if I18n.locale == :en
      description_en
    else
      description_pl
    end
  end
end
