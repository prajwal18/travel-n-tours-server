module Resolvers
  module Events
    class EventsCountResolver < BaseResolver
      type Int, null: false
      def resolve
        Event.count
      end
    end
  end
end
