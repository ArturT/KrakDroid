ActiveAdmin.register Speaker do
  scope :all do
    Speaker
  end

  scope :speakers do
    Speaker.speakers
  end

  scope :organizers do
    Speaker.organizers
  end
end
