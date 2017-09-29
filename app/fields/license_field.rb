require "administrate/field/base"

class LicenseField < Administrate::Field::Base
  def to_s
    data&.url or ""
  end
end
