require "spec_helper"

module Gaun
  RSpec.describe Province do
    it "handles working with provinces" do
      all_provinces = Province.all

      expect(all_provinces).to be_a(Array)
      expect(all_provinces.count).to eq(1)

      koshi_province = Province["NP-P1"]

      expect(koshi_province).to have_attributes(
        code: "NP-P1",
        name_en: "Koshi",
        name_ne: "कोशी",
        districts: include(
          have_attributes(
            code: "0101",
            name_en: "Bhojpur",
            name_ne: "भोजपुर",
            parent_division: koshi_province,
            subdivisions: []
          )
        ),
        parent_division: nil
      )
    end
  end
end
