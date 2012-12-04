class Room < ActiveRecord::Base
  attr_accessible :name_en, :name_pl

  has_many :schedules, dependent: :destroy

  validates :name_pl, presence: true
  validates :name_en, presence: true

  def name
    if I18n.locale == :en
      name_en
    else
      name_pl
    end
  end
end
