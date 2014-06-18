class AttrDevice < ActiveRecord::Base
  belongs_to :attr
  belongs_to :device
end
