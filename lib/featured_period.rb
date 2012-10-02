class FeaturedPeriod < ActiveRecord::Base
  attr_accessible :starts_at, :expires_at
  belongs_to :featurable, :polymorphic => true
  validates_presence_of :starts_at
end
