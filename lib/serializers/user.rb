class Serializers::User < Serializers::Base
  structure(:default) do |arg|
    {
      id: arg.id,
      first_name: arg.first_name,
      last_name: arg.last_name,
      latitude: arg.latitude,
      longitude: arg.longitude,
      created_at: arg.created_at.try(:iso8601),
      updated_at: arg.updated_at.try(:iso8601),
    }
  end

  structure(:current_user) do |arg|
    {
      id: arg.id,
      email: arg.email,
      secondary_email: arg.secondary_email,
      facebook_uid: arg.facebook_uid,
      first_name: arg.first_name,
      last_name: arg.last_name,
      latitude: arg.latitude,
      longitude: arg.longitude,
      delta: arg.delta,
      address_name: arg.address_name,
      address_thoroughfare: arg.address_thoroughfare,
      address_sub_thoroughfare: arg.address_sub_thoroughfare,
      address_sub_locality: arg.address_sub_locality,
      address_locality: arg.address_locality,
      address_sub_administrative_area: arg.address_sub_administrative_area,
      address_administrative_area: arg.address_administrative_area,
      address_country: arg.address_country,
      address_postal_code: arg.address_postal_code,
      address_complement: arg.address_complement,
      accepted_terms: arg.accepted_terms,
      reviewed_email: arg.reviewed_email,
      reviewed_location: arg.reviewed_location,
      created_at: arg.created_at.try(:iso8601),
      updated_at: arg.updated_at.try(:iso8601),
    }
  end
end
