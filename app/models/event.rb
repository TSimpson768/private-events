class Event < ApplicationRecord
  belongs_to :host, class_name: 'user'
end
