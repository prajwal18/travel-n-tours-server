# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :places, [PlaceType], resolver: Resolvers::Places::PlacesResolver
    field :place, PlaceType, resolver: Resolvers::Places::PlaceResolver

    field :events, [EventType], resolver: Resolvers::Events::EventsResolver
    field :event, EventType, resolver: Resolvers::Events::EventResolver
  end
end
