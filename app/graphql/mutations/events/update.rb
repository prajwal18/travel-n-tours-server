module Mutations
  module Events
    class Update < GraphQL::Schema::Mutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :place_id, ID, required: false

      type Types::EventType

      def resolve(id:, description: nil, place_id: nil, name: nil)
        event = Event.find(id)

        event.name = name if name
        event.description = description if description

        event.place_id = place_id if place_id

        event.save
        event
      end
    end
  end
end
