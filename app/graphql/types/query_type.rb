# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :places, [PlaceType], resolver: Resolvers::Places::PlacesResolver
    field :places_count, Int, resolver: Resolvers::Places::PlacesCountResolver
    field :place, PlaceType, resolver: Resolvers::Places::PlaceResolver

    field :events, [EventType], resolver: Resolvers::Events::EventsResolver
    field :events_count, Int, resolver: Resolvers::Events::EventsCountResolver
    field :event, EventType, resolver: Resolvers::Events::EventResolver
  end
end
