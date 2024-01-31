# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Remove me later
    field :test_field, String, null: false,
    description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end

    field :places, [PlaceType], null: false
    def places
      Place.all
    end

    field :events, [EventType], null: false
    def events
      Event.all
    end
  end
end
