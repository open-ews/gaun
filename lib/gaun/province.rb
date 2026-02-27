module Gaun
  class Province < AdministrativeDivision
    def districts
      subdivisions
    end
  end
end
