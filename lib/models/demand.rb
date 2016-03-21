class Demand < Sequel::Model
  plugin :timestamps, update_on_create: true
  plugin :auto_validations, not_null: :presence
  plugin :validation_class_methods
  plugin :geocoder
  reverse_geocoded_by :latitude, :longitude

  many_to_one :user

  state_machine initial: :sending do
    state :sending
    state :active
    state :flagged
    state :canceled
    state :completed

    event :activate do
      transition :sending => :active
    end

    event :flag do
      transition [:sending, :active] => :flagged
    end

    event :cancel do
      transition [:sending, :active] => :canceled
    end

    event :reactivate do
      transition [:flagged, :canceled] => :active
    end

    event :complete do
      transition [:sending, :active] => :completed
    end
  end

end
