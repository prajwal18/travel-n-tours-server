module Resolvers
  module Events
    class EventsResolver < BaseResolver
      argument :skip, Int, required: false
      argument :take, Int, required: false
      type [Types::EventType], null: false
      def resolve(skip: 0, take: 0)
        if skip && take != 0
          Event.order(:id).offset(skip).limit(take)
        else
          Event.order(:id).all
        end
      end
    end
  end
end
