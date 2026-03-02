require "spec_helper"

module Gaun
  RSpec.describe District do
    it "handles working with districts" do
      all_districts = District.all

      expect(all_districts).to be_a(Array)
      expect(all_districts.count).to eq(77)
      expect(all_districts.map(&:code).uniq.count).to eq(77)
      expect(all_districts.map(&:code)).to all(match(/\A\d{4}\z/))

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

    it "all district codes are prefixed with the province code" do
      Province.all.each do |province|
        province_code = province.code.delete_prefix("NP-P").rjust(2, "0")

        expect(province.districts.all? { it.code.start_with?(province_code) }).to be(true)
      end
    end
  end
end
