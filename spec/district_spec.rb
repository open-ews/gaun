require "spec_helper"

module Gaun
  RSpec.describe District do
    it "handles working with districts" do
      all_districts = District.all

      expect(all_districts).to be_a(Array)
      expect(all_districts.count).to eq(1)

      bhojpur_district = District["0101"]

      expect(bhojpur_district).to have_attributes(
        code: "0101",
        name_en: "Bhojpur",
        name_ne: "भोजपुर",
        province: have_attributes(
          code: "NP-P1",
          name_en: "Koshi",
          name_ne: "कोशी"
        )
      )
    end
  end
end
