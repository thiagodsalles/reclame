class SearchComplaintQuery
  def initialize(relation: Complaint.all)
    @relation = relation
  end

  def call(title: nil, company: nil, country: nil, state: nil, city: nil, latitude: nil, longitude: nil, suburb: nil)
    method(__method__).parameters.each do |_, parameter|
      value = binding.local_variable_get(parameter)
      @relation = @relation.where(parameter => value) if value
    end
    @relation
  end
end
