class FeaturedPeriod < ActiveRecord::Base
  belongs_to :featurable, :polymorphic => true
  validates_presence_of :starts_at
end