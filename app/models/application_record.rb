class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  serialize :tags
end
