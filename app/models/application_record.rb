class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :default_order, -> { order('created_at desc') }
end
