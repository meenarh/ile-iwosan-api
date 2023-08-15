class HospitalAdminSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email

  # has_many :hospitals

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 3.hour
end
