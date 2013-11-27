class Schedule < ActiveRecord::Base
  attr_accessible :topic_pl, :topic_en, :description_pl, :description_en, :start_time, :end_time, :speaker_id, :room_id

  belongs_to :speaker
  belongs_to :room

  scope :with_time, where('start_time IS NOT NULL AND end_time IS NOT NULL')
  scope :start_time_asc, order('start_time ASC')

  validates :topic_pl, presence: true
  validates :topic_en, presence: true
  #validates :description_pl, presence: true
  #validates :description_en, presence: true
  #validates :start_time, presence: true
  #validates :end_time, presence: true
  #validates :speaker_id, presence: true
  validates :room_id, presence: true
  validate :valid_time
  validate :valid_speaker
  validate :valid_time_day

  def topic
    if I18n.locale == :en
      topic_en
    else
      topic_pl
    end
  end

  def description
    if I18n.locale == :en
      description_en
    else
      description_pl
    end
  end

  def self.last_updated
    select('updated_at').order('updated_at DESC').limit(1).first.try(:updated_at)
  end

  private

  def valid_time
    return unless start_time && end_time
    if start_time > end_time
      errors.add(:start_time, 'is greater than end time')
    end
  end

  def valid_time_day
    return unless start_time && end_time
    unless start_time.day == end_time.day
      errors.add(:start_time, 'start time day should be equal end time day')
    end

    unless start_time.month == end_time.month
      errors.add(:start_time, 'start time month should be equal end time month')
    end

    unless start_time.year == end_time.year
      errors.add(:start_time, 'start time year should be equal end time year')
    end
  end

  def valid_speaker
    speaker = Speaker.where(id: speaker_id.to_i)
    if speaker.size == 1
      if speaker.first.organizer
        errors.add(:speaker_id, 'is organizer')
      end
    end
  end
end
