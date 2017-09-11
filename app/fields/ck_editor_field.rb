require "administrate/field/base"

class CkEditorField < Administrate::Field::Base
  def to_s
    ApplicationController.helpers.sanitize_content(data)
  end
end
