require "administrate/field/base"

class FileFieldField < Administrate::Field::Base
  def to_s
    data
  end
end
