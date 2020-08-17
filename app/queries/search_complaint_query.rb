class SearchComplaintQuery
  def initialize(relation: Complaint.all)
    @relation = relation
  end

  def call(title: nil, company: nil, country: nil, state: nil, city: nil, latitude: nil, longitude: nil)
    @relation = @relation.where(title: title) if title
    @relation = @relation.where(company: company) if company
    @relation = @relation.where(country: country) if country
    @relation = @relation.where(state: state) if state
    @relation = @relation.where(city: city) if city
    @relation = @relation.where(latitude: latitude) if latitude
    @relation = @relation.where(longitude: longitude) if longitude
    @relation
  end
end
