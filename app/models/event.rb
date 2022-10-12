class Event < ApplicationRecord

  before_create :set_defaults
  
  validates :meeting_name, presence: true
  validates :points, numericality: {:greater_than_or_equal_to => 0}
  validates_datetime :start_time, on: :create, on_or_after: :today
  validates_datetime :end_time, after: :start_time
  
  private
  def set_defaults
    self.meeting_id = loop do
    number = rand(100000..999999)
    break number unless Event.exists?(meeting_id: number)
    end
  end 
  
  
  
end
