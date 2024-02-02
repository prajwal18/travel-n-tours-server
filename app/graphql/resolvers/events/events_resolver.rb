module Resolvers
  module Events
    class EventsResolver < BaseResolver
      argument :skip, Int, required: false
      argument :take, Int, required: false
      type [Types::EventType], null: false
      def resolve(skip: 0, take: 10)
        Event.order(:id).offset(skip).limit(take)
      end
    end
  end
end
