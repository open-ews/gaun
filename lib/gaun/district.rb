module Gaun
  class District < AdministrativeDivision
    def province
      parent_division
    end
  end
end
