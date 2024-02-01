module Mutations
  module Events
    class Create < GraphQL::Schema::Mutation
      argument :name, String, required: true
      argument :description, String, required: true
      argument :place_id, ID, required: true

      type Types::EventType

      def resolve(name:, description:, place_id:)
        Event.create(name:, description:, place_id:)
      end
    end
  end
end
