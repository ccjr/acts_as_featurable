# ActsAsFeaturable
module SpinBits
  module Acts #:nodoc:
    module Featurable #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_featurable
          has_many :featured_periods, :as => :featurable, :dependent => :destroy
          include SpinBits::Acts::Featurable::InstanceMethods
          extend SpinBits::Acts::Featurable::SingletonMethods
        end
      end

      # This module contains class methods
      module SingletonMethods
        # Finds all currently featured object for a specific model type
        def find_featured(*args)
          with_scope(:find => { :include => :featured_periods,
                                :conditions => ["featured_periods.expires_at>=? 
                                                 AND featured_periods.starts_at<=?
                                                 AND featured_periods.featurable_type=?", Time.now, Time.now, name] }) do
            find(*args)
          end
        end        
      end

      # This module contains instance methods
      module InstanceMethods
        # Helper method to feature a model
        def feature!(expires=1.month.from_now, starts=Time.now)
          self.featured_periods.create(:starts_at  => starts,
                                       :expires_at => expires)
        end

        # Helper method to unfeature a model
        def unfeature!
          fps = self.featured_periods.find(:all, :conditions => ["featured_periods.expires_at>=?
                                                                  AND featured_periods.starts_at<=?", Time.now, Time.now] )
          fps.each { |fp| fp.destroy }
        end
        
        # Helper method to check if a model is featured
        def featured?
          featured = self.class.find_featured(:first, :conditions => ["featurable_id=?", self.id])
          return !featured.nil?
        end
      end
    end
  end
end