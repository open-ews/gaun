# gaun (गाउँ)

[![Build](https://github.com/open-ews/gaun/actions/workflows/build.yml/badge.svg)](https://github.com/open-ews/gaun/actions/workflows/build.yml)

**Gaun** is a Ruby library providing structured **geographical and administrative data for Nepal**, including provinces, districts, municipalities, and villages.

> *गाउँ (Gaun)* means **village** in Nepali.

This gem is designed to be lightweight, easy to use, and suitable for applications that need reliable administrative region data—such as Early Warning Systems, humanitarian platforms, civic tech, and data validation pipelines.

---

## Features

* 📍 Administrative geodata for **Nepal**
* 🗺️ Hierarchical structure (Province → District → Municipality → Ward/Village)
* 🧩 Easy Ruby API
* 🚀 No external API dependencies
* 📦 Designed for offline and embedded use
* 🧑‍💻 Open source and extensible

---

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem "gaun"
```

Then execute:

```bash
bundle install
```

Or install it directly:

```bash
gem install gaun
```

---

## Usage

### Load all administrative data

```ruby
Gaun.all
```

### Provinces

```ruby
Gaun.provinces
```

```ruby
province = Gaun.provinces.first
province.name
```

### Districts

```ruby
Gaun.districts
```

```ruby
district = Gaun.districts.find { |d| d.name == "Kathmandu" }
district.province
```

### Municipalities / Local Levels

```ruby
Gaun.municipalities
```

```ruby
municipality = Gaun.municipalities.find { |m| m.name == "Lalitpur Metropolitan City" }
municipality.district
```

### Wards / Villages

```ruby
municipality.wards
```

---

## Data Model (Conceptual)

```text
Province
 └── District
      └── Municipality (Metropolitan / Sub-Metropolitan / Municipality / Rural Municipality)
           └── Ward / Village
```

Each entity exposes identifiers, Nepali and English names (where available), and parent relationships.

---

## Use Cases

* Early warning and disaster response systems
* Address normalization and validation
* Beneficiary management systems
* Government and NGO platforms
* Offline-first applications

---

## Data Sources

The data in **gaun** is compiled from publicly available Government of Nepal administrative sources and verified datasets where possible.

If you find inaccuracies or updates (e.g. administrative changes), contributions are very welcome.

---

## Development

Clone the repository and install dependencies:

```bash
git clone https://github.com/open-ews/gaun.git
cd gaun
bundle install
```

Run tests:

```bash
bundle exec rspec
```

---

## Contributing

Contributions are welcome!

* Bug reports
* Data corrections
* New administrative layers
* Performance or API improvements

Please open an issue or submit a pull request.

---

## License

This gem is released under the **MIT License**.

---

## Related Projects

* **[baan](https://github.com/open-ews/baan)** – A library containing Geodata for administrative regions in Laos
* **[pumi](https://github.com/dwilkie/pumi)**– A library containing Geodata for administrative regions in Cambodia
