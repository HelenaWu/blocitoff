class Item < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true
  ITEM_LIFETIME_DAYS = 7

  def days_left
    (ITEM_LIFETIME_DAYS - (Time.now - self.created_at)/1.day).round(1)
  end
end
