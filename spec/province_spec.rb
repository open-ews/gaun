require "spec_helper"

module Gaun
  RSpec.describe Province do
    it "handles working with provinces" do
      all_provinces = Province.all

      expect(all_provinces).to be_a(Array)
      expect(all_provinces.count).to eq(7)
      expect(all_provinces.map(&:code)).to eq(
        %w[NP-P1 NP-P2 NP-P3 NP-P4 NP-P5 NP-P6 NP-P7]
      )

      province = Province["NP-P1"]

      expect(province).to have_attributes(
        code: "NP-P1",
        name_en: "Koshi",
        name_ne: "कोशी",
        districts: include(
          have_attributes(
            code: "0101",
            name_en: "Bhojpur",
            name_ne: "भोजपुर",
            parent_division: province,
            subdivisions: []
          )
        ),
        parent_division: nil
      )

      expect(Province.first).to eq(province)
      expect(Province.find { it.name_en == "Koshi" }).to eq(province)
    end
  end
end
