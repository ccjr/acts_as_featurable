# Include hook code here
require 'acts_as_featurable'
ActiveRecord::Base.send(:include, SpinBits::Acts::Featurable)
