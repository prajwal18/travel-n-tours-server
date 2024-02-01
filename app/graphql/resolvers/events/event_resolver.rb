module Resolvers
  module Events
    class EventResolver < BaseResolver
      type [Types::EventType], null: false
      argument :id, ID, required: true

      def resolve(id:)
        Event.find(id)
      end
    end
  end
end
